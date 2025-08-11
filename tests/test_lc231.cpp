#include <gtest/gtest.h>

#include <climits>

#include "lc231.h"

TEST(IsPowerOfTwoTest, PositiveCases) {
  Solution s;
  EXPECT_TRUE(s.isPowerOfTwo(1));
  EXPECT_TRUE(s.isPowerOfTwo(2));
  EXPECT_TRUE(s.isPowerOfTwo(4));
  EXPECT_TRUE(s.isPowerOfTwo(1024));
}

TEST(IsPowerOfTwoTest, NegativeCases) {
  Solution s;
  EXPECT_FALSE(s.isPowerOfTwo(0));
  EXPECT_FALSE(s.isPowerOfTwo(-2));
  EXPECT_FALSE(s.isPowerOfTwo(3));
  EXPECT_FALSE(s.isPowerOfTwo(12));
}

TEST(IsPowerOfTwoTest, EdgeCases) {
  Solution s;
  EXPECT_FALSE(s.isPowerOfTwo(INT_MAX));
}
