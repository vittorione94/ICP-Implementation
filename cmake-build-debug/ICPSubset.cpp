//
// Created by Vittorio La Barbera on 08/02/2018.
//
#include <iostream>
#include "ICPSubset.h"
#include <Eigen/Eigen>
#include "nanoflann.hpp"
using namespace Eigen;
using namespace std;
using namespace nanoflann;

Transform<double , 3 , Affine >ICPSubset(MatrixXd V1, MatrixXd V2)
{
    // NOTE : V1 AND V2 ARE OF SIZE NX3 WHERE N IS THE NUMBER OF VERTICES
    // RANDOMLY SELECT A SUBSET OF POINTS P_i FROM THE
    // FIRST MESH
    auto V1_prime = V1.transpose();
    int iter = 1;

    Transform <double , 3 , Affine > final_t = Transform <double , 3 , Affine >::Identity () ;


    while(iter <= 30) {
        srand(time(0));
        int lower = 0, upper = V1_prime.cols()-1, count = 5000, i = 0;
        MatrixXd subset_mesh1(3, count);

        for (i = 0; i < count; i++) {
            int num = (rand() + lower) % (upper + 1);
            subset_mesh1.block<3, 1>(0, i) = V1_prime.block<3, 1>(0, num);
        }
        // NOW WE CREATE THE K-D TREE TO FIND THE CLOSEST NEIGHBOURS
        typedef KDTreeEigenMatrixAdaptor<Eigen::Matrix<double, Dynamic, Dynamic> > my_kd_tree_t;

        my_kd_tree_t mat_index(V2, 10);
        mat_index.index->buildIndex();

        const size_t num_results = 1;
        vector<size_t> ret_indexes(num_results);
        vector<double> out_dists_sqr(num_results);

        KNNResultSet<double> resultSet(num_results);

        MatrixXd matchingSet(3, subset_mesh1.cols());

        // FOR EACH RANDMOLY SELECTED RANDOM POINT WE NEED TO FIND THE CLOSEST NEGIHBOUR
        for (i = 0; i < subset_mesh1.cols(); i++) {
            // SELECT THE QUERY POINT
            Vector3d query_pt = (subset_mesh1.block<3, 1>(0, i));
            resultSet.init(&ret_indexes[0], &out_dists_sqr[0]);
            mat_index.index->findNeighbors(resultSet, &query_pt[0], SearchParams(10));
            Vector3d matchingPoint = (V2.block<1, 3>(ret_indexes[0], 0));
            matchingSet.block<3, 1>(0, i) = matchingPoint.transpose();
        }

        Vector3d mu_1 = subset_mesh1.rowwise().mean(); // 3 x 1 vector
        Vector3d mu_2 = matchingSet.rowwise().mean(); // 3 x 1 vector

        Matrix3d C = Eigen::Matrix3d::Zero(3, 3);
        Matrix3f rotation = Eigen::Matrix3f::Zero(3, 3);

        C = (subset_mesh1.colwise() - mu_1) * (matchingSet.colwise() - mu_2).transpose();

        Eigen::MatrixXf C_float = C.cast<float>();

        JacobiSVD<MatrixXf> svd(C_float, ComputeThinU | ComputeThinV);

        auto U = svd.matrixU();
        auto V = svd.matrixV();
        auto S = svd.singularValues();

        //cout << "S : " << S << endl;
        //cout << "V : " << V << endl;
        //cout << "U : " << U << endl;

        rotation = V * U.transpose();

        //cout << "rotation : " << rotation << endl;

        Eigen::Matrix3d rotation_double = rotation.cast<double>();
        auto translation = mu_2 - rotation_double * mu_1;

        Transform <double , 3 , Affine > current_t = Transform <double , 3 , Affine >::Identity () ;
        Quaterniond q(rotation_double);
        current_t.translate(translation);
        current_t.rotate(q);

        final_t = current_t * final_t;

        auto transformed = current_t * V1_prime.colwise().homogeneous();
        V1_prime = transformed;

        //double error = (( (subset_mesh1 - matchingSet*rotation_double).rowwise() - translation.transpose()).rowwise().squaredNorm()).sum();
        cout << "iteration  " << iter << endl;
        iter++;
    }
    return final_t;
};