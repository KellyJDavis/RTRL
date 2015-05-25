//
//  arguments.cpp
//  RTLRL
//
//  Created by Kelly Davis on 23/05/2015.
//
//


#include <exception>

#include <cusp/coo_matrix.h>
#include <cusp/io/matrix_market.h>

#include "arguments.h"


namespace rtrl
{
    Arguments::Arguments(int argc,char *argv[])
    :   m_message(),
        m_is_valid(true),
        m_d(),
        m_x(),
        m_w()
    {
        // Check if the number of arguments is incorrect
        if(argc != 4)
        {
            // Set message
            m_message = "Incorrect number of arguments.";

            // Flag validity
            m_is_valid = false;

            // Return
            return;
        }

        // Try to load matrices
        try
        {
            cusp::io::read_matrix_market_file(m_d, argv[1]);
            cusp::io::read_matrix_market_file(m_x, argv[2]);
            cusp::io::read_matrix_market_file(m_w, argv[3]);
        }
        catch(const std::exception& exception)
        {
            // Set message
            m_message = exception.what();

            // Flag validity
            m_is_valid = false;
        }
    }
}
