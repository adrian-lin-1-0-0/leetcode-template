CXX ?= g++
CXXFLAGS = -std=c++17 -Wall -Wextra -I./src -lgtest -lgtest_main -pthread

# Default target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  test id=<number>  - Run tests for specific problem (e.g., make test id=231)"
	@echo "  test-all         - Run all tests"
	@echo "  build id=<number> - Build specific problem without running tests"
	@echo "  clean            - Clean build artifacts"
	@echo "  check            - Check code style and potential issues"

.PHONY: test
test:
	@if [ -z "$(id)" ]; then \
		echo "Usage: make test id=<problem_number>"; \
		echo "Example: make test id=231"; \
	else \
		if [ ! -f "src/lc$(id).cpp" ]; then \
			echo "Error: src/lc$(id).cpp not found"; \
			exit 1; \
		fi; \
		if [ ! -f "tests/test_lc$(id).cpp" ]; then \
			echo "Error: tests/test_lc$(id).cpp not found"; \
			exit 1; \
		fi; \
		echo "Building and testing problem $(id)..."; \
		$(CXX) src/lc$(id).cpp tests/test_lc$(id).cpp $(CXXFLAGS) -o run_tests_$(id) && ./run_tests_$(id); \
	fi

.PHONY: test-all
test-all:
	@echo "Running all tests..."
	@test_files=$$(find tests -name "test_lc*.cpp" -type f); \
	if [ -z "$$test_files" ]; then \
		echo "No test files found"; \
		exit 1; \
	fi; \
	for test_file in $$test_files; do \
		problem_id=$$(basename "$$test_file" | sed 's/test_lc\([0-9]*\)\.cpp/\1/'); \
		echo "Testing problem $$problem_id..."; \
		if [ ! -f "src/lc$$problem_id.cpp" ]; then \
			echo "Warning: src/lc$$problem_id.cpp not found, skipping..."; \
			continue; \
		fi; \
		$(CXX) src/lc$$problem_id.cpp tests/test_lc$$problem_id.cpp $(CXXFLAGS) -o run_tests_$$problem_id; \
		if [ $$? -eq 0 ]; then \
			./run_tests_$$problem_id; \
			if [ $$? -eq 0 ]; then \
				echo "✅ Tests passed for problem $$problem_id"; \
			else \
				echo "❌ Tests failed for problem $$problem_id"; \
				exit 1; \
			fi; \
		else \
			echo "❌ Build failed for problem $$problem_id"; \
			exit 1; \
		fi; \
		rm -f run_tests_$$problem_id; \
	done; \
	echo "🎉 All tests passed!"

.PHONY: build
build:
	@if [ -z "$(id)" ]; then \
		echo "Usage: make build id=<problem_number>"; \
		echo "Example: make build id=231"; \
	else \
		if [ ! -f "src/lc$(id).cpp" ]; then \
			echo "Error: src/lc$(id).cpp not found"; \
			exit 1; \
		fi; \
		if [ ! -f "tests/test_lc$(id).cpp" ]; then \
			echo "Error: tests/test_lc$(id).cpp not found"; \
			exit 1; \
		fi; \
		echo "Building problem $(id)..."; \
		$(CXX) src/lc$(id).cpp tests/test_lc$(id).cpp $(CXXFLAGS) -o run_tests_$(id); \
	fi

.PHONY: check
check:
	@echo "Checking code style and potential issues..."
	@find src tests -name "*.cpp" -o -name "*.h" | xargs -I {} sh -c 'echo "Checking {}:" && $(CXX) -fsyntax-only -Wall -Wextra -std=c++17 -I./src {}'

.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	@rm -f run_tests run_tests_*