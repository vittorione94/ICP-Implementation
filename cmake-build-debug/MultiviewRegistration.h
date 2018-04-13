//
// Created by Vittorio La Barbera on 15/02/2018.
//

#ifndef LOAD_MESH_MULTIVIEWREGISTRATION_H
#define LOAD_MESH_MULTIVIEWREGISTRATION_H

#include <Eigen/Eigen>
#include <vector>


using namespace Eigen;
using namespace std;

vector<MatrixXd>  MultiviewRegistration(MatrixXd V1,MatrixXd V2,MatrixXd V3,MatrixXd V4, MatrixXd V5,
                                                                      MatrixXi F1,MatrixXi F2,MatrixXi F3,MatrixXi F4,MatrixXi F5);

#endif //LOAD_MESH_MULTIVIEWREGISTRATION_H
