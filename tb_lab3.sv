`timescale 1ps/1ps;
module tb_lab3();

	reg [3:0] sim_SW,
				 sim_KEY;
				 
	reg [6:0] sim_HEX0,
				 sim_HEX1,
				 sim_HEX2,
				 sim_HEX3,
				 sim_HEX4,
				 sim_HEX5;
				 
	reg [9:0] sim_LED;
	
	lab3 DUT (.SW(sim_SW), .KEY(sim_KEY), .HEX0(sim_HEX0), 
				 .HEX1(sim_HEX1), .HEX2(sim_HEX2), .HEX3(sim_HEX3),
				 .HEX4(sim_HEX4), .HEX5(sim_HEX5), .LEDR(sim_LED));
				 
	initial begin 
		//start by resetting the fsm
		sim_KEY[3] = 1'b0;
		#5;
		sim_KEY[0] = 1'b0;
		
		//trying the first combination 9
		sim_SW = 4'b1001;
		#5;
		
		$display("The HEX0 display is %b, we expected %b", sim_HEX0, 7'b0010000);
		
		
		//trying the second combination 4
		sim_SW = 4'b0100;
		#5;
		
		$display("The HEX0 display is %b, we expected %b", sim_HEX0, 7'b0011001);
		
		//trying the first combination 6
		sim_SW = 4'b0110;
		#5;
		
		$display("The HEX0 display is %b, we expected %b", sim_HEX0, 7'b0000010);
		
		//trying the first combination 2
		sim_SW = 4'b0010;
		#5;
		
		$display("The HEX0 display is %b, we expected %b", sim_HEX0, 7'b0100100);
		
		//trying the first combination 2
		sim_SW = 4'b0010;
		#5;
		
		$display("The HEX0 display is %b, we expected %b", sim_HEX0, 7'b0100100);
		
		//trying the first combination 2
		sim_SW = 4'b0010;;
		#5;
		
		$display("The HEX0 display is %b, we expected %b", sim_HEX0, 7'b0100100);
		
		//trying input over 10, should display error
		sim_SW = 4'b1011;
		#5;
		
		$display("The HEX0 display is %b, we expected %b", sim_HEX0, 7'b1001110);
		$display("THe HEX1 display is %b, we expected %b", sim_HEX1, 7'b0100011);
		
		//trying full combination
		sim_SW = 4'b1001;
		#5;
		sim_SW = 4'b0100;
		#5;
		sim_SW = 4'b0110;
		#5;
		sim_SW = 4'b0010;
		#5;
		sim_SW = 4'b0010;
		#5;
		sim_SW = 4'b0010;
		#5;
		
		$display("The HEX0 display is %b, we expected %b", sim_HEX0, 7'b0100001);
		$display("THe HEX1 display is %b, we expected %b", sim_HEX1, 7'b0000110);
		
		//trying closed lock
		sim_SW = 4'b1001;
		#5;
		sim_SW = 4'b0100;
		#5;
		sim_SW = 4'b0110;
		#5;
		sim_SW = 4'b0010;
		#5;
		sim_SW = 4'b0010;
		#5;
		sim_SW = 4'b0010;
		#5;
		
		$display("The HEX0 display is %b, we expected %b", sim_HEX0, 7'b0100001);
		$display("THe HEX1 display is %b, we expected %b", sim_HEX1, 7'b0000110);
		
		//trying reset in the middle of combination
		sim_SW = 4'b1001;
		#5;
		sim_SW = 4'b0100;
		#5;
		sim_SW = 4'b0110;
		#5;
		sim_KEY[3] = 1'b0;
		#5;
		sim_KEY[0] = 1'b0;
		
		
		$display("The HEX0 display is %b, we expected %b", sim_HEX0, 7'b1000000);
		
	end 
endmodule: tb_lab3