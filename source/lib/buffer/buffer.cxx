/******
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
 * FILENAME:     "buffer.cxx"
 * DIRECTORY:    "source/lib/buffer"
 * AUTHOR:       "Ajay Chambers <Ajay.Chambers@Outlook.com>"
 * REPOSITORY:   "https://GitHub.com/AjayChambers/JSON-Toolbox"
 * LICENSE:      "GNU General Public License v3.0 (GPL v3.0)"
 * DESCRIPTION:
 *  "Implementation file for the Buffer class, which encapsulates a
 *  contiguous block of memory containing JSON data. The Buffer class
 *  provides a simple interface for accessing the raw data, getting its
 *  size and creating iterators for traversing the data."
 *
 * **********************************************************************/

#include "include/buffer.hxx"
#include <stdexcept>


namespace JBox
{ // Buffer Traits
using value_type = Buffer::value_type;
using size_type  = Buffer::size_type;
using pointer    = Buffer::pointer;
using reference  = Buffer::reference;
using Iterator   = Buffer::Iterator;


/**
 * @brief Constructs a Buffer from a C-style string.
 * @param data Pointer to the C-style string.
 **/
Buffer::Buffer(const char *data)
  : data_(data),
    size_(data ? std::strlen(data) : 0)
{}


/**
 * @brief Constructs a Buffer from a std::string.
 * @param data The std::string containing the data.
 **/
Buffer::Buffer(const std::string &data)
  : data_(data.c_str()),
    size_(data.size())
{}


/**
 * @brief Constructs a Buffer from a std::vector<char>.
 * @param data The vector<char> containing the data.
 **/
Buffer::Buffer(const std::vector<char> &data)
  : data_(data.data()),
    size_(data.size())
{}


/**
 * @brief Creates an iterator pointing to the beginning of the buffer.
 * @return Iterator pointing to the beginning of the buffer.
 **/
Iterator Buffer::begin() const noexcept
{
    return Iterator(data_);
}


/**
 * @brief Creates an iterator pointing to the end of the buffer.
 * @return Iterator pointing to the end of the buffer.
 **/
Iterator Buffer::end() const noexcept
{
    pointer end_ptr = data_ + size_;
    return Iterator(end_ptr);
}


/**
 * @brief Creates an iterator pointing to a specific index in the buffer.
 * @param index The index to create the iterator at.
 * @return Iterator pointing to the specified index in the buffer.
 * @throws std::out_of_range if the index is out of bounds.
 **/
Iterator Buffer::iter_at(size_type index) const
{
    if (index > size_) {
        throw std::out_of_range("Buffer::iter_at index out of range");
    }

    return Iterator(data_ + index);
}


/**
 * @brief Returns the character at the specified index in the buffer.
 * @param index The index of the character to return.
 * @return The character at the specified index.
 **/
char Buffer::operator[](size_type index) const noexcept
{
    return data_[index];
}


/**
 * @brief Returns the character at the specified index in
 *   the buffer.
 * @param index The index of the character to return.
 * @return The character at the specified index.
 * @throws `std::out_of_range` if the value of the
 * `Buffer::at(size_type index)` function's `index`
 *  parameter is greater-than or equal-to the size of the
 *  buffer class instance (e.g. `Buffer::size()`).
 * *********************************************************/
char Buffer::at(size_type index) const
{

    if (index >= size_) {

        throw std::out_of_range(
          "ERROR: 'OUT_OF_RANGE'"
          "  |- ISSUE: \"The Buffer::at index parameter was passed an argument that was\n"
          "  |-   greater than the size of the buffer instance that called 'at()'.\""
          "  |-"
          "  |- SOLUTION: \"Ensure that the value being passed into Buffer::at(index)\n"
          "  |-   cannot ever become greater than the the Buffer instance that calls "
          "it.\n"
          "\n|"
          "  |- Buffer::size() = "
          + std::to_string(size_) + "");
    }


    return data_[index];
}


/**
 * @brief Returns a pointer to the buffer's data.
 * @return Pointer to the buffer's data.
 **/
pointer Buffer::data() const noexcept
{
    return data_;
}


/**
 * @brief Returns the size of the buffer.
 * @return Size of the buffer.
 **/
size_type Buffer::size() const noexcept
{
    return size_;
}
} // namespace JBox
