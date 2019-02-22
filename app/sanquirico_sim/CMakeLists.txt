#
# Copyright (C) 2016 iCub Facility - IIT Istituto Italiano di Tecnologia 
# Author: Marco Randazzo marco.randazzo@iit.it
# CopyPolicy: Released under the terms of the GNU GPL v2.0.
#

set(appName sanquirico_sim)

file(GLOB appFiles ${CMAKE_CURRENT_SOURCE_DIR}/*.*)
list(REMOVE_ITEM appFiles "${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt")

yarp_install(FILES ${appFiles}    DESTINATION ${CARVE-SCENARIOS-CONFIG_CONTEXTS_INSTALL_DIR}/${appName})

