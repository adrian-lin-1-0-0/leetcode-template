#include <gtest/gtest.h>

#include "lc3643.cpp"

struct testCase {
  std::vector<std::vector<int>> grid;
  int x;
  int y;
  int k;
  std::vector<std::vector<int>> expected;
};

TEST(LC3643Test, PositiveCases) {
  Solution s;

  std::vector<testCase> testCases = {
      {{{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}, {13, 14, 15, 16}},
       1,
       0,
       3,
       {{1, 2, 3, 4}, {13, 14, 15, 8}, {9, 10, 11, 12}, {5, 6, 7, 16}}},
      {{{3, 4, 2, 3}, {2, 3, 4, 2}}, 0, 2, 2, {{3, 4, 4, 2}, {2, 3, 2, 3}}},
  };

  for (const auto& testCase : testCases) {
    EXPECT_EQ(s.reverseSubmatrix(
                  const_cast<std::vector<std::vector<int>>&>(testCase.grid),
                  testCase.x, testCase.y, testCase.k),
              testCase.expected);
  }
}
