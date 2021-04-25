#define DOCTEST_CONFIG_IMPLEMENT
#include "../tests/doctest.h"
#include <iostream>

int main(int argc, char** argv) {
    std::cout << "Hello World!" << std::endl;
    doctest::Context context;
    context.applyCommandLine(argc, argv);
    return context.run();
}
