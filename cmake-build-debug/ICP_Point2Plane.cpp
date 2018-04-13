//
// Created by Vittorio La Barbera on 17/02/2018.
//

#include "ICP_Point2Plane.h"
#include "nanoflann.hpp"
#include <iostream>
#include <vector>
#include <Eigen/Eigen>
#include <unsupported/Eigen/NonLinearOptimization>
using namespace Eigen;
using namespace nanoflann;
using namespace std;

Transform<double , 3 , Affine >  ICP_Point2Plane(MatrixXd V1,MatrixXd V2,MatrixXd V_N2){


    Transform <double , 3 , Affine > final_t = Transform <double , 3 , Affine >::Identity () ;
    Transform <double , 3 , Affine > current_t = Transform <double , 3 , Affine >::Identity () ;

    float error = 1000.0;
    int iter = 1;
    MatrixXd mVertices1 = V1.transpose();

    typedef KDTreeEigenMatrixAdaptor< Eigen::Matrix<double, Dynamic, Dynamic> >  my_kd_tree_t;
    my_kd_tree_t   mat_index(V2); // by default max leaf is 10
    mat_index.index->buildIndex();

    while(iter <= 1){

        // NOW WE CREATE THE K-D TREE TO FIND THE CLOSEST NEIGHBOURS

        /*
         *
         *  We want to map V1 into V2
         *  query point from V1
         *
         * */
        MatrixXd matchingSet(V1.rows(),3);
        MatrixXd matchingSetNormals(V1.rows(),3);
        //cout<< "COOL SO FAR   " << subset_mesh1.rows() << "   " << subset_mesh1.cols() << endl;
        // FOR EACH RANDMOLY SELECTED RANDOM POINT WE NEED TO FIND THE CLOSEST NEGIHBOUR
        const size_t num_results = 1;

        vector<size_t>   ret_indexes(num_results);
        vector<double> out_dists_sqr(num_results);

        KNNResultSet<double> resultSet(num_results);

        MatrixXd V1_prime = V1.transpose();

        for (int i = 0; i < V1.rows(); i++)
        {
            // SELECT THE QUERY POINT
            Vector3d query_pt = (V1_prime.block<3,1>(0,i));

            resultSet.init(&ret_indexes[0], &out_dists_sqr[0]);
            mat_index.index->findNeighbors(resultSet, &query_pt[0], SearchParams(10));
            Vector3d matchingPoint       = (V2.block<1,3>(ret_indexes[0], 0));
            Vector3d matchingPointNormal = (V_N2.block<1,3>(ret_indexes[0], 0));

            matchingSet.block<1,3>(i,0) = matchingPoint;
            matchingSetNormals.block<1,3>(i,0) = matchingPointNormal;
        }
        // solving Ax=b system
        MatrixXd A(matchingSet.rows(), matchingSet.cols()+V_N2.cols());

        for(int i = 0; i < matchingSet.rows(); i++){
            Vector3d vector1 = V1.row(i);
            Vector3d vector2 = matchingSetNormals.row(i);

            A.block<1,3>(i,0) = vector1.cross(vector2);
            A.block<1,3>(i,3) = matchingSetNormals.row(i);
        }
        // A --> Nx6
        //auto b = -( (matchingSet-V1).array()* (matchingSetNormals).array() ).matrix().rowwise().sum();

        auto A_transpose = A.transpose(); // 6 x N

        //cout << (matchingSet-V1).rows() << " " << (matchingSet-V1).cols() << endl;

        cout << A <<endl;

        double first  =  -((matchingSet-V1).array() * MatrixXd(A.block(0,0,A.rows(),1)).replicate(1,3).array() * matchingSetNormals.array()).sum();
        double second =  -((matchingSet-V1).array() * MatrixXd(A.block(0,1,A.rows(),1)).replicate(1,3).array() * matchingSetNormals.array()).sum();
        double third  =  -((matchingSet-V1).array() * MatrixXd(A.block(0,2,A.rows(),1)).replicate(1,3).array() * matchingSetNormals.array()).sum();
        double fourth =  -((matchingSet-V1).array() * MatrixXd(A.block(0,3,A.rows(),1)).replicate(1,3).array() * matchingSetNormals.array()).sum();
        double fifth  =  -((matchingSet-V1).array() * MatrixXd(A.block(0,4,A.rows(),1)).replicate(1,3).array() * matchingSetNormals.array()).sum();
        double sixth  =  -((matchingSet-V1).array() * MatrixXd(A.block(0,5,A.rows(),1)).replicate(1,3).array() * matchingSetNormals.array()).sum();

        VectorXd b(6,1);
        b << first, second, third, fourth, fifth, sixth;
        //b << sixth, fifth, fourth, third, second, first;

        cout << b <<endl;

        //Eigen::JacobiSVD<Eigen::MatrixXd> sover;
        //solver.compute(A, ComputeThinU | ComputeThinV );

        //VectorXd x = solver.solve(b);
        //VectorXd x = (A.transpose() * A).inverse() * (A.transpose() * b);

        //cout<< A << endl;
        MatrixXd C = A_transpose*A; // --> 6x6

        //cout << C.rows() << " " <<C.cols()<<endl;

        //MatrixXd c = (A.transpose()*b);

        //cout << c.rows() << " " <<c.cols()<<endl;

        VectorXd x = (C).jacobiSvd(ComputeThinU | ComputeThinV).solve(b);

        //VectorXd x = (A.transpose() * A).ldlt().solve(A.transpose() * b);

        //auto rot1 = AngleAxisd();

        //Quaternion<double> q1;  q1 = AngleAxis<double>(x(0), Vector3d::UnitX());

        //auto rot2 = AngleAxisd(x(1), Vector3d::UnitY());

        //auto rot3 = AngleAxisd(x(2), Vector3d::UnitZ());

        //Quaternion<double> q2;  q2 = AngleAxis<double>(x(1), Vector3d::UnitY());
        //Quaternion<double> q3;  q3 = AngleAxis<double>(x(2), Vector3d::UnitZ());

        //auto test1 = q1.slerp(1,q2);
        //auto test2 = test1.slerp(1,q3);

        //auto rotation = (q1*q2*q3).toRotationMatrix();

        auto cx = cos(x(0)), cy = cos(x(1)), cz = cos(x(2));
        auto sx = sin(x(0)), sy = sin(x(1)), sz = sin(x(2));

        Matrix3d rotation;
        rotation <<cy*cz, cz*sx*sy-cx*sz, cx*cz*sy+sx*sz,
                   cy*sz, cx*cz+sx*sy*sz, cx*sy*sz-cz*sx,
                    -sy,         cy*sx,          cx*cy;



        //Eigen::Matrix3d rotation_double = rotation;
        Vector3d translation;
        translation << x(3),x(4),x(5);

        Quaterniond q(rotation.transpose());
        current_t.translate(-translation);
        current_t.rotate(q);

        final_t = current_t * final_t;

        //error = (( (V1 - V2*rotation_double).rowwise() - translation.transpose()).rowwise().squaredNorm()).sum();
        //cout << "error " << error << endl;
        cout << "iter " << iter << endl;
        cout << current_t.matrix() << endl;
        auto transformed = current_t * mVertices1.colwise().homogeneous();
        mVertices1 = transformed;
        V1 = transformed.transpose();
        iter++;
    }

    cout << final_t.matrix()<<endl;
    return final_t;
}