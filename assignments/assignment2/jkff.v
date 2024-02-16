module jkff (
    input J,      
    input K,      
    input CLK,    
    input RESET,  
    output reg Q  
);
    always @(posedge CLK or posedge RESET) begin
        if (RESET) begin
            Q <= 1'b0;
        end 
        else begin
            if (J && !K) begin
                Q <= 1'b1;
            end
            else if (!J && K) begin
                Q <= 1'b0;
            end
            else if (J && K) begin
                Q <= ~Q;
            end
            else begin
                Q <= Q;
            end
        end
    end
endmodule