cmake_minimum_required(VERSION 3.18)
project(
  cpp-template
  VERSION 1.0
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_VERBOSE_MAKEFILE ON)

# --- Conan ---
if(CONAN_EXPORTED)
  include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
  conan_basic_setup()
else()
  if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(
      STATUS
        "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD
         "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake"
         "${CMAKE_BINARY_DIR}/conan.cmake" TLS_VERIFY ON)
  endif()
  include(${CMAKE_BINARY_DIR}/conan.cmake)
  conan_cmake_run(CONANFILE conan/conanfile.txt BASIC_SETUP BUILD missing)
  # conan_cmake_run( REQUIRES wxwidgets/3.1.2@bincrafters/stable BASIC_SETUP
  # BUILD missing )
endif()

# ---- Add source files ----
file(GLOB PROJECT_SOURCES CONFIGURE_DEPENDS "src/*.h" "src/*.cpp")

add_executable(${CMAKE_PROJECT_NAME} ${PROJECT_SOURCES})
target_link_libraries(${CMAKE_PROJECT_NAME} ${CONAN_LIBS})
