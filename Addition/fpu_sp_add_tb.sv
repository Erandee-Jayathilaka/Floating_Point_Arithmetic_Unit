`timescale 1ns / 1ps

module fpu_sp_add_tb();

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
  fpu_sp_add uut (
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
    
    // Test Case 1: Add two floating point numbers (example)
    din1 = 32'hc25acccd; // 3.125 in IEEE 754 Single Precision
    din2 = 32'hc2786666; // 2.0 in IEEE 754 Single Precision
    dval = 1;
    
    // Wait for output to be ready
    wait (rdy == 1);
    
    // Check result
    $display("Result: %h", result); // Print the result in hexadecimal
    
    // Add more test cases here
    
    // End simulation
    #20;
    $finish;
  end

endmodule
