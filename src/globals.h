//
//  globals.h
//  RTLRL
//
//  Created by Kelly Davis on 25/05/2015.
//
//

#ifndef RTRL_globals_h
#define RTRL_globals_h


#include <cusp/coo_matrix.h>


namespace rtrl
{
    // Target values, as defined in williams1989learning. A Txn sparse matrix
    // that contains one row for each timestep and one column for each unit.
    // If row t and column k of g_d is zero, that indicates the output for
    // unit k at time t has no target value. If that entry is non-zero, then
    // that indicates the output for unit k at time t is constrained to be
    // the specified non-zero value. Resides on the host as this will be a
    // large matrix and only need be streamed to the GPU as needed.
    // TODO: How to do targets with value 0?
    extern cusp::coo_matrix<uint_fast64_t, float, cusp::host_memory> g_d;

    // External input signals, as defined in williams1989learning. A Txm
    // sparse matrix that contains one row for each timestep and one column
    // for each external input signal.  Resides on the host as this will be
    // a large matrix and only need be streamed to the GPU as needed.
    extern cusp::coo_matrix<uint_fast64_t, float, cusp::host_memory> g_x;

    // Weight matrix, as defined in williams1989learning. A nx(n+m) matrix
    // that contains the weights for the RTRL neurual network.
    extern cusp::coo_matrix<uint_fast64_t, float, cusp::device_memory> g_w;

    // Initial outputs. A 1xn matrix that contains the initial outputs of the
    // units at time 1, as the first external input signals are applied.
    // TODO: Delete this after initial use as it is not needed after that.
    extern cusp::coo_matrix<uint_fast64_t, float, cusp::device_memory> g_y_1;
}

#endif
