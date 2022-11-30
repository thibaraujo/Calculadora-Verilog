// Aluno: Thiago Batista Araújo
//Matricula: 2021032968

module topModule (clk, rst, Dados, Instrucao, Disp_RegA, Disp_RegB, Disp_Saida, state, saida_regC, fim);

input wire [3:0] Dados;
input clk,rst,Instrucao;

output fim; 
output [6:0] Disp_RegA,Disp_RegB,Disp_Saida;
output [3:0]state;
output wire [4:0]saida_regC;

wire [3:0] saidaA,saidaB;
wire [4:0]saidaSel;
wire Sel,EnB,EnA;
wire [1:0]Op, Op_Reg;
wire[4:0] saidaUla;


//module mealy (clk,instrucao,fim,enA,enB,op,op_Reg,sel,rst,state);
mealy Cn (clk,Instrucao,fim,EnA,EnB,Op,Op_Reg,Sel,rst,state);

//module registrador (dados, clk, rst, hab, saida);
registrador RA(Dados, clk, rst, EnA , saidaA);
registrador RB(Dados, clk, rst, EnB , saidaB);

//module mux (in0, in1, sel,saida);
mux M1({1'b0,saidaB}, saida_regC, Sel,saidaSel);

//module ula (inA, inB, op, saida);
ula U1({1'b0,saidaA}, saidaSel,Op,saidaUla);

//module regC (in,clk,rst,op_reg,saida);
regC rc (saidaUla,clk,rst,Op_Reg,saida_regC);

//module display (Entrada, Hex);
display D0 ({1'b0,saidaA}, Disp_RegA);
display D1 ({1'b0,saidaB}, Disp_RegB);
display D2 (saida_regC, Disp_Saida);


endmodule
