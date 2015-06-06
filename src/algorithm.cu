//
//  algorithm.cpp
//  RTLRL
//
//  Created by Kelly Davis on 06/06/2015.
//
//


#include <cstdio>

#include <cusp/coo_matrix.h>

#include "algorithm.h"


namespace rtrl
{
    void Algorithm::run()
    {
       // TODO
    }

    void Algorithm::save()
    {
        // Obtain unique weight matrix filename
        const char *filename = tmpnam(0);

        // Write weght matrix to filename
        write_matrix_market_file(m_arguments.get_weight_matrix(),filename);
    }
}
