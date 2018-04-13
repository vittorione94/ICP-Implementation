//
// Created by Vittorio La Barbera on 12/02/2018.
//

#ifndef LOAD_MESH_ICPSUBSET_H
#define LOAD_MESH_ICPSUBSET_H

#include <Eigen/Eigen>

Eigen::Transform <double , 3 , Eigen::Affine >  ICPSubset(Eigen::MatrixXd V1, Eigen::MatrixXd V2);

#endif //LOAD_MESH_ICPSUBSET_H
