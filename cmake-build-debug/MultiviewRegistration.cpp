//
// Created by Vittorio La Barbera on 15/02/2018.
//

#include "MultiviewRegistration.h"
#include <Eigen/Eigen>
#include <vector>
#include <igl/readOFF.h>
#include "ICPSubset.h"

using namespace Eigen;
using namespace std;


vector<MatrixXd>  MultiviewRegistration(MatrixXd V1,MatrixXd V2,MatrixXd V3,MatrixXd V4, MatrixXd V5,
                                                               MatrixXi F1,MatrixXi F2,MatrixXi F3,MatrixXi F4,MatrixXi F5){

    auto first  = ICPSubset(V2,V1);
    auto mVert = V1.transpose();
    auto transformed = first * mVert.colwise().homogeneous();
    V1 = transformed.transpose();

    auto second = ICPSubset(V3,V2);
    auto mVert2 = V2.transpose();
    auto transformed2 = second * mVert2.colwise().homogeneous();
    V2 = transformed2.transpose();

    auto third  = ICPSubset(V4,V3);
    auto mVert3 = V3.transpose();
    auto transformed3 = third * mVert3.colwise().homogeneous();
    V3 = transformed3.transpose();

    auto fourth = ICPSubset(V5,V4);
    auto mVert4 = V4.transpose();
    auto transformed4 = fourth * mVert4.colwise().homogeneous();
    V4 = transformed4.transpose();

    MatrixXd V(V2.rows()+V3.rows()+V4.rows()+V5.rows()+V1.rows(),V1.cols());

    V << V1,V2,V3,V4,V5;
    Eigen::MatrixXi F(F1.rows()+F2.rows()+F3.rows()+F4.rows()+F5.rows(),F1.cols());

    F<<F1,(F2.array()+V1.rows()),
            (F3.array()+V1.rows()+V2.rows()),
            (F4.array()+V3.rows()+V1.rows()+V2.rows()),
            (F5.array()+V4.rows()+V3.rows()+V1.rows()+V2.rows());

    //cout << "V --> " << V.rows() << "  " << V.cols() << endl;
    //cout << "F --> " << F.rows() << "  " << F.cols() << endl;

    Eigen::MatrixXd faces = F.cast <double> ();

    vector<MatrixXd>  result;
    result.push_back(V);
    result.push_back(faces);

    return result;

}