TOP = test_uart_rx
SRC = uart_rx.v tick_generator.v
TEST_SRC= test_uart_rx.v
BIN = $(TOP).iver

$(BIN): $(SRC) $(TEST_SRC)
	iverilog -o $(BIN) -s $(TOP) $(SRC) $(TEST_SRC)

.PHONY: all clean test

all: $(BIN)

test: $(BIN)
	vvp $(BIN)

clean:
	rm -f *.iver *.vcd