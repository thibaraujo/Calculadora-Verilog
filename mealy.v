// Aluno: Thiago Batista Araújo
//Matricula: 2021032968
module mealy (clk,instrucao,fim,enA,enB,op,op_Reg,sel,rst,state);

input clk,instrucao,rst;

output reg fim,enA,enB,sel;
output reg[1:0]op,op_Reg;
output reg[3:0] state;

			
parameter  S0 = 4'b0000,
			  S1 = 4'b0001,
			  S2 = 4'b0010,
			  S3 = 4'b0011,
			  S4 = 4'b0100,
			  S5 = 4'b0101,
			  S6 = 4'b0110,
			  S7 = 4'b0111,
			  S8 = 4'b1111;
			  
		
initial begin
	state <= S0;	 
 end
 
 
always@(posedge clk or posedge !rst)
begin
	if (!rst) state<=S0;
	else 
		case(state)
			S0: state <= S1;
			S1: state <= (instrucao ? S4 : S2);
			S2: state <= S3;
			S3: state <= S8;
			S4: state <= S5;
			S5: state <= S6;
			S6: state <= S7;
			S7: state <= S8;
			S8: state <= S0;
		endcase
end
 
 /*
		OP_REG:
		
		- 0: manter dados
		- 1: carregar dados
		- 2: deslocamento para direita
		- 3: deslocamento para esquerda
		
		OP:
		
		- 0: A
		- 1: A + B
		- 2: A - B
		- 3: ~A
	*/
 
always@ (state)
begin //setando padrao
	enA <= 0; //carrega A
	enB <= 0; //regB
	sel <= 0; // 0 = regB, 1 = regC
	fim = 0; 
	op = 0; // ULA
	op_Reg = 0; // regC
	
	case(state)
		S0: 
			begin
				enA <= 1; //carrega A
				enB <= 0; //regB
				sel <= 0; // 0 = regB, 1 = regC
				fim = 0; 
				op <= 0; // ULA
				op_Reg <= 0; // regC
			end
		S1: 
			begin
				enA <= 0;
				enB <=1 ;// carrega B
				sel <= 0; // 0 = regB, 1 = regC
				fim = 0; 
				op <= 0; // ULA
				op_Reg <= 0; // regC
			end 
		
		S2:
			begin
				op <= 2; //ula faz A - B
				op_Reg <= 1; //regC carrega dados
				enA <= 0; 
				enB <= 0; 
				sel <= 0; 
				fim = 0; 
			end
		
		S3: 
			begin 
				sel <= 1; //ula pega dados que vem de regC (e nao de regB), ou seja, pega (A - B) que foi carregada anteriormente
				op = 1; //ula faz A + B (no caso A + (A - B) = 2*A + B)
				op_Reg <= 1; // regC carrega dados
				enA <= 0; 
				enB <= 0; 
			end // FIM OPERACAO 1
			 
		S4: // INICIO OPERACAO 2
			begin 
				sel <= 0;
				op <= 1; // ULA faz A + B
				op_Reg <= 1; //regC carrega dados
				enA <= 0; 
				enB <= 0; 
			end 
				
		S5: 
			begin
				sel <= 1;
				op <= 1; // ULA faz A+B, ou seja, (A + (A+B)) = 2*A+B
				op_Reg <= 1; // ULA carrega dados
				enA <= 0; 
				enB <= 0; 
			end
		
		S6: 
			begin
				sel <= 1;
				op <=  1; // ULA faz A+B, ou seja, (A + (A + (A+B))) = 3*A + B
				op_Reg <= 1; // ULA carrega dados
				enA <= 0; 
				enB <= 0; 
			end
			
			
		S7:
			begin
				op_Reg <= 2; // ULA faz deslocamento de bit para direita
				op <= 0;
				sel <= 0;
				enA <= 0;
				enB <= 0;
			end // FIM OPERACAO 2
			
		S8:
			begin
				fim <= 1;
			end 		
	endcase
end
 
 
endmodule 