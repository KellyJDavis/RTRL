//
//  algorithm.h
//  RTLRL
//
//  Created by Kelly Davis on 06/06/2015.
//
//

#ifndef RTRL_algorithm_h
#define RTRL_algorithm_h


#include "arguments.h"


namespace rtrl
{
    ///
    /// This class encapsulates the RTRL algorithm.
    ///
    class Algorithm
    {
    public:
        ///
        /// Constructs an RTRL Algorithm from the passed Arguments
        ///
        /// \param arguments The Arguments used to construct the RTRL Algorithm
        ///
        Algorithm(const Arguments& arguments);

        ///
        /// Runs the RTRL Algorithm
        ///
        void run();

        ///
        /// Saves the weight matrix of the RTRL Algorithm into a unique file
        ///
        void save();
    private:
        /// Command line Arguments
        const Arguments& m_arguments;
    };
}

#include "algorithm-inl.h"

#endif
