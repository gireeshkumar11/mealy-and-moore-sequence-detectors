Module sequencedetector(
input clk,reset,in,
output reg out);
    
    reg [2:0] state;
    
    parameter s0 = 3'd0;
    parameter s1 = 3'd1;
    parameter s2 = 3'd2;
    parameter s3 = 3'd3;
    parameter s4 = 3'd4;
    
    always @(posedge clk) begin
    if (reset)
    state <= s0;
    else begin
    case(state)
    s0: state <= (in)? s1 : s0;
    s1: state <= (in)? s1:s2;
    s2: state <= (in)? s1:s3;
    s3: state <= (in)? s4:s0;
    s4: state <= (in)? s1:s0;
    
    default: state <= s0;
    endcase
    end
    end
    always @(*)begin
    out = (state == s4);
    end
endmodule
