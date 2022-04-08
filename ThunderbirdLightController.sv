module FSM (clk, reset, Left, Right, LA, LB, LC, RA, RB, RC);

   input logic  clk;
   input logic  reset;
   input logic 	Left;
   input logic  Right;

   output logic LA, LB, LC, RA, RB, RC;

   typedef enum 	logic [9:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9} statetype;
   statetype state, nextstate;
   
   // state register
   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
   
   // next state logic
   always_comb
     case (state)
       S0: begin
	  LA <= 1'b0;	  
    LB <= 1'b0;	  
    LC <= 1'b0;	  
    RA <= 1'b0;	  
    RB <= 1'b0;	  
    RC <= 1'b0;	  
	  if (Left && Right) nextstate <= S7;
    else if (!Left && Right) nextstate <= S4;
    else if (Left && !Right) nextstate <= S1;
	  else   nextstate <= S0;
       end
       S1: begin
	  LA <= 1'b1;	  
    LB <= 1'b0;	  
    LC <= 1'b0;	  
    RA <= 1'b0;	  
    RB <= 1'b0;	  
    RC <= 1'b0;		  	  
	  nextstate <= S2;
       end
       S2: begin
	  LA <= 1'b1;	  
    LB <= 1'b1;	  
    LC <= 1'b0;	  
    RA <= 1'b0;	  
    RB <= 1'b0;	  
    RC <= 1'b0;	  	  
	  nextstate <= S3;
       end
       S3: begin
	  LA <= 1'b1;	  
    LB <= 1'b1;	  
    LC <= 1'b1;	  
    RA <= 1'b0;	  
    RB <= 1'b0;	  
    RC <= 1'b0;		  	  
	  nextstate <= S0;
       end
       S4: begin
	  LA <= 1'b0;	  
    LB <= 1'b0;	  
    LC <= 1'b0;	  
    RA <= 1'b1;	  
    RB <= 1'b0;	  
    RC <= 1'b0;		  	  
	  nextstate <= S5;
       end
       S5: begin
	  LA <= 1'b0;	  
    LB <= 1'b0;	  
    LC <= 1'b0;	  
    RA <= 1'b1;	  
    RB <= 1'b1;	  
    RC <= 1'b0;		  	  
	  nextstate <= S6;
       end
       S6: begin
	  LA <= 1'b0;	  
    LB <= 1'b0;	  
    LC <= 1'b0;	  
    RA <= 1'b1;	  
    RB <= 1'b1;	  
    RC <= 1'b1;		  	  
	  nextstate <= S0;
       end
       S7: begin
	  LA <= 1'b1;	  
    LB <= 1'b0;	  
    LC <= 1'b0;	  
    RA <= 1'b1;	  
    RB <= 1'b0;	  
    RC <= 1'b0;		  	  
	  nextstate <= S8;
       end
       S8: begin
	  LA <= 1'b1;	  
    LB <= 1'b1;	  
    LC <= 1'b0;	  
    RA <= 1'b1;	  
    RB <= 1'b1;	  
    RC <= 1'b0;		  	  
	  nextstate <= S9;
       end
       S9: begin
	  LA <= 1'b1;	  
    LB <= 1'b1;	  
    LC <= 1'b1;	  
    RA <= 1'b1;	  
    RB <= 1'b1;	  
    RC <= 1'b1;		  	  
	  nextstate <= S0;
       end
       default: begin
	  LA <= 1'b0;	  
    LB <= 1'b0;	  
    LC <= 1'b0;	  
    RA <= 1'b0;	  
    RB <= 1'b0;	  
    RC <= 1'b0;		  	  
	  nextstate <= S0;
       end
     endcase
   
endmodule
