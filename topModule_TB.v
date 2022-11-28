`timescale 1ns/1ps 
module topModule_TB;
	
reg [3:0] dadosA=16,dadosB=15,Dados;
reg Clk,Rst,Ins;
wire fim; 
wire [6:0] Hex0,Hex1,Hex2;
wire [3:0]state;
wire [4:0]saidaC;
reg[4:0] Res;
reg [9:0] Err=0,Acer=0;



	
 topModule test(Dados, Clk, Rst,Hex0,Hex1,Hex2,Ins,fim,state,saidaC);
	
	initial begin
		$display("\t\t  Time, Ins, Dado A,  Dado B, Saida,Fim, Res");
	

		Ins = 1'b0;
		
		dadosA=16;
		dadosB=15;
		
		
		repeat(16) begin
		
		dadosA = dadosA-1'b1; 
		
		Dados=4'b0000;
		Clk = 1'b0;
		Rst = 1'b0;
		#10 Rst = 1'b1;
		
		Dados=dadosA;
		#10 Dados=dadosB;
		
		
		repeat(16) begin
		#40 Dados=dadosA;
		#10 dadosB=dadosB - 1'b1;
		Dados=dadosB;end
		
		end



	
	//##########################################################################################
	
	   Ins = 1'b1;
		
		dadosA=16;
		dadosB=15;
		
		
		repeat(16) begin
		
		dadosA = dadosA-1'b1; 
		
		Dados=4'b0000;
		Clk = 1'b0;
		Rst = 1'b0;
		#10 Rst = 1'b1;
		
		Dados=dadosA;
		#10 Dados=dadosB;
		
		
		repeat(16) begin
		#40 Dados=dadosA;
		#10 dadosB=dadosB - 1'b1;
		Dados=dadosB;end
		
		end
	
	
  
	end
	
	always 		#5 	Clk = ~Clk;
	
	
	always@(fim)
	   begin
	     // O simbolo \t indica uma tabulacao"
		 
		  if (Ins)
			begin 
			
				Res = ((dadosA + dadosA) - dadosB) ;
			end 
			else begin Res = ((dadosA + dadosB)/2) ;end 
		  
		  
		  if (fim==1)
			begin 
				if (Res!= saidaC)
						begin 
						$display("%d,  %b, \t%d,\t\t\t\t%d ,\t%d , %b, %d ################### Erro, diferente do valor desejado",$time, Ins,dadosA,dadosB,saidaC,fim,Res);
						Err = Err +1; 
						end
				else begin 
				
				$display("%d,  %b, \t%d,\t\t\t\t%d ,\t%d , %d, %d",$time, Ins,dadosA,dadosB,saidaC,fim,Res);Acer=Acer+1;end
			end 
	 
		end
	
	initial begin
		#26260 $display(" \t\tTotal = %d, Erros = %d , Acertos = %d",(Err+Acer),Err,Acer);
		$finish;
		end
		
endmodule