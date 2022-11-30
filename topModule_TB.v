// Aluno: Thiago Batista Araújo
// Matricula: 2021032968

`timescale 1ns/1ps 

module topModule_TB;
	
reg Clk, Rst, Instrucao;	
reg [3:0] dadosA=16, dadosB=15, Dados;

wire fim; 
wire [6:0]Hex0, Hex1, Hex2;
wire [3:0]state;
wire [4:0]saida_regC;


//module topModule (clk, rst, Dados, Instrucao, Disp_RegA, Disp_RegB, Disp_Saida, state, saida_regC, fim);
topModule test(Clk, Rst, Dados, Instrucao, Hex0, Hex1, Hex2,  state, saida_regC, fim);
	

initial begin
		#39400
		$finish;
end

always #7.5 Clk = ~Clk; //inversao de clock a cada 7.5ns



initial begin

	//CICLO INSTRUCAO = 0 => operacao 1
	Instrucao = 1'b0;
	//valores iniciais de dados de regA e regB 
	dadosA=16;
	dadosB=15;
	
	repeat(16) //faz 16 vezes, ou seja, varia de b'1111 a b'0000 
		begin
			dadosA = dadosA-1'b1; //variando dados 
			Dados = 4'b0000; //inicia em 0
			Clk = 1'b0; 
			Rst = 1'b0;
			#15 Rst = 1'b1; //esperar 15ns e rst = 1

			Dados = dadosA; 
			#15 Dados = dadosB;
			
			repeat(16) 
				begin
					#60 Dados=dadosA;
					#15 dadosB=dadosB - 1'b1;
					Dados=dadosB;
				end
	end
	
	//a logica eh: toda vez que regB varia de 1111 a 0000, eh decrementado b'1 de regA

	
	
	
	//CICLO INSTRUCAO = 1 => operacao 2 (segue a mesma logica de cima)
	Instrucao = 1'b1;
	dadosA=16;
	dadosB=15;
	
	
	repeat(16) 
		begin
			dadosA = dadosA-1'b1; 
			Dados=4'b0000;
			Clk = 1'b0;
			Rst = 1'b0;
			#15 Rst = 1'b1;
			
			Dados=dadosA;
			#15 Dados=dadosB;
			
			repeat(16) 
				begin
					#60 Dados=dadosA;
					#15 dadosB=dadosB - 1'b1;
					Dados=dadosB;
				end
		end
end
		
endmodule 