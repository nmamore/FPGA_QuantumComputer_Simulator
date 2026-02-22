/*
* @file lfsr.sv
* @brief Linear Feedback Shift Register
* @author Nicholas Amore namore7@gmail.com
* @date Created 2/15/2026
*/

`timescale 1ns/1ps

module lfsr (

  input logic         clk_i,
  input logic         rst_ni,
  output logic signed [15:0] pseudo_rng_o
);

logic signed [15:0] pseudo_rng_q;

logic parity;

assign parity = (pseudo_rng_q[4]^pseudo_rng_q[13])^pseudo_rng_q[15]; //Creates "tap" to ensure maximum number of possible values used

always_ff @(posedge clk_i or negedge rst_ni) begin
  if (!rst_ni) begin
    pseudo_rng_q <= 16'h4123; //Arbitary seed
  end else begin
    pseudo_rng_q <= {pseudo_rng_q[14:0],parity}; //Shift data to the left one position. Drop MSB, add parity bit in
  end
end

assign pseudo_rng_o = pseudo_rng_q;

endmodule