// ----------------------------------------------------------------------------- 
// --- 
// ---                 (C) COPYRIGHT 2001-2010 SYNOPSYS, INC. 
// ---                           ALL RIGHTS RESERVED 
// --- 
// --- This software and the associated documentation are confidential and 
// --- proprietary to Synopsys, Inc.  Your use or disclosure of this 
// --- software is subject to the terms and conditions of a written 
// --- license agreement between you, or your company, and Synopsys, Inc. 
// --- 
// --- The entire notice above must be reproduced on all authorized copies. 
// --- 
// ----------------------------------------------------------------------------- 
// 
 
`timescale 1ns/100ps
 module fifo_test 
 	 	 	 (
 	 	 	    Reset 
 	 	 	  , Clock 
 	 	 	  , Din 
 	 	 	  , Write_enable 
 	 	 	  , Read_enable 
 	 	 	  , Dout 
 	 	 	  , Full 
 	 	 	  , Empty 
 	 	 	 ) ;
 
parameter WIDTH = 11 ;
parameter DEPTH = 13 ;
parameter FULL_FLAG_SENSE = 1 ;
parameter EMPTY_FLAG_SENSE = 1 ;
 
parameter HIGH        = 1'b1 ;
parameter LOW         = 1'b1 ;
parameter ADDR_WIDTH  = clog2(DEPTH) ;
parameter CNT_WIDTH   = ADDR_WIDTH + 1 ;
 
input                       Reset ;
input                       Clock ;
input [WIDTH-1:0]           Din ;
input                       Write_enable ;
input                       Read_enable ;
output [WIDTH-1:0]          Dout ;
output                 Full ;
output                 Empty ;
 
syncore_sfifo #( 
                  .WIDTH(WIDTH) 
                 ,.DEPTH(DEPTH) 
                 ,.FULL_FLAG_SENSE(FULL_FLAG_SENSE) 
                 ,.EMPTY_FLAG_SENSE(EMPTY_FLAG_SENSE) 
           )
 U1        (
                .Reset(Reset) 
               ,.Clock(Clock) 
               ,.Din(Din) 
               ,.Write_enable(Write_enable) 
               ,.Read_enable(Read_enable) 
               ,.Dout(Dout) 
               ,.Full(Full) 
               ,.Empty(Empty) 
	         ); 
 
function integer find_ones ;
input [31:0] value ;
integer i ;
  begin 
    find_ones=0 ;
    for (i=0; i<32 ; i=i+1) 
      find_ones = find_ones + value[i] ;
  end 
endfunction 
 
function integer clog2 ;
input [31:0] value ;
begin 
  if(find_ones(value) > 1) 
     clog2 = clog2_main(value) + 1 ;
  else 
     clog2 = clog2_main(value) ;
end 
endfunction 
 
function integer clog2_main ;
input [31:0] value ;
  for (clog2_main=0; value>1; clog2_main=clog2_main+1) 
    value = value>>1 ;
endfunction
 
endmodule 
