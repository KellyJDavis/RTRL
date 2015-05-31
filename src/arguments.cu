//
//  arguments.cpp
//  RTLRL
//
//  Created by Kelly Davis on 23/05/2015.
//
//


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
            m_message  = "The proper calling syntax is:";
            m_message += "\n\n  '";
            m_message += argv[0];
            m_message += " <target values> <external inputs> <initial weight matrix>'\n\n";
            m_message += "where all passed parameters are matrix market files.";

            // Flag validity
            m_is_valid = false;

            // Return
            return;
        }

        // Load matrices
        read_matrix_market_file(m_d, argv[1]);
        read_matrix_market_file(m_x, argv[2]);
        read_matrix_market_file(m_w, argv[3]);
    }
}
