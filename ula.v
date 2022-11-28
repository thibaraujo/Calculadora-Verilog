// Aluno: Thiago Batista Araújo
//Matricula: 2021032968
module ula (inA, inB, op, saida);

input  [4:0] inA,inB;
input [1:0]op;
reg Sinal;

output reg [4:0] saida;
//reg[4:0] tempb, tempoper;


always @ (*)
begin
	case (op)
	   
          2'b00: saida <=  inA;
          2'b01: saida <= inA + inB;
					
          2'b10: saida <=inA-inB;
			
          2'b11: saida <= ~inA;
        endcase 
end
endmodule
