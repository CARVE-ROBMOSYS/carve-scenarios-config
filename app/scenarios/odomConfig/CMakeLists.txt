# Copyright (C) 2006-2018 Istituto Italiano di Tecnologia (IIT)
# Author: Alberto Cardellino alberto.cardellino@iit.it
# Author: Marco Randazzo marco.randazzo@iit.it
# All rights reserved.
#
# This software may be modified and distributed under the terms of the
# BSD-3-Clause license. See the accompanying LICENSE file for details.


set(appName odomConfig)

file(GLOB appFiles ${CMAKE_CURRENT_SOURCE_DIR}/*.*)
list(REMOVE_ITEM appFiles "${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt")

yarp_install(FILES ${appFiles}    DESTINATION ${CARVE-SCENARIOS-CONFIG_CONTEXTS_INSTALL_DIR}/${appName})
