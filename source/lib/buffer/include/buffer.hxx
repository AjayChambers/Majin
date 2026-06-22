/** ***********************************************************************
 *
 * JSON Toolbox: JSON Analyzer, Parser & Formatter
 * Copyright (C) 2026, Andrew Jay Chambers Jr.
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful, but
 *  WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  with this program. If you did not receive a copy, visit the following
 *  link <https://www.gnu.org/licenses/>.
 *
 * ************************************************************************
 *
 * FILENAME:     "buffer.hxx"
 * DIRECTORY:    "lib/buffer/include"
 * AUTHOR:       "Ajay Chambers <Ajay.Chambers@Outlook.com>"
 * REPOSITORY:   "https://GitHub.com/AjayChambers/JSON-Toolbox"
 * LICENSE:      "GNU General Public License v3.0 (GPL v3.0)"
 * DESCRIPTION:
 *   "Header file for the Buffer class, which encapsulates a contiguous
 *   block of memory containing JSON data. The Buffer class provides a
 *   simple interface for accessing the raw data, getting its size and
 *   creating iterators for traversing the data."
 *
 * ************************************************************************/

#pragma once
#include "iterator.hxx"
#include <cstddef>
#include <string>
#include <vector>


namespace JBox {
    /**********************************************************************
     * @class Buffer
     * @details "READ-ONLY Buffer class that encapsulates a contiguous
     *  block of memory. The Buffer class provides a simple interface for
     *  accessing the raw data, the data's size, and creating iterators for
     *  traversing the data."
     **********************************************************************/
    class Buffer {
      public:
        using Iterator   = JBox::BufferIterator;
        using value_type = char;
        using size_type  = std::size_t;
        using pointer    = const char *;
        using reference  = const char &;


      private:
        pointer data_; /// @private
        size_type size_; /// @private


      public: // PUBLIC INTERFACE
        // CTORS
        Buffer(const char *);
        Buffer(const std::string &);
        Buffer(const std::vector<char> &);

        // ITERATOR INTERFACE
        Iterator begin() const noexcept;
        Iterator end() const noexcept;
        Iterator iter_at(size_type) const; // Throws if (param > size)

        // ELEMENT ACCESS
        char operator[](size_type) const noexcept;
        char at(size_type) const; // Throws if (param >= size)

        // MEMBER ACCESS
        pointer data() const noexcept;
        size_type size() const noexcept;
    };
} // namespace JBox
