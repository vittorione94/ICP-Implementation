//
// Created by Vittorio La Barbera on 17/02/2018.
//

#ifndef LOAD_MESH_ICP_POINT2PLANE_H
#define LOAD_MESH_ICP_POINT2PLANE_H

#include <Eigen/Eigen>

using namespace Eigen;

Transform<double , 3 , Affine >  ICP_Point2Plane(MatrixXd V1,MatrixXd V2,MatrixXd V_N1);


#endif //LOAD_MESH_ICP_POINT2PLANE_H
