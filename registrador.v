// Aluno: Thiago Batista Araújo
//Matricula: 2021032968

module registrador (dados, clk, rst, hab, saida);

input  [3:0] dados;
input  clk;
input  rst;
input hab;

output reg [3:0] saida;


always @ ( posedge clk or posedge !rst )
begin
	if (!rst)
		 begin
			saida <= 0;
		  end
	else
		begin
			if(hab)
				begin
				  saida <= dados;
			end
		end
end


endmodule
