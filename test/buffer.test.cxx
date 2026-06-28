#include <gtest/gtest.h>
#include "buffer.hxx"
#include "iterator.hxx"

using JBox::Buffer;
using JBox::BufferIterator;

// -------------------------------------------------------------
// Helper
// -------------------------------------------------------------
static constexpr const char *kSample = "Hello, JSON!";

// -------------------------------------------------------------
// Buffer: Constructors
// -------------------------------------------------------------
TEST(BufferTest, ConstructFromCString) {
    Buffer buf(kSample);

    EXPECT_EQ(buf.size(), std::strlen(kSample));
    EXPECT_STREQ(buf.data(), kSample);
}

TEST(BufferTest, ConstructFromStdString) {
    std::string s = kSample;
    Buffer buf(s);

    EXPECT_EQ(buf.size(), s.size());
    EXPECT_STREQ(buf.data(), s.c_str());
}

TEST(BufferTest, ConstructFromVector) {
    std::vector<char> v(kSample, kSample + std::strlen(kSample));
    Buffer buf(v);

    EXPECT_EQ(buf.size(), v.size());
    EXPECT_EQ(std::memcmp(buf.data(), v.data(), v.size()), 0);
}

// -------------------------------------------------------------
// Buffer: Element Access
// -------------------------------------------------------------
TEST(BufferTest, OperatorIndex) {
    Buffer buf(kSample);

    for (std::size_t i = 0; i < buf.size(); ++i) {
        EXPECT_EQ(buf[i], kSample[i]);
    }
}

TEST(BufferTest, AtValid) {
    Buffer buf(kSample);
    EXPECT_EQ(buf.at(0), 'H');
    EXPECT_EQ(buf.at(1), 'e');
}

TEST(BufferTest, AtThrowsOnOutOfRange) {
    Buffer buf(kSample);
    EXPECT_THROW(buf.at(buf.size()), std::out_of_range);
    EXPECT_THROW(buf.at(buf.size() + 10), std::out_of_range);
}

// -------------------------------------------------------------
// Buffer: Iterator Basics
// -------------------------------------------------------------
TEST(BufferIteratorTest, BeginEndBasic) {
    Buffer buf(kSample);

    auto it = buf.begin();
    auto end = buf.end();

    EXPECT_NE(it, end);
    EXPECT_EQ(*it, 'H');
    EXPECT_EQ(*(end - 1), '!');
}

TEST(BufferIteratorTest, IterAtValid) {
    Buffer buf(kSample);

    auto it = buf.iter_at(5);
    EXPECT_EQ(*it, kSample[5]);
}

TEST(BufferIteratorTest, IterAtThrows) {
    Buffer buf(kSample);
    EXPECT_THROW(buf.iter_at(buf.size()),     std::out_of_range);
    EXPECT_THROW(buf.iter_at(buf.size() + 1), std::out_of_range);
}

// -------------------------------------------------------------
//
