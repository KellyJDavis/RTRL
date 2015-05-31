//
//  arguments.h
//  RTLRL
//
//  Created by Kelly Davis on 23/05/2015.
//
//

#ifndef RTRL_arguments_h
#define RTRL_arguments_h


#include <string>

#include <cusp/coo_matrix.h>


namespace rtrl
{
    /// Define matrix types
    typedef cusp::coo_matrix<uint_fast64_t, float, cusp::host_memory> HostMatrix;
    typedef cusp::coo_matrix<uint_fast64_t, float, cusp::device_memory> DeviceMatrix;

    ///
    /// This class encapsulates the command line arguments and
    /// provides an interface to these arguments for the rest
    /// of system.
    ///
    class Arguments
    {
    public:
        ///
        /// Constructs an Arguments from the user supplied
        /// command line arguments.
        ///
        /// \param argc The number of command line arguments
        /// \param argv The command line arguments
        ///
        Arguments(int argc,char *argv[]);

        ///
        /// Returns a bool indicating if the command line
        /// arguments are valid.
        ///
        /// \return A bool indicating argument validity
        ///
        bool is_valid() const;

        ///
        /// Returns a human readable string describing a
        /// reason the command line arguments are invalid.
        /// If the command line arguments are valid, the
        /// empty string is returned.
        ///
        /// \return A string describing a problem with the
        ///         command line arguments
        ///
        const std::string &get_message() const;

        ///
        /// Returns a return code apropos for any problems
        /// that arose as a result of the command line
        /// arguments
        ///
        /// \return A return code apropos for command line
        ///         argument problems.
        ///
        int get_return_code() const;

        ///
        /// Returns weight matrix, as defined in williams1989learning. A nx(n+m) matrix
        /// that contains the weights for the RTRL neurual network.
        ///
        /// @return The weight matrix
        DeviceMatrix& get_weight_matrix();

        ///
        /// Returns, target values, as defined in williams1989learning. A Txn sparse
        /// matrix that contains one row for each timestep and one column for each
        /// unit. If row t and column k of m_d is zero, that indicates the output for
        /// unit k at time t has no target value. If that entry is non-zero, then
        /// that indicates the output for unit k at time t is constrained to be
        /// the specified non-zero value. Resides on the host as this will be a
        /// large matrix and only need be streamed to the GPU as needed.
        ///
        /// @return The target values
        const HostMatrix& get_target_values() const;

        ///
        /// Returns, external input signals, as defined in williams1989learning. A Txm
        /// sparse matrix that contains one row for each timestep and one column for
        /// each external input signal.  Resides on the host as this will be a large
        /// matrix and only need be streamed to the GPU as needed.
        ///
        /// @return The external input signals
        const HostMatrix& get_external_input_signals() const;

    private:
        ///
        /// Utility function that loads a matrix market file from disk and returns a
        /// bool indicating the success of this load
        ///
        /// @param mtx The matrix into which to load the matrix
        /// @param filename The file name of the matrix market file
        /// @return A bool indicating successof the loading
        template <typename Matrix>
        bool read_matrix_market_file(Matrix& mtx, const std::string& filename);

        /// A string describing the problem with the args
        std::string m_message;

        /// A bool indicating validity
        bool m_is_valid;

        /// Target values, as defined in williams1989learning. A Txn sparse matrix
        /// that contains one row for each timestep and one column for each unit.
        /// If row t and column k of m_d is zero, that indicates the output for
        /// unit k at time t has no target value. If that entry is non-zero, then
        /// that indicates the output for unit k at time t is constrained to be
        /// the specified non-zero value. Resides on the host as this will be a
        /// large matrix and only need be streamed to the GPU as needed.
        /// TODO: How to do targets with value 0?
        HostMatrix m_d;

        /// External input signals, as defined in williams1989learning. A Txm
        /// sparse matrix that contains one row for each timestep and one column
        /// for each external input signal.  Resides on the host as this will be
        /// a large matrix and only need be streamed to the GPU as needed.
        HostMatrix m_x;

        /// Weight matrix, as defined in williams1989learning. A nx(n+m) matrix
        /// that contains the weights for the RTRL neurual network.
        DeviceMatrix m_w;
    };

}

#include "arguments-inl.h"

#endif
