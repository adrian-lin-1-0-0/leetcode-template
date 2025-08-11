#include <vector>
using namespace std;

class Solution {
public:
    vector<int> productQueries(int n, const vector<vector<int>>& queries) {
        vector<int> powers;
        for (int i = 0; i < 31; i++){
            if (((n >> i) & 1) == 1) {
                powers.push_back(1 << i);
            }
        }
        vector<int> res;
        for (auto query: queries){
            long long ans = 1;
            for (int i = query[0]; i <= query[1];i++){
                ans =  (ans * powers[i])% mod;
            }
            res.push_back(ans);
        }
        return res;
    }
private:
    static constexpr int mod = 1e9+7;
};