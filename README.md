# Leetcode Template: C++ Solution

## Dependencies

- **C++ Compiler**: GCC 7+ or Clang 6+
- **Google Test**: For unit testing framework
- **CMake**: For building dependencies (if building from source)

### Ubuntu/Debian Installation

```bash
sudo apt-get update
sudo apt-get install -y build-essential cmake libgtest-dev

# Build and install GoogleTest
cd /usr/src/gtest
sudo cmake CMakeLists.txt
sudo make
sudo cp lib/*.a /usr/lib
```

## Quick Start

### Using the Development Script (Recommended)

```bash
# Create a new problem template
./dev.sh new 875

# Run tests for a specific problem
./dev.sh test 231

# Run all tests
./dev.sh test-all

# List all problems
./dev.sh list

# Check code syntax
./dev.sh check

# Clean build artifacts
./dev.sh clean
```

### Using Make Directly

```bash
# Run tests for a specific problem
make test id=231

# Run all tests
make test-all

# Build without running tests
make build id=231

# Clean build artifacts
make clean

# Check code style
make check
```

## Adding New Problems

1. **Create new files**: Use the development script to generate templates
   ```bash
   ./dev.sh new 875  # Creates src/lc875.cpp and tests/test_lc875.cpp
   ```

2. **Implement solution**: Edit `src/lc<number>.cpp` with your solution
   ```cpp
   class Solution {
   public:
       int yourMethod(int param) {
           // Your implementation here
           return 0;
       }
   };
   ```

3. **Add test cases**: Edit `tests/test_lc<number>.cpp` with comprehensive tests
   ```cpp
   #include <gtest/gtest.h>
   #include "lc875.cpp"

   TEST(LC875Test, BasicCases) {
       Solution s;
       EXPECT_EQ(s.yourMethod(1), 1);
   }
   ```

4. **Test your solution**:
   ```bash
   ./dev.sh test 875
   ```

