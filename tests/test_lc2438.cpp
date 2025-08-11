#include <gtest/gtest.h>

#include "lc2438.cpp"

TEST(LC2438Test, PositiveCases) {
  Solution s;
  EXPECT_EQ(s.productQueries(1, std::vector<std::vector<int>>{{0, 0}}),
            std::vector<int>({1}));
  EXPECT_EQ(s.productQueries(2, std::vector<std::vector<int>>{{0, 0}}),
            std::vector<int>({2}));
  EXPECT_EQ(s.productQueries(3, std::vector<std::vector<int>>{{0, 1}}),
            std::vector<int>({2}));
  EXPECT_EQ(s.productQueries(5, std::vector<std::vector<int>>{{0, 1}}),
            std::vector<int>({4}));
  // Multiple queries
  EXPECT_EQ(s.productQueries(6, std::vector<std::vector<int>>{{0, 0}, {0, 1}}),
            std::vector<int>({2, 8}));
}

TEST(LC2438Test, EdgeCases) {
  Solution s;
  EXPECT_EQ(s.productQueries(1, std::vector<std::vector<int>>{}),
            std::vector<int>());
  EXPECT_EQ(s.productQueries(2147483647, std::vector<std::vector<int>>{{0, 30}})
                .size(),
            1u);
}