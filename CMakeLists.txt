# Copyright (C) 2006-2018 Istituto Italiano di Tecnologia (IIT)
# Author: Alberto Cardellino alberto.cardellino@iit.it
# Author: Marco Randazzo marco.randazzo@iit.it
# All rights reserved.
#
# This software may be modified and distributed under the terms of the
# BSD-3-Clause license. See the accompanying LICENSE file for details.

cmake_minimum_required(VERSION 3.5)
project(carve-scenarios-config  VERSION 0.0.1)

set(PROJECT_DESCRIPTION "Repository with config files for demo")

# Find YARP.  Point the YARP_DIR environment variable at your build.
find_package(YARP 3.0.0 REQUIRED)
yarp_configure_external_installation(${PROJECT_NAME})

message(STATUS "Using:")
message(STATUS "  CMake: ${CMAKE_VERSION} (${CMAKE_COMMAND})")

add_subdirectory(app)

