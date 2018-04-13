//
// Created by Vittorio La Barbera on 08/02/2018.
//
#include <iostream>
#include "ICP.h"
#include <Eigen/Eigen>
#include <ctime>

#include "nanoflann.hpp"
using namespace Eigen;
using namespace std;
using namespace nanoflann;

Transform<double , 3 , Affine > ICP(MatrixXd V1, MatrixXd V2)
{
    // WE WANT TO MATCH V1 INTO V2
    Transform <double , 3 , Affine > final_t = Transform <double , 3 , Affine >::Identity () ;


    float error = 1000.0;
    int iter = 1;

    MatrixXd mVertices1 = V1.transpose();
    // NOW WE CREATE THE K-D TREE TO FIND THE CLOSEST NEIGHBOURS
    typedef KDTreeEigenMatrixAdaptor< Eigen::Matrix<double, Dynamic, Dynamic> >  my_kd_tree_t;
    my_kd_tree_t   mat_index(V2); // by default max leaf is 10
    mat_index.index->buildIndex();

    //while(iter <= 50){

        MatrixXd matchingSet(3,V1.rows());

        // FOR EACH POINT WE NEED TO FIND THE CLOSEST NEGIHBOUR
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
            Vector3d matchingPoint = (V2.block<1,3>(ret_indexes[0], 0));

            matchingSet.block<3,1>(0,i) = matchingPoint.transpose();

        }

        Vector3d mu_1 = V1_prime.rowwise().mean(); // 3 x 1 vector
        Vector3d mu_2 = matchingSet.rowwise().mean(); // 3 x 1 vector

        Matrix3d C = Matrix3d::Zero(3, 3);
        Matrix3f rotation = Matrix3f::Zero(3, 3);

        C = (V1_prime.colwise() - mu_1) * (matchingSet.colwise() - mu_2).transpose();

        //cout << "C " << C << endl ;

        Eigen::MatrixXf C_float = C.cast <float> ();

        JacobiSVD<MatrixXf> svd(C_float, ComputeThinU | ComputeThinV);

        auto U = svd.matrixU();
        auto V = svd.matrixV();
        auto S = svd.singularValues();

        rotation = V*U.transpose();

        Eigen::Matrix3d rotation_double = rotation.cast <double> ();
        auto translation = mu_2 - rotation_double*mu_1;

        Transform <double , 3 , Affine > current_t = Transform <double , 3 , Affine >::Identity () ;
        Quaterniond q(rotation_double);
        current_t.translate(translation);
        current_t.rotate(q);

        final_t = current_t * final_t;

        //error = (( (V1 - V2*rotation_double).rowwise() - translation.transpose()).rowwise().squaredNorm()).sum();
        //cout << "error " << error << endl;
        cout << "iter " << iter << endl;
        MatrixXd transformed = current_t * mVertices1.colwise().homogeneous();
        mVertices1 = transformed;
        V1 = transformed.transpose();

        iter++;
    //}
    return final_t;
};