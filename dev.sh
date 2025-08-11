#!/bin/bash

# Local development script for LeetCode solutions
# This script helps with common development tasks

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Function to display help
show_help() {
    echo "LeetCode Development Helper"
    echo ""
    echo "Usage: $0 [COMMAND] [OPTIONS]"
    echo ""
    echo "Commands:"
    echo "  test <id>        Run tests for specific problem"
    echo "  test-all         Run all tests"
    echo "  new <id>         Create new problem template"
    echo "  list             List all problems"
    echo "  clean            Clean build artifacts"
    echo "  check            Check code syntax"
    echo ""
    echo "Examples:"
    echo "  $0 test 231      # Test problem 231"
    echo "  $0 new 875       # Create template for problem 875"
    echo "  $0 test-all      # Run all tests"
}

# Function to create new problem template
create_new_problem() {
    local id=$1
    
    if [ -z "$id" ]; then
        print_error "Problem ID required"
        echo "Usage: $0 new <problem_id>"
        exit 1
    fi
    
    # Check if files already exist
    if [ -f "src/lc${id}.cpp" ] || [ -f "tests/test_lc${id}.cpp" ]; then
        print_warning "Problem ${id} already exists"
        exit 1
    fi
    
    print_info "Creating template for problem ${id}..."
    
    # Create source file template
    cat > "src/lc${id}.cpp" << EOF

class Solution {
public:
    // TODO: Implement your solution here
};
EOF
    
    # Create test file template
    cat > "tests/test_lc${id}.cpp" << EOF
#include <gtest/gtest.h>
#include "lc${id}.cpp"

TEST(LC${id}Test, BasicCases) {
    Solution s;
    
    // TODO: Add your test cases here
    // Example:
    // EXPECT_EQ(s.solve(1), 1);
    // EXPECT_EQ(s.solve(2), 2);
}

TEST(LC${id}Test, EdgeCases) {
    Solution s;
    
    // TODO: Add edge case tests here
    // Example:
    // EXPECT_EQ(s.solve(0), 0);
    // EXPECT_EQ(s.solve(-1), -1);
}
EOF
    
    print_success "Created template for problem ${id}"
    print_info "Files created:"
    print_info "  - src/lc${id}.cpp"
    print_info "  - tests/test_lc${id}.cpp"
    print_info ""
    print_info "Next steps:"
    print_info "  1. Implement your solution in src/lc${id}.cpp"
    print_info "  2. Add test cases in tests/test_lc${id}.cpp"
    print_info "  3. Run tests with: $0 test ${id}"
}

# Function to list all problems
list_problems() {
    print_info "Available problems:"
    
    for file in src/lc*.cpp; do
        if [ -f "$file" ]; then
            id=$(basename "$file" | sed 's/lc\([0-9]*\)\.cpp/\1/')
            has_test=""
            if [ -f "tests/test_lc${id}.cpp" ]; then
                has_test="✅"
            else
                has_test="❌"
            fi
            echo "  Problem ${id} ${has_test}"
        fi
    done
}

# Main script logic
case "${1:-help}" in
    "test")
        if [ -z "$2" ]; then
            print_error "Problem ID required"
            echo "Usage: $0 test <problem_id>"
            exit 1
        fi
        print_info "Running tests for problem $2..."
        make test id="$2"
        ;;
    "test-all")
        print_info "Running all tests..."
        make test-all
        ;;
    "new")
        create_new_problem "$2"
        ;;
    "list")
        list_problems
        ;;
    "clean")
        print_info "Cleaning build artifacts..."
        make clean
        ;;
    "check")
        print_info "Checking code syntax..."
        make check
        ;;
    "help"|"-h"|"--help")
        show_help
        ;;
    *)
        print_error "Unknown command: $1"
        show_help
        exit 1
        ;;
esac
