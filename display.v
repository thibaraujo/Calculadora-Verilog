module display (Entrada, Hex);

input wire[4:0] Entrada;
output reg [6:0] Hex;

// Digits and symbols as parameters
//localparam espaco   = 7'b1111111; //7F' '
localparam menos    = 7'b0111111; //3F'-'
localparam zero     = 7'b1000000; //40'0'
localparam um 	     = 7'b1111001; //79'1'
localparam dois     = 7'b0100100; //24'2'
localparam tres     = 7'b0110000; //30'3'
localparam quatro   = 7'b0011001; //19'4'
localparam cinco    = 7'b0010010; //12'5'
localparam seis     = 7'b0000010; //02'6'
localparam sete     = 7'b1111000; //78'7'
localparam oito 	  = 7'b0000000; //00'8'
localparam nove 	  = 7'b0011000; //18'9'
localparam dez      = 7'b0001000; //77'A'
localparam onze     = 7'b0000011; //03'B'
localparam doze     = 7'b1000110; //70'C'
localparam treze 	  = 7'b0100001; //21'D'
localparam quatorze = 7'b0000110; //06'E'
localparam quinze   = 7'b0001110; //0E'F'


always @ (Entrada) 
	case (Entrada)
	  // Positive values 
          5'b00000: Hex <=  {zero};
          5'b00001: Hex <=  {um};
          5'b00010: Hex <=  {dois};
          5'b00011: Hex <=  {tres};
          5'b00100: Hex <=  {quatro};
          5'b00101: Hex <=  {cinco};
          5'b00110: Hex <=  {seis};
          5'b00111: Hex <=  {sete};
          5'b01000: Hex <=  {oito};
          5'b01001: Hex <=  {nove};
			 5'b01010: Hex <=  {dez};
          5'b01011: Hex <=  {onze};
          5'b01100: Hex <=  {doze};
          5'b01101: Hex <=  {treze};
          5'b01110: Hex <=  {quatorze};
          5'b01111: Hex <=  {quinze};
			 
          
          default:   {Hex} <= {menos};
        endcase
endmodule
