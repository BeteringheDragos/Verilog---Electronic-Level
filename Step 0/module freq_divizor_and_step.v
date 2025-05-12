// Modul care imparte frecventa si creste step-ul la intervale definite
module freq_divizor_and_step (
    input            clk,
    input            rst_n,
    input  [8:0]     speed,
    output reg [25:0] freq_div,
    output reg [3:0] step_out
);

//Logica freq_div
always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        freq_div <= 26'd0;
    end else begin 
        if(freq_div == (speed * 1000000)) begin
            freq_div <= 26'd0;
        end else begin
            freq_div <= freq_div + 1'b1;
        end
    end
end

//Logica pentru step
always @(posedge clk or negedge rst_n) begin 
    if(~rst_n) begin
        step_out <= 4'd0;
    end else begin
        if(freq_div == (speed * 1000000)-1)
        step_out <= (step_out == 11) ? 4'd0 : step_out + 1;
     end
end

endmodule