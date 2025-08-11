#include <vector>
#include <cstdint>
using namespace std;

class Solution {
 public:
    vector<int> productQueries(int n, const vector<vector<int>>& queries) {
        constexpr int mod = 1e9+7;
        vector<int> powers;
        for (int i = 0, p2 = 1; i < 31; ++i, p2 <<= 1) {
            if (p2 & n) powers.push_back(p2);
        }
        vector<int> res;
        for (const auto& query : queries) {
            int64_t ans = 1;
            for (int i = query[0]; i <= query[1]; ++i) {
                ans = (ans * powers[i]) % mod;
            }
            res.push_back(ans);
        }
        return res;
    }
};
