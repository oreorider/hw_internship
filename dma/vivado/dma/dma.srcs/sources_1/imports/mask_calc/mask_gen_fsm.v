module mask_gen_fsm(
input         clk,
input         rstn,
input		  force_idle,
input         i_start, 
input  [11:0] q_width,
input  [ 5:0] q_2d_filter_size,	
input  [ 3:0] i_current_conv_layer,
input		  i_mask_loaded,
output        o_ctrl_data_run,
output 		  o_ctrl_sync_run,
output 		  o_ctrl_load_batch,
output		  o_ctrl_skip_run,
output [3:0]  o_batch_ch_idx,
output [9:0]  o_local_col_idx,
output [9:0]  o_local_row_idx,
output [1:0]  o_mask_layer,
output [3:0]  o_pix_idx,
output		  o_end_frame
//output		  o_layer_done
);

parameter SYNC_DELAY 	= 500;
parameter LOAD_DELAY	= 900;
parameter SKIP_DELAY	= 100;
localparam ST_IDLE 		= 0, 
           ST_GEN_MASK 	= 1,
		   ST_LOAD_BATCH = 2,
		   ST_SYNC		= 3,
		   ST_SKIP_LOAD = 4;

reg [ 2:0] cstate;  
reg [ 2:0] nstate;  
reg        ctrl_data_run;
reg		   ctrl_sync_run;
reg		   ctrl_load_batch;
reg		   ctrl_skip_run;
wire       end_of_line;
wire       end_of_batch;
wire	   layer_done;
wire	   end_frame;
reg [3:0]  batch_ch_idx;
reg [9:0]  local_row_idx;
reg [9:0]  local_col_idx;
reg [1:0]  mask_layer;
reg [1:0]  mask_layer_adv;
reg [10:0] sync_counter;
reg [10:0] load_batch_counter;
reg [10:0] skip_load_count;
//reg [10:0] startup_counter;
reg [3:0] pix_idx;

//-------------------------------------------------
// FSM
//-------------------------------------------------
always@(posedge clk, negedge rstn, posedge force_idle)
begin
    if(!rstn || force_idle) begin
        cstate <= ST_IDLE;
    end
    else begin
        cstate <= nstate;
    end
end

