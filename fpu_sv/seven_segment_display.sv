//module seven_segment_display (
//    input logic [3:0] number,       // Input: 4-bit number (0–9)
//    output logic [6:0] segments    // Output: 7 segments (a-g)
//);

//    always_comb begin
//        case (number)
//            4'd0: segments = 7'b0000001; // Display 0
//            4'd1: segments = 7'b1001111; // Display 1
//            4'd2: segments = 7'b0010010; // Display 2
//            4'd3: segments = 7'b0000110; // Display 3
//            4'd4: segments = 7'b1001100; // Display 4
//            4'd5: segments = 7'b0100100; // Display 5
//            4'd6: segments = 7'b0100000; // Display 6
//            4'd7: segments = 7'b0001111; // Display 7
//            4'd8: segments = 7'b0000000; // Display 8
//            4'd9: segments = 7'b0000100; // Display 9
//            default: segments = 7'b1111111; // Blank display for invalid input
//        endcase
//    end

//endmodule

`timescale 1ns / 1ps

module seven_segment_display (
    input logic [3:0] num,       // 4-bit binary input (0-15)
    output logic [6:0] seg      // 7-segment display output
);
    
    // Assign the segments based on the input binary number
    always_comb begin
        case (num)
            4'd0: seg = 7'b0111111; // Display 0
            4'd1: seg = 7'b0000110; // Display 1
            4'd2: seg = 7'b1011011; // Display 2
            4'd3: seg = 7'b1001111; // Display 3
            4'd4: seg = 7'b1100110; // Display 4
            4'd5: seg = 7'b1101101; // Display 5
            4'd6: seg = 7'b1111101; // Display 6
            4'd7: seg = 7'b0000111; // Display 7
            4'd8: seg = 7'b1111111; // Display 8
            4'd9: seg = 7'b1101111; // Display 9
            4'd10: seg = 7'b1110111; // Display A
            4'd11: seg = 7'b1111100; // Display B
            4'd12: seg = 7'b0111001; // Display C
            4'd13: seg = 7'b1011110; // Display D
            4'd14: seg = 7'b1111001; // Display E
            4'd15: seg = 7'b1110001; // Display F
            default: seg = 7'b0000000; // Blank display for invalid inputs
        endcase
    end
endmodule

// This module can be instantiated multiple times for each 4-bit segment
// of your 32-bit floating-point result in the `test.sv` file.