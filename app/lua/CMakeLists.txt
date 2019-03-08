#
# Copyright (C) 2019 iCub Facility - IIT Istituto Italiano di Tecnologia 
# Author: Alberto Cardellino alberto.cardellino@iit.it
# CopyPolicy: Released under the terms of the GNU GPL v2.0.
#

set(appName speech-recognition-lua)

file(GLOB lua_bin ${CMAKE_CURRENT_SOURCE_DIR}/*.lua)

# create the bin folder and copy lua script there (this repo does not have exeutables, so bin folder is not created by default)
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/bin/)
file(COPY ${lua_bin}  DESTINATION  ${CMAKE_BINARY_DIR}/bin/)

