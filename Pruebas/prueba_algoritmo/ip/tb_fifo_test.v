`timescale  1 ns / 100 ps 
 
module  Testbench ( ) ; 
 
parameter   WIDTH 	     = 11 ; 
parameter	  DEPTH		     = 13 ; 
parameter   FULL_FLAG_SENSE    = 1 ; 
parameter   AFULL_FLAG_SENSE   = 1 ; 
parameter   EMPTY_FLAG_SENSE   = 1 ; 
parameter   AEMPTY_FLAG_SENSE  = 1 ; 
 
parameter	HIGH	      = 1'b1 ;
parameter	LOW	      = 1'b0 ; 
parameter	HIGH_BUS      = {WIDTH{HIGH}} ; 
parameter	LOW_BUS	      = {WIDTH{LOW}} ; 
parameter	ADDR_WIDTH    = clog2(DEPTH) ; 
parameter	CNT_WIDTH     = ADDR_WIDTH +1 ; 
 
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
  for (clog2_main = 0; value > 1 ; clog2_main = clog2_main+1 ) 
    value = value>>1 ;
endfunction
  
reg Reset ; 
reg [WIDTH-1:0] Din = {WIDTH{1'b0}} ; 
reg Clock = 1'b0 ; 
reg Write_enable = 1'b0 ; 
wire Full ; 
 
 
wire [WIDTH-1:0] Dout ; 
reg  Read_enable = 1'b0 ; 
wire Empty ; 
 
 
parameter  CLK_PERIOD  = 200 ; 
integer i , j , k , m , t , s , r , l ; 
   
// ******************************************************************************* 
// DUT instantiation 
 
fifo_test rtl            ( 
                             .Reset(Reset) 
                            ,.Clock(Clock) 
                            ,.Din(Din) 
                            ,.Write_enable(Write_enable) 
                            ,.Read_enable(Read_enable) 
                            ,.Dout(Dout) 
                            ,.Full(Full) 
                            ,.Empty(Empty) 
	                       ); 
// *********************************************************************************** 
 
always 
 #(CLK_PERIOD/2) Clock <= ~Clock ; 
 
initial 
begin 
  #0 Write_enable = 1'b0 ; 
  #0 Read_enable  = 1'b0 ; 
  #0 Din = {WIDTH{1'b1}} ; 
  #0 Reset = 1'b1 ; 
  #0 i = 0 ; 
  #0 j = 0 ; 
  #0 k = 0 ; 
  #0 m = 0 ; 
  #0 t = 0 ; 
  #0 s = 0 ; 
  #0 r = 0 ; 
  @(negedge Clock) ; 
  @(negedge Clock) ; 
  @(negedge Clock) ; 
  @(negedge Clock) ; 
  @(negedge Clock) ; 
  @(negedge Clock) ; 
  @(negedge Clock) ; 
  @(negedge Clock) ; 
  @(negedge Clock) ; 
  #0 Reset = 1'b0 ; 
 
 
  for (i=0 ; i<=15; i=i+1) 
    @(negedge Clock) ; 
  write_flag_check ; 
 
  for (i=0 ; i<=15; i=i+1) 
     @(negedge Clock) ; 
  #0 i = 0 ; 
  read_flag_check ;
 
  for (i=0 ; i<= 15; i=i+1) 
     @(negedge Clock) ; 
  write_read_data_check ; 
  
  #0 i = 0 ; 
  for (i=0; i <=15 ; i=i+1) 
     @(negedge Clock) ; 
  readwrite_check_during_fullempty ; 
  
  #0 i = 0 ; 
  for (i=0; i <=15 ; i=i+1) 
     @(negedge Clock) ; 
  readwrite_check_during_afullaempty ; 
 
  #0 i = 0 ; 
  for (i=0; i <=15 ; i=i+1) 
     @(negedge Clock) ; 
  readwrite_check_during_fifoempty ; 
 
  #0 i = 0 ; 
  for (i=0; i <=15 ; i=i+1) 
     @(negedge Clock) ; 
  readwrite_check_during_fifoaempty ; 
 
  #0 i = 0 ; 
  for (i=0; i <=15 ; i=i+1) 
     @(negedge Clock) ; 
  readwrite_check_during_fifofull ; 
 
  #0 i = 0 ; 
  for (i=0; i <=15 ; i=i+1) 
     @(negedge Clock) ; 
  readwrite_check_during_fifoafull ; 
 
  #0 i = 0 ; 
  for (i=0; i <=15 ; i=i+1) 
     @(negedge Clock) ; 
 
  $stop ; 
end 
  
// ******************************************************************************************* 
// write_flag_check TASK 
 
task write_flag_check ;  
begin 
  @(negedge Clock) ; 
  begin 
    Write_enable  =  1'b1 ; 
  end 
 
  for (j = 0 ; j <= DEPTH+3 ; j = j+1 ) 
  @(negedge Clock) 
  begin 
	  Din = $random ; 
  end 
 
  @(negedge Clock) ; 
  if (Full == FULL_FLAG_SENSE) 
  begin 
    Write_enable = 1'b0 ; 
    Din = {WIDTH{1'b0}} ; 
  end 
 
end 
endtask 
 
// ******************************************************************************************** 
// read_flag_check 
task read_flag_check ; 
begin 
  @(negedge Clock) 
    Read_enable = 1'b1 ; 
 
  for (k = 0 ; k < DEPTH+3 ; k = k+1 ) 
  @(negedge Clock) 
  begin 
    Read_enable = 1'b1 ; 
  end 
 
  @(negedge Clock) 
  begin 
    if (Empty == EMPTY_FLAG_SENSE) 
       Read_enable = 1'b0 ; 
  end 
end 
endtask 
 
// ******************************************************************************************* 
// Write Read Data Check 
 
task write_read_data_check ; 
begin 
 
  @(negedge Clock) 
  begin 
    Write_enable = 1'b1 ; 
  end 
  @(negedge Clock) 
  begin 
    Read_enable = 1'b1 ; 
  end 
 
  for(l = 0; l <= 4*DEPTH; l = l+1) 
  begin 
    @(negedge Clock) 
    begin 
	    Din = $random ; 
    end 
  end 
 
  @(negedge Clock ) 
  begin 
	  Write_enable = 1'b0 ; 
    Read_enable = 1'b0 ; 
  end 
end 
endtask 
 
 // ************************************************************************************* 
 // Read Check during Full , write check during Empty 
 // Overflow / Underflow should not occur 
 
task readwrite_check_during_fullempty ; 
begin 
 
  @(negedge Clock) 
  begin 
    Write_enable <= 1'b1 ; 
  end 
 
  for (t = 0 ; t <= 2*DEPTH-2 ; t = t+1) 
  begin 
    @(negedge Clock) 
    begin 
	    Din <= $random ; 
	    if (Full == FULL_FLAG_SENSE) 
      begin 
	      Read_enable <= 1'b1 ; 
        Write_enable <= 1'b0 ; 
	    end 
      if (Empty == EMPTY_FLAG_SENSE) 
      begin 
	      Write_enable <= 1'b1 ; 
        Din = $random ; 
	      Read_enable <= 1'b0 ; 
	    end 
    end 
  end 
 
  @(negedge Clock) 
  begin 
    Write_enable <= 1'b0 ; 
    Read_enable  <= 1'b0 ; 
  end 
end 
endtask 
 
 // ***************************************************************************************  
 // Read Check during Almost Full , write check during Almost Empty 
 // Full / Empty should not occur 
 
task readwrite_check_during_afullaempty ; 
begin 
 
  @(negedge Clock) 
  begin 
    Write_enable <= 1'b1 ; 
  end 
 
  for (s = 0 ; s <= 2*DEPTH-5 ; s = s+1 ) 
  begin 
    @(negedge Clock) 
    begin 
	    Din <= $random ; 
	    if (Almost_full == AFULL_FLAG_SENSE) 
      begin 
	      Read_enable <= 1'b1 ; 
        Write_enable <= 1'b0 ; 
	    end 
      if (Almost_empty == AEMPTY_FLAG_SENSE) 
      begin 
	      Write_enable <= 1'b1 ; 
        Din = $random ; 
	      Read_enable <= 1'b0 ; 
	    end 
    end 
  end 
 
  @(negedge Clock) 
  begin 
    Write_enable <= 1'b0 ; 
  end 
 
  @(negedge Clock) 
  begin 
    Read_enable <= 1'b0 ; 
  end 
end 
endtask 
 
 // **************************************************************************************** 
 // Reading and Writing from FIFO, when FIFO is empty to check toggling of flags 
 
task  readwrite_check_during_fifoempty ; 
begin 
 
  @(negedge Clock) 
  begin 
    Din <= $random ; 
    Read_enable <= 1'b1 ; 
    Write_enable <= 1'b1 ; 
  end 
 
  @(negedge Clock) 
  begin 
    Write_enable <= 1'b0 ; 
    Din  <= {WIDTH{1'b0}} ; 
  end 
 
  @(negedge Clock) 
     Read_enable <= 1'b0 ; 
 
  for (s=0; s < DEPTH ; s = s+1 ) 
  begin 
    @(negedge Clock) 
    begin 
	    Write_enable <= 1'b1 ; 
      Read_enable  <= 1'b0 ; 
 	    Din <= $random ; 
    end 
 
    @(negedge Clock) 
    begin 
 	    Write_enable <= 1'b0 ; 
	    Read_enable  <= 1'b1 ; 
	    Din <= {WIDTH{1'b0}} ; 
    end 
  end 
 
  @(negedge Clock) 
  begin 
    Write_enable <= 1'b0 ; 
    Read_enable  <= 1'b0 ; 
    Din          <= {WIDTH{1'b0}} ; 
  end 
 
end 
endtask 
 
 // ****************************************************************************************** 
 // Reading and Writing from FIFO, when FIFO is Almost empty to check toggling of flags 
 
task  readwrite_check_during_fifoaempty ; 
begin 
 
  #0 s = 0 ; 
  for ( s = 0 ; s < 3 ; s = s+1) 
  begin 
    @(negedge Clock) 
    if ( Almost_empty == AEMPTY_FLAG_SENSE ) 
    begin 
      Write_enable <= 1'b1 ; 
      Din <= $random ; 
    end 
	  else 
    begin 
 	    Write_enable <= 1'b0 ; 
      Din    <=  {WIDTH{1'b0}} ; 
    end 
  end 
 
  @(negedge Clock) 
  begin 
    Write_enable <= 1'b1 ; 
    Read_enable  <= 1'b1 ; 
  end 
 
  @(negedge Clock) 
  begin 
    Write_enable <= 1'b0 ; 
    Read_enable  <= 1'b0 ; 
  end 
 
  #0 s = 0 ;  
  for (s=0; s < DEPTH; s = s+1) 
  begin 
    @(negedge Clock) 
    begin 
	    Write_enable <= 1'b0 ; 
	    Read_enable  <= 1'b1 ; 
	    Din <= {WIDTH{1'b0}} ; 
    end 
 
    @(negedge Clock) 
    begin 
	    Write_enable <= 1'b1 ; 
 	    Read_enable <= 1'b0 ; 
	    Din <= $random ; 
    end 
  end 
 
  @(negedge Clock) 
  begin 
    Write_enable <= 1'b0 ; 
    Read_enable  <= 1'b0 ; 
    Din          <= {WIDTH{1'b0}} ; 
  end 
end 
endtask 
 
 // *************************************************************************************** 
 // Reading and Writing from FIFO , when FIFO is Full to check toggling of flags 
 
task readwrite_check_during_fifofull ; 
begin 
 
  #0 s = 0 ; 
  for ( s = 0 ; s < DEPTH+3 ; s = s+1 ) 
  begin 
    @(negedge Clock) 
    if ( Full == FULL_FLAG_SENSE )  
	  begin 
      Write_enable <= 1'b0 ; 
      Din <= {WIDTH{1'b0}} ; 
	  end 
    else 
    begin 
      Write_enable <= 1'b1 ; 
	    Din  <= $random ; 
	  end 
  end 
 
  @(negedge Clock) 
  begin 
    Din <= $random ; 
    Read_enable <= 1'b1 ; 
    Write_enable <= 1'b1 ; 
  end 
 
  @(negedge Clock) 
  begin 
    Write_enable <= 1'b0 ; 
    Din  <= {WIDTH{1'b0}} ; 
  end 
 
  @(negedge Clock) 
    Read_enable <= 1'b0 ; 
 
  #0 s = 0 ; 
  for ( s = 0 ; s < DEPTH ; s = s+1 ) 
  begin 
    @(negedge Clock) 
    begin 
 	    Din  <=  {WIDTH{1'b0}} ; 
	    Read_enable <= 1'b1 ; 
      Write_enable  <= 1'b0 ; 
    end 
    @(negedge Clock) 
    begin 
      Din  <=  $random ; 
	    Write_enable  <= 1'b1 ; 
      Read_enable   <= 1'b0 ; 
    end 
  end 
 
  @(negedge Clock) 
  begin 
    Write_enable <= 1'b0 ; 
    Read_enable  <= 1'b0 ; 
    Din          <= {WIDTH{1'b0}} ; 
  end 
end 
endtask 
 
 // *********************************************************************************** 
 // Reading and Writing from FIFO , when FIFO is Almost Full to check toggling of flags 
 
task readwrite_check_during_fifoafull ; 
begin 
 
  @(negedge Clock) 
  begin 
    Din <= $random ; 
    Read_enable <= 1'b1 ; 
    Write_enable <= 1'b1 ; 
  end 
 
  @(negedge Clock) 
  begin 
    Write_enable <= 1'b0 ; 
    Din  <= {WIDTH{1'b0}} ; 
  end 
 
  @(negedge Clock) 
    Read_enable <= 1'b0 ; 
 
  #0 s = 0 ; 
  for ( s = 0 ; s < DEPTH ; s = s+1 ) 
  begin 
    @(negedge Clock) 
    begin 
	    Din  <=  {WIDTH{1'b0}} ; 
      Read_enable <= 1'b1 ; 
      Write_enable  <= 1'b0 ; 
    end 
 
    @(negedge Clock) 
    begin 
 	    Din  <=  $random ; 
	    Write_enable  <= 1'b1 ; 
      Read_enable   <= 1'b0 ; 
    end 
  end 
 
  @(negedge Clock) 
  begin 
    Write_enable <= 1'b0 ; 
    Read_enable  <= 1'b0 ; 
    Din          <= {WIDTH{1'b0}} ; 
  end 
end 
endtask 
endmodule 
