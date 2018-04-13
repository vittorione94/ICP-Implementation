//
// Created by Vittorio La Barbera on 22/01/2018.
//

#include <igl/readOFF.h>
#include <igl/viewer/Viewer.h>
#include <nanogui/formhelper.h>
#include <nanogui/screen.h>
#include <iostream>
#include <ctime>
#include <Eigen/Eigen>
#include <queue>
#include <list>
#include "ICP.h"
#include "ICPSubset.h"
#include "ICP_Point2Plane.h"
#include "MultiviewRegistration.h"
#include "nanoflann.hpp"

using namespace std;
using namespace Eigen;
using namespace nanoflann;

MatrixXd V1,V2,V3,V4,V5;
MatrixXi F1,F2,F3,F4,F5;

void showMeshes(igl::viewer::Viewer& viewer, MatrixXd V1, MatrixXd V2, MatrixXi F1, MatrixXi F2)
{
    MatrixXd V(V1.rows()+V2.rows(),V1.cols());

    V<<V1,V2;

    Eigen::MatrixXi F(F1.rows()+F2.rows(),F1.cols());

    F<<F1,(F2.array()+V1.rows());

    // blue color for faces of first mesh, orange for second
    MatrixXd C(F.rows(),3);
    C<< Eigen::RowVector3d(0.2,0.3,0.8).replicate(F1.rows(),1),
            Eigen::RowVector3d(1.0,0.7,0.2).replicate(F2.rows(),1);

    viewer.data.set_mesh(V, F);
    viewer.data.set_colors(C);
    viewer.core.align_camera_center(V,F);
}



bool key_down(igl::viewer::Viewer& viewer, unsigned char key, int modifier) {
    std::cout << "Key: " << key << " " << (unsigned int) key << std::endl;
    // When 3  is pressed apply one iteration of the
    // ICP algorithm
    if (key == '1') // ITERATIVE ALL POINT ICP
    {
        viewer.data.clear();

        MatrixXd mVertices1 = V1.transpose();

        time_t tstart, tend;
        tstart = time(0);


        Transform<double, 3, Affine> t1 = ICP(V1, V2);

        tend = time(0);
        cout << "To perform ICP using all the vertices it took -->  " << difftime(tend, tstart) << " second(s)."
             << endl;

        auto transformed = t1 * mVertices1.colwise().homogeneous();
        V1 = transformed.transpose();

        showMeshes(viewer, V1, V2, F1, F2);

    } else if (key == '2') {// NOISE

        viewer.data.clear();

        double sigma = 0.003;

        V1 = V1 + sigma * (Eigen::MatrixXd::Random(V1.rows(), V1.cols()));



        //V1 = current_t * V1.transpose().colwise().homogeneous();

        MatrixXd mVertices1 = V1.transpose();

        time_t tstart, tend;
        tstart = time(0);

        Transform<double, 3, Affine> t1 = ICP(V1, V2);

        tend = time(0);
        cout << "To perform ICP using all the vertices and adding noise : it took -->  " << difftime(tend, tstart) << " second(s)."
             << endl;

        auto transformed = t1 * mVertices1.colwise().homogeneous();
        V1 = transformed.transpose();

        showMeshes(viewer, V1, V2, F1, F2);

    }
    else if (key == '4') // SUBSAMPLING
    {
        viewer.data.clear();

        MatrixXd mVertices = V1.transpose();

        time_t tstart, tend;
        tstart = time(0);

        Transform<double , 3 , Affine > t1 = ICPSubset(V1, V2);

        tend = time(0);
        cout << "To perform ICP using a subset of vertices it took -->  "<< difftime(tend, tstart) <<" second(s)."<< endl;

        auto transformed = t1 * mVertices.colwise().homogeneous();
        //cout << transformed;
        V1 = transformed.transpose();

        showMeshes(viewer, V1, V2, F1, F2);

    }
    else if(key == '5'){ // MULTIVIEW REGISTRATION
        // for each scan
        viewer.data.clear();


        igl::readOBJ("../mesh1.obj", V1, F1);
        igl::readOBJ("../mesh2.obj", V2, F2);
        igl::readOBJ("../mesh3.obj", V3, F3);
        igl::readOBJ("../mesh4.obj", V4, F4);
        igl::readOBJ("../mesh5.obj", V5, F5);

        Transform <double , 3 , Affine > t1 = Transform <double , 3 , Affine >::Identity () ;
        Transform <double , 3 , Affine > t2 = Transform <double , 3 , Affine >::Identity () ;
        Transform <double , 3 , Affine > t3 = Transform <double , 3 , Affine >::Identity () ;
        Transform <double , 3 , Affine > t4 = Transform <double , 3 , Affine >::Identity () ;

        //R << cos(angle),sin(angle),0,-sin(angle), cos(angle),0,0,0,1;
        auto rot1 = AngleAxisd(0*M_PI, Vector3d::UnitY());
        t1.rotate(rot1);

        auto rot2 = AngleAxisd(0*M_PI, Vector3d::UnitY());
        t2.rotate(rot2);

        auto rot3 = AngleAxisd(0*M_PI, Vector3d::UnitY());
        t3.rotate(rot3);

        auto rot4 = AngleAxisd(0*M_PI, Vector3d::UnitY());
        t4.rotate(rot4);

        auto transformed1 = t1 * V2.transpose().colwise().homogeneous();
        auto transformed2 = t2 * V3.transpose().colwise().homogeneous();
        auto transformed3 = t3 * V4.transpose().colwise().homogeneous();
        auto transformed4 = t4 * V5.transpose().colwise().homogeneous();

        //cout << transformed;
        V2 = transformed1.transpose();
        V3 = transformed2.transpose();
        V4 = transformed3.transpose();
        V5 = transformed4.transpose();

        vector<MatrixXd> result = MultiviewRegistration(V1,V2,V3,V4,V5,F1,F2,F3,F4,F5);

        MatrixXd V = result.at(0);
        MatrixXi F = result.at(1).cast<int> ();

        //cout << "V --> " << V.rows() << "  " << V.cols() << endl;
        //cout << "F --> " << F.rows() << "  " << F.cols() << endl;

        viewer.data.set_mesh(V,F);
        viewer.core.align_camera_center(V,F);

    }
    else if (key == '6') // POINT TO PLANE
    {
        viewer.data.clear();

        MatrixXd N_vertices2(V2.rows(),V2.cols());
        igl::per_vertex_normals(V1,F1,N_vertices2);

        MatrixXd mVertices1 = V1.transpose();

        time_t tstart, tend;
        tstart = time(0);

        Transform<double , 3 , Affine > t1 = ICP_Point2Plane(V1, V2, N_vertices2);

        tend = time(0);
        cout << "To perform ICP using all the vertices it took -->  "<< difftime(tend, tstart) <<" second(s)."<< endl;

        auto transformed = t1 * mVertices1.colwise().homogeneous();
        //cout << transformed;
        V1 = transformed.transpose();
        showMeshes(viewer, V1, V2, F1, F2);

    }


    return false;
}



