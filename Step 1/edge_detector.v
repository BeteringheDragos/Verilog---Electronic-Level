module edge_detector (
    input clk,
    input rst_n,
    input signal_in,
    output reg falling_edge,
    output reg req
);

reg signal_d;

// Bloc 1: pentru semnalul anterior
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        signal_d <= 1'b1;
    else
        signal_d <= signal_in;
end

// Bloc 2: Detectare front descendent
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        falling_edge <= 1'b0;
    else
        falling_edge <= (signal_d == 1'b1 && signal_in == 1'b0);
end

// Bloc 3: Generare impuls de un singur ciclu pentru `req`
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        req <= 1'b0;
    else if (signal_d == 1'b1 && signal_in == 1'b0)
        req <= 1'b1;
    else
        req <= 1'b0;
end

endmodule
