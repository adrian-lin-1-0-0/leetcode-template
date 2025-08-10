#include <gtest/gtest.h>
#include "lc869.cpp"

TEST(ReorderedPowerOf2Test, PositiveCases) {
    Solution s;
    EXPECT_TRUE(s.reorderedPowerOf2(1));   
    EXPECT_TRUE(s.reorderedPowerOf2(2));   
    EXPECT_TRUE(s.reorderedPowerOf2(4));   
    EXPECT_TRUE(s.reorderedPowerOf2(16));  
    EXPECT_TRUE(s.reorderedPowerOf2(32));  
    EXPECT_TRUE(s.reorderedPowerOf2(64));  
}

TEST(ReorderedPowerOf2Test, NegativeCases) {
    Solution s;
    EXPECT_FALSE(s.reorderedPowerOf2(3));   
    EXPECT_FALSE(s.reorderedPowerOf2(12));  
    EXPECT_FALSE(s.reorderedPowerOf2(18));  
    EXPECT_FALSE(s.reorderedPowerOf2(30));  
}

TEST(ReorderedPowerOf2Test, EdgeCases) {
    Solution s;
    EXPECT_FALSE(s.reorderedPowerOf2(0));   
    EXPECT_FALSE(s.reorderedPowerOf2(-1));  
    EXPECT_FALSE(s.reorderedPowerOf2(100000000)); 
    EXPECT_FALSE(s.reorderedPowerOf2(100000000-1)); 
}