// Modul care determina pozitia pe orizontala si pe verticala in functie de step
module position_controller (
    input             clk,
    input             rst_n,
    input      [3:0]  step_in,
    output reg [11:0] pozitie_orizontala,
    output reg        pozitie_verticala
);

// Logica pozitie orizontala
always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin 
        pozitie_orizontala <= 12'd0;
    end else begin 
        pozitie_orizontala <= (12'b0000_0000_0001 <<step_in); // Se shifteaza pe pozitia corespunzatoare (step_in)
    end
 end

//Logica pozitie verticala
always @(posedge clk or negedge rst_n) begin 
    if(~rst_n) begin
        pozitie_verticala <= 1'b0;
    end else begin 
        pozitie_verticala <= (step_in < 6)? 1'b0 : 1'b1; // Se seteaza pozitia verticala in functie de step_in
    end
end

endmodule