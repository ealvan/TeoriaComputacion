cmake_minimum_required(VERSION 3.5)

project(AnalizadorLexico LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

file(GLOB files "*.h" "*.cpp" "*.l") # files es nombre

add_executable(AnalizadorLexico main.cpp ${files})
