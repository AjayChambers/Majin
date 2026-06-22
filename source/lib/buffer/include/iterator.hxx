
/** ***********************************************************************
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
 * FILENAME:    "iterator.hxx"
 * DIRECTORY:   "source/lib/buffer/include"
 * AUTHOR:      "Ajay Chambers <Ajay.Chambers@Outlook.com>"
 * REPOSITORY:  "Https://GitHub.com/AjayChambers/JSON-Toolbox.git"
 * LICENSE:     "GNU General Public License v3.0 (GPL v3.0)"
 * DESCRIPTION:
 *  "Header file for the BufferIterator class, which is a 'const' random
 *  access iterator designed for traversing, analyzing, interpreting,
 *  parsing, and manipulating JSON data in a contiguous memory buffer."
 *
 * ********************************************************************* */

#pragma once
#include <cstddef>
#include <iterator>


namespace JBox {

    /**********************************************************************
     * @brief "Iterator is a 'const' random access iterator that has
     *    been created specifically for the Analyzer class (Analyzer static
     *    library), which is used for traversing, analyzing, interpreting,
     *    parsing, and manipulating JSON data in a contiguous memory
     *    buffer."
     **********************************************************************/
    class BufferIterator {
      public:
        using iterator_category = std::random_access_iterator_tag;
        using value_type        = char;
        using difference_type   = std::ptrdiff_t;
        using pointer           = const char *;
        using reference         = const char &;


      private:
        pointer ptr_;


      public: // PUBLIC INTERFACE
        /** ***************************************************************
         * @brief Default constructor. Initializes the iterator to a null
         *  pointer.
         ****************************************************************/
        constexpr BufferIterator() noexcept
          : ptr_(nullptr)
        {}



        /** ***************************************************************
         * @brief Constructs a BufferIterator with the given pointer.
         * @param p Pointer to the current position in the buffer.
         * ****************************************************************/
        constexpr explicit BufferIterator(pointer p) noexcept
          : ptr_(p)
        {}



        /** ***************************************************************
         * @brief Constructs a BufferIterator with the given parameters.
         * @param current Pointer to the current position in the buffer.
         * @param end Pointer to the end of the buffer.
         * @param begin Pointer to the beginning of the buffer.
         * ****************************************************************/
        constexpr reference operator*() const noexcept { return *ptr_; }



        /** ***************************************************************
         * @brief Returns a pointer to the current position in the buffer.
         * ****************************************************************/
        constexpr pointer operator->() const noexcept { return ptr_; }



        /** ***************************************************************
         * @brief Pre-increment operator. Advances the iterator to the next
         *  position.
         * @return Reference to the incremented iterator.
         * ****************************************************************/
        constexpr BufferIterator &operator++() noexcept
        {
            ++ptr_;
            return *this;
        }



        /** ***************************************************************
         * @brief Post-increment operator. Advances the iterator to the
         *  next position.
         * @return A copy of the iterator before it was incremented.
         * ****************************************************************/
        constexpr BufferIterator operator++(int) noexcept
        {
            return BufferIterator(ptr_++);
        }



        /** ***************************************************************
         * @brief Pre-decrement operator. Moves the iterator to the previous
         *  position.
         * @return Reference to the decremented iterator.
         * ****************************************************************/
        constexpr BufferIterator &operator--() noexcept
        {
            --ptr_;
            return *this;
        }



        /** ***************************************************************
         * @brief Post-decrement operator. Moves the iterator to the previous
         *  position.
         * @return A copy of the iterator before it was decremented.
         * ****************************************************************/
        constexpr BufferIterator operator--(int) noexcept
        {
            return BufferIterator(ptr_--);
        }



        /** ***************************************************************
         * @brief Compound assignment operator for addition. Advances the
         *  iterator by a specified number of positions.
         * @param n The number of positions to advance the iterator.
         * @return Reference to the advanced iterator.
         * ****************************************************************/
        constexpr BufferIterator &operator+=(difference_type n) noexcept
        {
            ptr_ += n;
            return *this;
        }



