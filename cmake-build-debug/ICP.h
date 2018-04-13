//
// Created by Vittorio La Barbera on 08/02/2018.
//

#ifndef LOAD_MESH_ICP_H
#define LOAD_MESH_ICP_H

#include <Eigen/Eigen>

Eigen::Transform<double , 3 , Eigen::Affine >  ICP(Eigen::MatrixXd V1, Eigen::MatrixXd V2);
//Eigen::MatrixXd  ICP(Eigen::MatrixXd V1, Eigen::MatrixXd V2);
#endif //LOAD_MESH_ICP_H