int main(int argc, char *argv[])
{


    // Load two meshes
    igl::readOBJ("../mesh1.obj", V1, F1);
    igl::readOBJ("../mesh2.obj", V2, F2);

    Transform <double , 3 , Affine > current_t = Transform <double , 3 , Affine >::Identity () ;
    Quaterniond q(0.5,0,0,0.5);
    current_t.rotate(q);

    MatrixXd V(V1.rows()+V2.rows(),V1.cols());

    V<<V1,V2;

    Eigen::MatrixXi F(F1.rows()+F2.rows(),F1.cols());

    // (F2.array()+V1.rows()),(F3.array()+V2.rows()),(F4.array()+V3.rows()),(F5.array()+V4.rows())
    F<<F1,(F2.array()+V1.rows());

    // blue color for faces of first mesh, orange for second
    MatrixXd C(F.rows(),3);
    C<< Eigen::RowVector3d(0.2,0.3,0.8).replicate(F1.rows(),1),
            Eigen::RowVector3d(1.0,0.7,0.2).replicate(F2.rows(),1);

    // Init the viewer
    std::cout<<R"(
                1 Switch to bump mesh
                2 Switch to fertility mesh
                )";

    igl::viewer::Viewer viewer;

    bool boolVariable = true;
    float floatVariable = 0.1f;
    enum Orientation { Up=0,Down,Left,Right } dir = Up;

    // Extend viewer menu
    viewer.callback_init = [&](igl::viewer::Viewer& viewer)
    {
        // Add new group
        viewer.ngui->addGroup("New Group");
        
        // Expose variable directly ...
        viewer.ngui->addVariable("float",floatVariable);
        
        // ... or using a custom callback
        viewer.ngui->addVariable<bool>("bool",[&](bool val) {
            boolVariable = val; // set
        },[&]() {
            return boolVariable; // get
        });

        // Expose an enumaration type
        viewer.ngui->addVariable<Orientation>("Direction",dir)->setItems({"Up","Down","Left","Right"});
        
        // Add a button
        viewer.ngui->addButton("Print Hello",[](){ std::cout << "Hello\n"; });
        
        // Add an additional menu window
        viewer.ngui->addWindow(Eigen::Vector2i(220,10),"New Window");
        
        // Expose the same variable directly ...
        viewer.ngui->addVariable("float",floatVariable);
        
        // Generate menu
        viewer.screen->performLayout();

        viewer.callback_key_down = &key_down;
        return false;
    };

    // Plot the mesh
    viewer.data.set_mesh(V, F);
    viewer.data.set_colors(C);
    viewer.launch();

}

