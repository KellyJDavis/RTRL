//
//  arguments.cpp
//  RTLRL
//
//  Created by Kelly Davis on 23/05/2015.
//
//


#include <cusp/coo_matrix.h>
#include <cusp/io/matrix_market.h>

#include "globals.h"
#include "arguments.h"


namespace rtrl
{
    // Define globals
    cusp::coo_matrix<uint_fast64_t, float, cusp::host_memory> g_d;
    cusp::coo_matrix<uint_fast64_t, float, cusp::host_memory> g_x;
    cusp::coo_matrix<uint_fast64_t, float, cusp::device_memory> g_w;
    cusp::coo_matrix<uint_fast64_t, float, cusp::device_memory> g_y_1;

    Arguments::Arguments(int argc,char *argv[])
    :   m_message(),
        m_is_valid(true)
    {
        // Check if the number of arguments is incorrect
        if(argc != 5)
        {
            // Set message
            m_message = "Incorrect number of arguments.";

            // Flag validity
            m_is_valid = false;

            // Return
            return;
        }

        // Load matrices
        cusp::io::read_matrix_market_file(g_d, argv[1]);
        cusp::io::read_matrix_market_file(g_x, argv[2]);
        cusp::io::read_matrix_market_file(g_w, argv[3]);
        cusp::io::read_matrix_market_file(g_y_1, argv[4]);
    }
}
