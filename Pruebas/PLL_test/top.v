module top(
    input  wire gen_12mhz,
    output reg  pll1_lock,
    output reg  pll2_lock
);

wire clk_12mhz;
wire clk_128mhz;
wire clk_64mhz;
wire clk_40mhz;

SB_PLL40_2_PAD #(
    .FEEDBACK_PATH("SIMPLE"),
    .DIVR(4'b0000),
    .DIVF(7'b0110100),
    .DIVQ(3'b100),
    .FILTER_RANGE(3'b001)
) pll1 (
    .LOCK          (pll1_lock),
    .RESETB        (1'b1),
    .BYPASS        (1'b0),
    .PACKAGEPIN    (gen_12mhz),
    .PLLOUTGLOBALA (clk_12mhz),
    .PLLOUTGLOBALB (clk_40mhz) // 39.750 MHz actually
);

SB_PLL40_2F_CORE #(
    .DIVR (4'b0000),
    .DIVF (7'b1010100),
    .DIVQ (3'b011),
    .FILTER_RANGE (3'b001),
    .FEEDBACK_PATH ("SIMPLE"),
    .PLLOUT_SELECT_PORTA ("GENCLK"),
    .PLLOUT_SELECT_PORTB ("GENCLK_HALF")
) pll2 (
    .LOCK           (pll2_lock),
    .RESETB         (1'b1),
    .REFERENCECLK   (clk_12mhz),
    .PLLOUTGLOBALA  (clk_128mhz), // 127.5 MHz actually
    .PLLOUTGLOBALB  (clk_64mhz)   // 63.75 MHz actually
);

endmodule