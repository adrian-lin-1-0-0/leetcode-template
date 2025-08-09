CXX = g++
CXXFLAGS = -I./src -lgtest -lgtest_main -pthread

.PHONY:test
test:
	@if [ -z "$(id)" ]; then \
		echo "example: make test id=231"; \
	else \
		$(CXX) src/lc$(id).cpp tests/test_lc$(id).cpp $(CXXFLAGS) -o run_tests && ./run_tests; \
	fi

.PHONY:clean
clean:
	rm -f run_tests