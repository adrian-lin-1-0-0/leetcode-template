#include <utility>
#include <vector>

using std::swap;
using std::vector;

class Solution {
 public:
  vector<vector<int>> reverseSubmatrix(vector<vector<int>>& grid, int x, int y,
                                       int k) {
    int end = x + x + k - 1;
    for (int col = y; col < y + k; ++col) {
      for (int row = x; row < x + k / 2; ++row) {
        swap(grid[row][col], grid[end - row][col]);
      }
    }
    return grid;
  }
};
