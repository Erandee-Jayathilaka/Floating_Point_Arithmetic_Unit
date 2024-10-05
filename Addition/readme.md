# IEEE 754-2008 Single Precision Floating Point Arithmetic Unit - Addition

## Overview

This project implements a **Single Precision Floating Point Arithmetic Unit** compliant with the IEEE 754-2008 standard. The module performs single-precision addition, handling various corner cases such as NaN (Not-a-Number), infinity, denormalized numbers, and zero. The design features a finite state machine (FSM) that processes the addition in several stages, ensuring accuracy and precision across all possible input combinations.

The state machine goes through the following steps:

1. **Unpacking**: Extracts the sign, exponent, and mantissa of the inputs.
2. **Handling Special Cases**: Manages NaNs, infinities, and zero cases.
3. **Alignment**: Aligns the mantissas of the inputs based on their exponents.
4. **Addition/Subtraction**: Adds or subtracts the aligned mantissas depending on the signs of the inputs.
5. **Normalization**: Adjusts the result to fit the normalized representation required by IEEE 754.
6. **Rounding**: Ensures the final result is properly rounded according to the IEEE standard.
7. **Packing**: Combines the final sign, exponent, and mantissa into the standard IEEE 754 32-bit floating-point format.
8. **Output**: Provides the result and sets the ready signal when the computation is complete.

The core FSM ensures correct handling of all corner cases and edge scenarios as per the IEEE 754-2008 specifications.

## Module Interface

The module has the following interface:

- **Inputs**:
  - `clk`: Clock signal
  - `rst_n`: Active low reset signal
  - `din1`: First 32-bit floating-point input
  - `din2`: Second 32-bit floating-point input
  - `dval`: Data valid signal to start the operation

- **Outputs**:
  - `result`: 32-bit floating-point result of the addition
  - `rdy`: Ready signal to indicate the result is available

## Simulation Results

Below are simulation results showcasing different test cases, including normal operations, special cases like NaN and infinity, and edge scenarios like zero handling.

## Simulation Results

Below are simulation results showcasing different test cases.

### Examples of Normal Addition
*Figure 1: {12.0 + 53.1}*
![12.0 + 53.1](https://github.com/Erandee-Jayathilaka/Floating_Point_Arithmetic_Unit/blob/main/Addition/Simulation_results/12.0_53.1.jpg)
*Figure 2: {45.3 + (-32.9)}*
![45.3 + (-32.9)](https://github.com/Erandee-Jayathilaka/Floating_Point_Arithmetic_Unit/blob/main/Addition/Simulation_results/45.3_-32.9.jpg)
*Figure 2: {(-10) + 2.5}*
![(-10) + 2.5](https://github.com/Erandee-Jayathilaka/Floating_Point_Arithmetic_Unit/blob/main/Addition/Simulation_results/-10_2.5.jpg)
*Figure 2: {(-62.1) + (-54.7)}*
![(-62.1) + (-54.7)](https://github.com/Erandee-Jayathilaka/Floating_Point_Arithmetic_Unit/blob/main/Addition/Simulation_results/-62.1_-54.7.jpg)


## How It Works

The addition process is initiated when the `dval` signal is high, indicating valid input data. The module unpacks the inputs into their respective sign, exponent, and mantissa fields. Depending on the values of the exponents and the signs, it aligns the mantissas and performs either addition or subtraction. The result is then normalized and rounded before being packed back into the IEEE 754 format and output on the `result` signal.

In the simulation results the values are shown in hex format of IEEE 754 format binary number.



