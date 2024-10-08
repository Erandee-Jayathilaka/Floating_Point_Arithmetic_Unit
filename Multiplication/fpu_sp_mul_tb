`timescale 1ns / 1ps

module fpu_sp_mul_tb();

  // Clock and reset signals
  logic clk;
  logic rst_n;

  // Input signals to the DUT (Design Under Test)
  logic [31:0] din1, din2;
  logic dval;

  // Output signals from the DUT
  logic [31:0] result;
  logic rdy;

  // Instantiate the DUT
  fpu_sp_mul uut (
    .clk(clk),
    .rst_n(rst_n),
    .din1(din1),
    .din2(din2),
    .dval(dval),
    .result(result),
    .rdy(rdy)
  );

  // Clock generation
  always #5 clk = ~clk; // Generate a clock with 10ns period

  // Testbench process
  initial begin
    // Initialize signals
    clk = 0;
    rst_n = 0;
    dval = 0;
    din1 = 0;
    din2 = 0;
    
    // Apply reset
    #10 rst_n = 1;
    
    // Test Case: Multiply two floating point numbers
    din1 = 32'h40400000; // 3.0 in IEEE 754 Single Precision
    din2 = 32'h40000000; // 2.0 in IEEE 754 Single Precision
    dval = 1;
    
    // Wait for output to be ready
    wait (rdy == 1);
    
    // Check result
    $display("Result: %h", result); // Print the result in hexadecimal, expected: 0x40800000 (6.0 in IEEE 754)
    
    // End simulation
    #20;
    $finish;
  end

endmodule
