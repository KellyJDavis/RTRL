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
        m_is_valid(true)
    {
        // Check if there are to few arguments
        if(argc < 3)
        {
            // Set message
            m_message = "To few arguments.";

            // Flag validity
            m_is_valid = false;

            // Return
            return;
        }
    }
}
