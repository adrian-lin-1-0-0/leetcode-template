#include "lc231.h"

bool Solution::isPowerOfTwo(int n) {
  if (n <= 0) return false;
  return (n & (-n)) == n;
}