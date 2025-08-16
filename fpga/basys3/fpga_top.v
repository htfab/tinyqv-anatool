`default_nettype none

module fpga_top(
    input wire clk,
    input wire btnC,
    input wire btnU,
    input wire btnL,
    input wire btnR,
    input wire btnD,
    input wire [15:0] sw,
    input wire [7:0] JA,
    input wire [7:4] JCin,
    output wire [15:0] led,
    output wire [7:0] JXADC,
    output wire [3:0] JCout
);

reg rst_n;
wire clk_proj;
wire pll_locked;

pll #(
    .PREDIV(5),
    .MULT(48),
    .DIV(15)
) i_pll (
    .clk_in(clk),
    .clk_out(clk_proj),
    .reset(btnU),
    .locked(pll_locked)
);

initial begin
    rst_n <= 0;
end

always @(posedge clk_proj) begin
    rst_n <= ~btnC;
end

wire [3:0] _uio_out_ignore;
wire [7:0] _uio_oe_ignore;

tt_um_tqv_peripheral_harness peri (
    .ui_in(JA),
    .uo_out(JXADC),
    .uio_in({JCin, 4'b0}),
    .uio_out({_uio_out_ignore, JCout}),
    .uio_oe(_uio_oe_ignore),
    .ena(1'b1),
    .clk(clk_proj),
    .rst_n(rst_n)
);

assign led = sw ^ {JA, JXADC};

endmodule