always @(*) begin
    ctrl_data_run = 0;
	ctrl_sync_run = 0;
	ctrl_load_batch = 0;
	ctrl_skip_run = 0;
	nstate = cstate;
	case(cstate)
		ST_IDLE: begin
			ctrl_data_run = 0;
			ctrl_sync_run = 0;
			ctrl_load_batch = 0;
			ctrl_skip_run = 0;
			if(i_start)
				nstate = ST_SYNC;
			else
				nstate = ST_IDLE;
        end	
		ST_LOAD_BATCH: begin
			ctrl_data_run = 0;
			ctrl_sync_run = 0;
			ctrl_load_batch = 1;
			ctrl_skip_run = 0;
			if(load_batch_counter == LOAD_DELAY)begin
				nstate = ST_GEN_MASK;
			end
			else nstate = ST_LOAD_BATCH;
		end
        ST_GEN_MASK: begin
			ctrl_data_run = 1;
			ctrl_sync_run = 0;
			ctrl_load_batch = 0;
			ctrl_skip_run = 0;
			//if finished generating mask, load mask weights for next conv layer
			if(end_frame && i_current_conv_layer != 'd7 && mask_layer != 'd2)
				nstate = ST_SYNC;
			else if(end_frame && mask_layer == 'd2)
				nstate = ST_IDLE;
			else if(end_of_line)begin//if end of line, and end of batch (for layer 1, 3)
				nstate = ST_LOAD_BATCH;
			end

			else if(local_col_idx == q_width - 4 && pix_idx == 'd8)begin//end of line for layer 2
				if(local_row_idx == 0)//if special case in layer 2
					nstate = ST_SKIP_LOAD;
				else if(local_row_idx == q_width - 2)//if special case in layer 2
					nstate = ST_SKIP_LOAD;
				else
					nstate = ST_LOAD_BATCH;
			end
			else
				nstate = ST_GEN_MASK;
		end
		ST_SKIP_LOAD : begin
			ctrl_data_run = 0;
			ctrl_sync_run = 0;
			ctrl_load_batch = 0;
			ctrl_skip_run = 1;
			if(skip_load_count == SKIP_DELAY)
				nstate = ST_GEN_MASK;
			else
				nstate = ST_SKIP_LOAD;
		end
		ST_SYNC: begin
			ctrl_data_run = 0;
			ctrl_sync_run = 1;
			ctrl_load_batch = 0;
			ctrl_skip_run = 0;
			if(sync_counter == SYNC_DELAY)begin//if mask all loaded, wait for start signal
				nstate = ST_LOAD_BATCH;
			end
			else
				nstate = ST_SYNC;
		end
		default: 
			nstate = ST_IDLE;
	endcase
end

//skip load counter
always@(posedge clk, negedge rstn)begin
	if(~rstn) skip_load_count <= 0;
	else begin
		if(cstate == ST_SKIP_LOAD) skip_load_count <= skip_load_count + 1;
		else skip_load_count <= 0;
	end
end

//load batch counter increment
always@(posedge clk, negedge rstn)begin
	if(~rstn) load_batch_counter <= 0;
	else begin
		if(cstate == ST_LOAD_BATCH) load_batch_counter <= load_batch_counter + 1;
		else load_batch_counter <= 0;
	end
end

//sync counter
always@(posedge clk, negedge rstn)begin
	if(!rstn) begin
		sync_counter <= 'd0;
	end
	else begin
		if(cstate == ST_SYNC)begin
			sync_counter <= sync_counter + 'd1;
		end
		else
			sync_counter <= 'd0;
	end
end



always@(posedge clk, negedge rstn)
begin
	if(!rstn) begin
		batch_ch_idx 	<= 0;
		local_row_idx 	<= 0;

		mask_layer 		<= 0;
		mask_layer_adv  <= 0;

		// for testing FSM for layer 2
		//mask_layer 		<= 1;

		// for testing FSM layer 3
		//mask_layer 		<= 2;

		local_col_idx 	<= 0;
		pix_idx 		<= 0;
	end
	else begin
		//between layers
		if(ctrl_sync_run)begin
			if(sync_counter == SYNC_DELAY)begin
				mask_layer <= mask_layer_adv;
				mask_layer_adv <= mask_layer_adv + 1;
				batch_ch_idx <= 0;
				local_row_idx <= 0;
				local_col_idx <= 0;
				pix_idx <= 0;
			end
		end
		//between batches
		//between rows of data
		//else if(ctrl_load_batch)begin
		//	
		//end
		//FIRST LAYER
		else if(ctrl_data_run && mask_layer == 2'd0) begin
			//if end of line reached
			if(end_of_line)begin
				local_row_idx 	<= local_row_idx + 1;
				local_col_idx 	<= 0;
				batch_ch_idx 	<= 0;
			end
			else begin//if not end of line
				//if completed 8 batches of channel iterations
				if(end_of_batch && !end_of_line)begin 
					batch_ch_idx <= 0;
					local_col_idx <= local_col_idx + 'd4;
				end
				
				//if 8 batches of iterations still happening
				else begin
					batch_ch_idx <= batch_ch_idx + 1;
				end
			end
		end
		
		//SECOND LAYER
		else if(ctrl_data_run && mask_layer == 2'd1)begin
			if(pix_idx == 'd8)begin//if finished all 9 pixels of conv filter
				if(local_col_idx == q_width - 4)begin//if last batch of row
					local_col_idx <= 0;
					local_row_idx <= local_row_idx + 1;
					pix_idx <= 0;
				end
				else begin//not last batch of row
					local_col_idx <= local_col_idx + 'd4;
					pix_idx <= 0;
				end
			end			
			else begin//not all 9 pixels finished
				pix_idx <= pix_idx + 1;
			end
		end

		//THIRD LAYER
		//in third layer, batch_ch_idx control which output channel
		else if(ctrl_data_run && mask_layer == 2'd2)begin
			if((local_col_idx == q_width - 4) && batch_ch_idx == 4'd7)begin//end of line
				local_row_idx 	<= local_row_idx + 1;
				local_col_idx 	<= 0;
				batch_ch_idx 	<= 0;
			end
			else begin//not end of line
				if(batch_ch_idx == 4'd7)begin//if end of batch
					batch_ch_idx <= 0;
					local_col_idx <= local_col_idx + 'd4;
				end
				else begin
					batch_ch_idx <= batch_ch_idx + 1;
				end
			end
		end
	end
end



//end of line if batch col = 128 && batch_ch_idx = 7
assign end_of_line 		= (local_col_idx == 'd124) && (batch_ch_idx == 4'd7);
assign end_of_batch 	= (batch_ch_idx == 4'd7);

assign o_ctrl_data_run 	 = ctrl_data_run;
assign o_ctrl_sync_run   = ctrl_sync_run;
assign o_ctrl_load_batch = ctrl_load_batch;
assign o_ctrl_skip_run   = ctrl_skip_run;

assign o_end_of_line   	= end_of_line;
assign o_batch_ch_idx  	= batch_ch_idx;
assign o_local_col_idx	= local_col_idx;
assign o_local_row_idx 	= local_row_idx;
assign o_mask_layer		= mask_layer;
assign end_frame		= 	(mask_layer == 'd0) ? ((local_col_idx == 'd124) && (local_row_idx == 'd127) && (batch_ch_idx == 4'd7)):
							(mask_layer == 'd1) ? ((local_col_idx == 'd124) && (local_row_idx == 'd127) && (pix_idx == 'd8)) : 
							(mask_layer == 'd2) ? ((local_col_idx == 'd124) && (local_row_idx == 'd127) && (batch_ch_idx == 'd7)):
							0;

assign o_end_frame		= end_frame;
assign layer_done		= end_frame;//redundant signal
assign o_layer_done 	= layer_done;

assign o_pix_idx 		= pix_idx;

endmodule
