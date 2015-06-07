//
//  algorithm.cpp
//  RTLRL
//
//  Created by Kelly Davis on 06/06/2015.
//
//


#include <stdlib.h>
#include <iostream>

#include <cusp/io/matrix_market.h>

#include "algorithm.h"


namespace rtrl
{
    void Algorithm::run()
    {
       // TODO
    }

    void Algorithm::save()
    {
        // Define template weight matrix filename
        char filename[] ="weight_matrix_XXXXXX";

        // Obtain unique weight matrix filename
        mkstemp(filename);

        // Write weght matrix to filename
        cusp::io::write_matrix_market_file(m_arguments.get_weight_matrix(),filename);

        // Print status message
        std::cout << "Final weight matrix written to '" << filename << "'." << std::endl;        
    }
}
