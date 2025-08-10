#include <unordered_set>
using namespace std;

static long long encodeDigitCount(int n) {
    long long key = 0;
    while (n > 0) {
        int digit = n % 10;
        n /= 10;
        key += 1LL << (digit * 4);
    }
    return key;
}

static const unordered_set<long long> powerOfTwoEncoded = []{
    unordered_set<long long> s;
    for (int i = 0; i < 31; i++) {
        int num = 1 << i;
        s.insert(encodeDigitCount(num));
    }
    return s;
}();

class Solution {
public:
    bool reorderedPowerOf2(int n) {
        return powerOfTwoEncoded.count(encodeDigitCount(n)) > 0;
    }
};
