#include <climits>
#include <vector>
using std::vector;

class Solution {
 public:
  int sortPermutation(vector<int>& nums) {
    int n = nums.size();
    int curr = INT_MAX;
    for (int i = 0; i < n; ++i) {
      if (i != nums[i]) curr &= nums[i];
    }
    if (curr == INT_MAX) return 0;
    return curr;
  }
};