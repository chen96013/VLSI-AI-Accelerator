module ME (
    input   clk,
    input   rst,
    input   [7:0]   activation,
    input   [7:0]   weight,
    output  logic   signed  [31:0]  ME_output,
    output  logic   signed  [31:0]  ME_ouptut_last
);

logic   signed   [7:0]   src1, src2;
assign ME_output = src1 * src2;

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        src1 <= 8'd0;
        src2 <= 8'd0;
        ME_ouptut_last <= 32'd0;
    end
    else begin
        src1 <= activation;
        src2 <= weight;
        ME_ouptut_last <= ME_output;
    end
end


    
endmodule