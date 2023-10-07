module video(
	input            hdmi_clk,
	input 			  reset_n,
	output reg       vga_de,
	output reg       vga_hs,
	output reg       vga_vs,
	output wire      next_frame,
	output reg [7:0] vga_r,
	output reg [7:0] vga_g,
	output reg [7:0] vga_b);
	
reg  [11:0] h_total = 12'd2199, h_sync = 12'd43, h_start = 12'd189, h_end = 12'd2109; 
reg  [11:0] v_total = 12'd1124, v_sync = 12'd4, v_start = 12'd40, v_end = 12'd1120; 
reg  [11:0] right = 12'd1920, bottom = 12'd1080; 
	
reg 	pre_vga_de =	1'b0;

reg   v_act = 1'b0;
reg	v_act_d = 1'b0;
reg	[11:0] v_count = 12'b0;

reg	h_act = 1'b0;
reg	h_act_d = 1'b0;
reg	[11:0] h_count = 12'b0;
	
//vga_vs	=	1'b1;
//vga_hs	=	1'b1;
//vga_de	=	1'b0;
	
wire				h_max, hs_end, hr_start, hr_end;
wire				v_max, vs_end, vr_start, vr_end;
	
//=======================================================
//  Structural coding
//=======================================================
assign h_max = h_count == h_total;
assign hs_end = h_count >= h_sync;
assign hr_start = h_count == h_start; 
assign hr_end = h_count == h_end;
assign v_max = v_count == v_total;
assign vs_end = v_count >= v_sync;
assign vr_start = v_count == v_start; 
assign vr_end = v_count == v_end;
assign next_frame = h_max && v_max;
	
//horizontal control signals
always @ (posedge hdmi_clk or negedge reset_n)
	if (!reset_n)
	begin
		h_act		<=	1'b0;
		h_act_d	<=	1'b0;
		h_count	<=	12'b0;
		vga_hs	<=	1'b1;
	end
	else
	begin
		h_act_d	<=	h_act;
	
		if (h_max)
			h_count	<=	12'b0;
		else
			h_count	<=	h_count + 12'b1;

		if (hs_end && !h_max)
			vga_hs	<=	1'b1;
		else
			vga_hs	<=	1'b0;

		if (hr_start)
			h_act <=	1'b1;
		else if (hr_end)
			h_act <=	1'b0;
	end

//vertical control signals
always@(posedge hdmi_clk or negedge reset_n)
if(!reset_n)
	begin
		v_act			<= 1'b0;
		v_act_d		<=	1'b0;
		v_count		<=	12'b0;
		vga_vs		<=	1'b1;
	end
	else
	begin		
		if (h_max)
		begin		 
			v_act_d	  <=	v_act;		
		
			if (v_max)
				v_count	<=	12'b0;
			else
				v_count	<=	v_count + 12'b1;
				
			if (vs_end && !v_max)
				vga_vs	<=	1'b1;
			else
				vga_vs	<=	1'b0;
				
			if (vr_start)
				v_act <=	1'b1;
			else if (vr_end)
				v_act <=	1'b0;
		end
	end
	
//pattern generator and display enable
always @(posedge hdmi_clk or negedge reset_n)
begin
	if (!reset_n)
	begin
		vga_de		<=	1'b0;
		pre_vga_de	<=	1'b0;		
	end
	else
	begin
		vga_de		<=	pre_vga_de;
		pre_vga_de	<=	v_act && h_act;
    
		if(h_act_d && v_act_d)
			{vga_r, vga_g, vga_b} <= {8'h0F,8'h0F,8'hF0};
		else
			{vga_r, vga_g, vga_b} <= {8'h00,8'h00,8'h00};
	end
end
	
endmodule
