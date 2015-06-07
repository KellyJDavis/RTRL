//
//  arguments.cpp
//  RTLRL
//
//  Created by Kelly Davis on 23/05/2015.
//
//


#include <sstream>

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
            // Create string stream
            std::stringstream message;

            // Set message
            message << "The proper calling syntax is:\n\n";
            message << " '" << argv[0] << " <target values> <external inputs> <initial weight matrix>'\n\n";
            message << "where all passed parameters are matrix market files.";

            // Convert message to string
            m_message = message.str();

            // Flag validity
            m_is_valid = false;

            // Return
            return;
        }

        // Load matrices
        cusp::io::read_matrix_market_file(m_d, argv[1]);
        cusp::io::read_matrix_market_file(m_x, argv[2]);
        cusp::io::read_matrix_market_file(m_w, argv[3]);
    }
}
