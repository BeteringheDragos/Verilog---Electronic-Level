module ctrl_hex_b (
    input            enable,
    input            pozitie,
    output reg [7:0] hex_out
);

always @(*) begin
    if (enable) begin
        if (pozitie) 
            hex_out = 8'b10011100; // cerculet sus
         else 
            hex_out = 8'b10100011; // cerculet jos
    end else begin
        hex_out = 8'b11111111; // afisor închis
    
end
end


endmodule