        /** ***************************************************************
         * @brief Compound assignment operator for subtraction. Moves the
         *  iterator back by a specified number of positions.
         * @param n The number of positions to move the iterator back.
         * @return Reference to the moved iterator.
         * ****************************************************************/
        constexpr BufferIterator &operator-=(difference_type n) noexcept
        {
            ptr_ -= n;
            return *this;
        }



        /** ***************************************************************
         * @brief Addition operator. Advances the iterator by a specified
         *  number of positions.
         * @param n The number of positions to advance the iterator.
         * @return A new iterator advanced by the specified number of
         *  positions.
         * ****************************************************************/
        constexpr BufferIterator operator+(difference_type n) const noexcept
        {
            return BufferIterator(ptr_ + n);
        }



        /** ***************************************************************
         * @brief Subtraction operator. Moves the iterator back by a
         *  specified number of positions.
         * @param n The number of positions to move the iterator back.
         * @return A new iterator moved back by the specified number of
         *  positions.
         * ****************************************************************/
        constexpr BufferIterator operator-(difference_type n) const noexcept
        {
            return BufferIterator(ptr_ - n);
        }



        /** ***************************************************************
         * @brief Difference operator. Calculates the distance between two
         *  iterators.
         * @param other The other iterator to compare with.
         * @return The number of positions between the two iterators.
         * ****************************************************************/
        constexpr difference_type operator-(const BufferIterator &other) const noexcept
        {
            return ptr_ - other.ptr_;
        }



        /** ***************************************************************
         * @brief Subscript operator. Accesses the element at a specified
         *  position relative to the current iterator position.
         * @param n The number of positions to offset from the current
         *  iterator position.
         * @return Reference to the element at the specified position.
         * ****************************************************************/
        constexpr reference operator[](difference_type n) const noexcept
        {
            return ptr_[n];
        }



        /** ***************************************************************
         * @brief Equality operator. Checks if two iterators are equal.
         * @param other The other iterator to compare with.
         * @return True if the iterators are equal, false otherwise.
         * ****************************************************************/
        constexpr bool operator==(const BufferIterator &other) const noexcept
        {
            return ptr_ == other.ptr_;
        }



        /** ***************************************************************
         * @brief Inequality operator. Checks if two iterators are not
         *  equal.
         * @param other The other iterator to compare with.
         * @return True if the iterators are not equal, false otherwise.
         * ****************************************************************/
        constexpr bool operator!=(const BufferIterator &other) const noexcept
        {
            return ptr_ != other.ptr_;
        }



        /** ***************************************************************
         * @brief Less-than operator. Checks if this iterator is less than
         *  another iterator.
         * @param other The other iterator to compare with.
         * @return True if this iterator is less than the other iterator,
         *  false otherwise.
         * ****************************************************************/
        constexpr bool operator<(const BufferIterator &other) const noexcept
        {
            return ptr_ < other.ptr_;
        }



        /** ***************************************************************
         * @brief Greater-than operator. Checks if this iterator is greater
         *  than another iterator.
         * @param other The other iterator to compare with.
         * @return True if this iterator is greater than the other
         *  iterator, false otherwise.
         * ****************************************************************/
        constexpr bool operator>(const BufferIterator &other) const noexcept
        {
            return ptr_ > other.ptr_;
        }



        /** ***************************************************************
         * @brief Less-than or equal operator. Checks if this iterator is
         *  less than or equal to another iterator.
         * @param other The other iterator to compare with.
         * @return True if this iterator is less than or equal to the
         *  other iterator, false otherwise.
         * ****************************************************************/
        constexpr bool operator<=(const BufferIterator &other) const noexcept
        {
            return ptr_ <= other.ptr_;
        }



        /** ***************************************************************
         * @brief Greater-than or equal operator. Checks if this iterator
         *  is greater than or equal to another iterator.
         * @param other The other iterator to compare with.
         * @return True if this iterator is greater than or equal to the
         *  other iterator, false otherwise.
         * ****************************************************************/
        constexpr bool operator>=(const BufferIterator &other) const noexcept
        {
            return ptr_ >= other.ptr_;
        }
    };

} // namespace JBox
