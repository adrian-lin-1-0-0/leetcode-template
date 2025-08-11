
#include <gtest/gtest.h>

#include "lc3644.cpp"

struct testCase {
  std::vector<int> nums;
  int expected;
};

TEST(LC3644Test, PositiveCases) {
  Solution s;

  std::vector<testCase> testCases = {
      {{0, 3, 2, 1}, 1},
      {{0, 1, 3, 2}, 2},
      {{3, 2, 1, 0}, 0},
  };

  for (const auto& testCase : testCases) {
    EXPECT_EQ(s.sortPermutation(const_cast<std::vector<int>&>(testCase.nums)),
              testCase.expected);
  }
}
