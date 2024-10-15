//1011重叠检测
module Sys_Rst(
    input       clk,
    input       rst_n,
	 input       d,
    output reg  done
);

parameter IDLE = 3'd0,
         S0   = 3'd1,
         S1   = 3'd2,
         S2   = 3'd3,
         S3   = 3'd4;

reg [2:0] cur_state,next_state;


//第一段，描述状态寄存器
always @(posedge clk or negedge rst_n) 
    if(!rst_n)            
        cur_state <= 4'b0;
  
    else                       
        cur_state <= next_state;     

//第二段，组合逻辑描述状态转移
always @(*)begin
    case (cur_state)
        IDLE: next_state <= d ? S0 : IDLE;
        S0:   next_state <= d ? S0 : S1;
        S1:   next_state <= d ? S2 : IDLE;
        S2:   next_state <= d ? S3 : S1;
        S3:   next_state <= d ? S0 : S1;
        default: next_state =  S0;
    endcase
end
//第三段，状态输出
always @(posedge clk or negedge rst_n) 
    if(!rst_n)       
        done <= 0;
  
    else if(next_state ==  S3)                   
        done <= 1;  
    else 
        done <= 0;


endmodule 
