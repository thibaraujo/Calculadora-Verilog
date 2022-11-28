
module regC (in,clk,rst,op_reg,saida);
// I/O list
input  [4:0] in;
input [1:0]op_reg;
input clk,rst;

output reg  [4:0] saida;


always @ ( posedge clk or posedge !rst )
begin
	if (!rst)
		 begin
			saida <= 0;
		  end
	
	else begin 
	
		case (op_reg)
	   
          2'b01: saida <=  in;
          2'b10: saida <= {1'b0,saida[4:1]};
			 2'b11: saida <=  {saida[3:0],1'b0};
          
        endcase 
	end 
end



endmodule
