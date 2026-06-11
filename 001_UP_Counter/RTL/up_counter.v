module up_counter #(
  parameter COUNT_WIDTH = 16)
  (
    input clk ,
    input reset_n ,
    input enable ,
    input [COUNT_WIDTH - 1 : 0] count_value ,
    output reg count_done,
    output reg [COUNT_WIDTH - 1 : 0] count;
  );
  
  always @ (posedge clk or negedge reset_n) begin
    if (!reset_n) begin
          count <= 'h0;
          count_done <= 1'b0;
    end
    else begin
      count_done <= 1'b0;
     if (enable) begin
      if (count == count_value) begin
          count <= 'h0;
          count_done <= 1'b1;
      end
      else begin 
          count <= count + 1;
          count_done <= 1'b0;
      end 
     end
    end
  end
            
endmodule
