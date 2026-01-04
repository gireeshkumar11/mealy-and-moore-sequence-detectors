module seq_detector_mealy (in,clk,reset,out,currentstate,nextstate);
    input in,clk,reset;
    output reg out;

   output reg [1:0] currentstate, nextstate;
    reg out_next;

    parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;

    always @(*) begin
        nextstate = currentstate;
        out_next  = 0;

        case(currentstate)
            s0: nextstate = in ? s1 : s0;

            s1: nextstate = in ? s1 : s2;

            s2: nextstate = in ? s1 : s3;

            s3: begin
                if (in) begin
                    out_next  = 1;   
                    nextstate = s1; 
                end else
                    nextstate = s0;
            end
        endcase
    end
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            currentstate <= s0;
            out <= 0;
        end
        else begin
            currentstate <= nextstate;
            out          <= out_next;  // REGISTERED OUTPUT
        end
    end

endmodule
