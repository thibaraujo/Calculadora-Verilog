module mux (in0, in1, sel,saida);

input  [4:0] in0,in1;
input sel;

output reg [4:0] saida;


always @ (*)
begin
	if (sel)
		 begin
			saida <= in1;
		  end
	else
		begin
			
			saida <= in0;
			end
end
endmodule
