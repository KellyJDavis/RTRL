//
//  arguments-inl.h
//  RTLRL
//
//  Created by Kelly Davis on 23/05/2015.
//
//

#ifndef RTRL_arguments_inl_h
#define RTRL_arguments_inl_h


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
}

#endif
