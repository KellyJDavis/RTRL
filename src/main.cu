//
//  main.cpp
//  RTLRL
//
//  Created by Kelly Davis on 23/05/2015.
//
//


#include <iostream>

#include "algorithm.h"
#include "arguments.h"


using namespace rtrl;

int main (int argc,char * argv[])
{
    // Initialize the user arguments
    Arguments arguments(argc,argv);

    // Determine if arguments is not valid
    if(!arguments.is_valid())
    {
        // Print error message for invalid arguments
        std::cout << arguments.get_message() << std::endl;

        // Return error
        return arguments.get_return_code();
    }

    // Create Algorithm
    Algorithm algorithm(arguments);

    // Run algorithm
    algorithm.run();

    // Save results
    algorithm.save();

    // Return success
    return 0;
}

