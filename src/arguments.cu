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
    // Utility functions to check arguments
    bool is_argument_number_correct(int argc, const char *prog, std::string &out_message);
    bool is_t_dim_correct(size_t d_num_rows, size_t x_num_rows, std::string &out_message);
    bool is_n_dim_correct(size_t d_num_cols, size_t w_num_rows, std::string &out_message);
    bool are_n_and_m_dim_correct(size_t d_num_cols, size_t x_num_cols, size_t w_num_cols, std::string &out_message);

    Arguments::Arguments(int argc,char *argv[])
    :   m_message(),
        m_is_valid(true),
        m_d(),
        m_x(),
        m_w()
    {
        // Check if the number of arguments is incorrect
        if(!(m_is_valid = is_argument_number_correct(argc,argv[0],m_message)))
          return;

        // Load matrices
        cusp::io::read_matrix_market_file(m_d, argv[1]);
        cusp::io::read_matrix_market_file(m_x, argv[2]);
        cusp::io::read_matrix_market_file(m_w, argv[3]);

        // Check T dimension
        if(!(m_is_valid = is_t_dim_correct(m_d.num_rows,m_x.num_rows,m_message)))
          return;

        // Check n dimension
        if(!(m_is_valid = is_n_dim_correct(m_d.num_cols,m_w.num_rows,m_message)))
          return;

        // Check n and m dimensions
        if(!(m_is_valid = are_n_and_m_dim_correct(m_d.num_cols,m_x.num_cols,m_w.num_cols,m_message)))
          return;
    }

    // Utiltiy function to check argument number
    bool is_argument_number_correct(int argc, const char *prog, std::string &out_message)
    {
        // Check if the number of arguments is incorrect
        if(argc != 4)
        {
            // Create string stream
            std::stringstream message;

            // Set message
            message << "The proper calling syntax is:\n\n";
            message << " '" << prog << " <target values> <external inputs> <initial weight matrix>'\n\n";
            message << "where all passed parameters are matrix market files.";

            // Convert message to string
            out_message = message.str();

            // Return
            return false;
        }

        // Return
        return true;
    }

    // Utiltiy function to check T dimension 
    bool is_t_dim_correct(size_t d_num_rows, size_t x_num_rows, std::string &out_message)
    {
        // Check T dimension
        if(d_num_rows != x_num_rows)
        {
            // Create string stream
            std::stringstream message;

            // Set message
            message << "The row count " << d_num_rows << " of <target values> ";
            message << "is not equal to the row count " << x_num_rows << " of <external input>.";

            // Convert message to string
            out_message = message.str();

            // Return
            return false;
        }

        // Return
        return true;
    }

    // Utiltiy function to check n dimension 
    bool is_n_dim_correct(size_t d_num_cols, size_t w_num_rows, std::string &out_message)
    {
        // Check n dimension
        if(d_num_cols != w_num_rows)
        {
            // Create string stream
            std::stringstream message;

            // Set message
            message << "The column count " << d_num_cols << " of <target values> ";
            message << "is not equal to the row count " << w_num_rows << " of <initial weight matrix>.";

            // Convert message to string
            out_message = message.str();

            // Return
            return false;
        }

        // Return
        return true;
    }

    // Utiltiy function to check n and m dimensions 
    bool are_n_and_m_dim_correct(size_t d_num_cols, size_t x_num_cols, size_t w_num_cols, std::string &out_message)
    {
        // Check n and m dimensions
        if((d_num_cols + x_num_cols) != w_num_cols)
        {
            // Create string stream
            std::stringstream message;

            // Set message
            message << "The column count " << d_num_cols << " of <target values> plus ";
            message << "the column count " << x_num_cols << " of <external input> ";
            message << "is not equal to the column count " << w_num_cols << " of <initial weight matrix>.";

            // Convert message to string
            out_message = message.str();

            // Return
            return false;
        }

        // Return
        return true;
    }
}
