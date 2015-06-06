//
//  arguments-inl.h
//  RTLRL
//
//  Created by Kelly Davis on 23/05/2015.
//
//

#ifndef RTRL_arguments_inl_h
#define RTRL_arguments_inl_h

#include <sstream>
#include <exception>

#include <cusp/coo_matrix.h>
#include <cusp/io/matrix_market.h>


namespace rtrl
{
    inline bool Arguments::is_valid() const
    {
        return m_is_valid;
    }

    inline const std::string &Arguments::get_message() const
    {
        return m_message;
    }

    inline int Arguments::get_return_code() const
    {
        return m_is_valid ? 0 : 1;
    }

    inline DeviceMatrix& Arguments::get_weight_matrix()
    {
      return m_w;
    }

    inline const HostMatrix& Arguments::get_target_values() const
    {
      return m_d;
    }

    inline const HostMatrix& Arguments::get_external_input_signals() const
    {
      return m_x;
    }

    template <typename Matrix>
    inline bool Arguments::read_matrix_market_file(Matrix& mtx, const std::string& filename)
    {
        // Try to load matrices
        try
        {
            cusp::io::read_matrix_market_file(mtx, filename);
        }
        catch(const std::exception& exception)
        {
            // Create string stream
            std::stringstream message;

            // Add filename to message
            message << "Error in reading file '" << filename << "'. ";

            // Add error message to message
            message << "Error message: '" << exception.what() << "'.";

            // Convert message to string
            m_message = message.str();

            // Flag validity
            m_is_valid = false;
        }

        // Return validity
        return m_is_valid;
    }
}

#endif
