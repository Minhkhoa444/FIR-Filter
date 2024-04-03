/*
    Order 30 FIR filter
*/

module fir_filter #(
    parameter coeff_width = 16,
    parameter input_width = 16,
    parameter output_width = 16,
    parameter internal_width = 16
) (    
    // AXI Stream
    input                                   aclk,
    input[input_width-1:0]                  s_axis_tdata,
    input                                   s_axis_tlast,
    input                                   s_axis_tvalid,
    output                                  s_axis_tready,
    output[output_width-1:0]                m_axis_tdata,
    output reg                              m_axis_tlast,
    output reg                              m_axis_tvalid,
    input                                   m_axis_tready,
    // AXI Stream
    
    input                                   rst_i,    
    input signed[coeff_width-1:0]           b0_i,
    input signed[coeff_width-1:0]           b1_i,
    input signed[coeff_width-1:0]           b2_i,
    input signed[coeff_width-1:0]           b3_i,
    input signed[coeff_width-1:0]           b4_i,
    input signed[coeff_width-1:0]           b5_i,
    input signed[coeff_width-1:0]           b6_i,
    input signed[coeff_width-1:0]           b7_i,
    input signed[coeff_width-1:0]           b8_i,
    input signed[coeff_width-1:0]           b9_i,
    input signed[coeff_width-1:0]           b10_i,
    input signed[coeff_width-1:0]           b11_i,
    input signed[coeff_width-1:0]           b12_i,
    input signed[coeff_width-1:0]           b13_i,
    input signed[coeff_width-1:0]           b14_i,
    input signed[coeff_width-1:0]           b15_i,
    input signed[coeff_width-1:0]           b16_i,
    input signed[coeff_width-1:0]           b17_i,
    input signed[coeff_width-1:0]           b18_i,
    input signed[coeff_width-1:0]           b19_i,
    input signed[coeff_width-1:0]           b20_i,
    input signed[coeff_width-1:0]           b21_i,
    input signed[coeff_width-1:0]           b22_i,
    input signed[coeff_width-1:0]           b23_i,
    input signed[coeff_width-1:0]           b24_i,
    input signed[coeff_width-1:0]           b25_i,
    input signed[coeff_width-1:0]           b26_i,
    input signed[coeff_width-1:0]           b27_i,
    input signed[coeff_width-1:0]           b28_i,
    input signed[coeff_width-1:0]           b29_i,
    input signed[coeff_width-1:0]           b30_i
);

    reg signed[internal_width-1:0] pipe0, pipe1, pipe2, pipe3, pipe4, pipe5, pipe6, pipe7, pipe8, pipe9, pipe10, 
                                pipe11, pipe12, pipe13, pipe14, pipe15, pipe16, pipe17, pipe18, pipe19, pipe20,
                                pipe21, pipe22, pipe23, pipe24, pipe25, pipe26, pipe27, pipe28, pipe29, pipe30;

    reg signed[internal_width + internal_width:0] acc0, acc1, acc2, acc3, acc4, acc5, acc6, acc7, acc8, acc9, acc10, 
                                                acc11, acc12, acc13, acc14, acc15, acc16, acc17, acc18, acc19, acc20,
                                                acc21, acc22, acc23, acc24, acc25, acc26, acc27, acc28, acc29, acc30;
    
    always @(posedge aclk) begin
        if(rst_i) begin
            m_axis_tvalid <= 0;
            m_axis_tlast <= 0;
        end
        else begin
            m_axis_tvalid <= s_axis_tvalid;
            m_axis_tlast <= s_axis_tlast;
        end
    end

    always @(posedge aclk) begin
        if(rst_i) begin 
            pipe0 <= 0;
            pipe1 <= 0;
            pipe2 <= 0;
            pipe3 <= 0;
            pipe4 <= 0;
            pipe5 <= 0;
            pipe6 <= 0;
            pipe7 <= 0;
            pipe8 <= 0;
            pipe9 <= 0;
            pipe10 <= 0;
            pipe11 <= 0;
            pipe12 <= 0;
            pipe13 <= 0;
            pipe14 <= 0;
            pipe15 <= 0;
            pipe16 <= 0;
            pipe17 <= 0;
            pipe18 <= 0;
            pipe19 <= 0;
            pipe20 <= 0;
            pipe21 <= 0;
            pipe22 <= 0;
            pipe23 <= 0;
            pipe24 <= 0;
            pipe25 <= 0;
            pipe26 <= 0;
            pipe27 <= 0;
            pipe28 <= 0;
            pipe29 <= 0;
            pipe30 <= 0;
        end
        else if(s_axis_tvalid) begin
            pipe0 <= s_axis_tdata;
            pipe1 <= pipe0;
            pipe2 <= pipe1;
            pipe3 <= pipe2;
            pipe4 <= pipe3;
            pipe5 <= pipe4;
            pipe6 <= pipe5;
            pipe7 <= pipe6;
            pipe8 <= pipe7;
            pipe9 <= pipe8;
            pipe10 <= pipe9;
            pipe11 <= pipe10;
            pipe12 <= pipe11;
            pipe13 <= pipe12;
            pipe14 <= pipe13;
            pipe15 <= pipe14;
            pipe16 <= pipe15;
            pipe17 <= pipe16;
            pipe18 <= pipe17;
            pipe19 <= pipe18;
            pipe20 <= pipe19;
            pipe21 <= pipe20;
            pipe22 <= pipe21;
            pipe23 <= pipe22;
            pipe24 <= pipe23;
            pipe25 <= pipe24;
            pipe26 <= pipe25;
            pipe27 <= pipe26;
            pipe28 <= pipe27;
            pipe29 <= pipe28;
            pipe30 <= pipe29;
        end
    end

    always @(posedge aclk) begin
        acc0 <= b0_i * pipe0;
        acc1 <= b1_i * pipe1;
        acc2 <= b2_i * pipe2;
        acc3 <= b3_i * pipe3;
        acc4 <= b4_i * pipe4;
        acc5 <= b5_i * pipe5;
        acc6 <= b6_i * pipe6;
        acc7 <= b7_i * pipe7;
        acc8 <= b8_i * pipe8;
        acc9 <= b9_i * pipe9;
        acc10 <= b10_i * pipe10;
        acc11 <= b11_i * pipe11;
        acc12 <= b12_i * pipe12;
        acc13 <= b13_i * pipe13;
        acc14 <= b14_i * pipe14;
        acc15 <= b15_i * pipe15;
        acc16 <= b16_i * pipe16;
        acc17 <= b17_i * pipe17;
        acc18 <= b18_i * pipe18;
        acc19 <= b19_i * pipe19;
        acc20 <= b20_i * pipe20;
        acc21 <= b21_i * pipe21;
        acc22 <= b22_i * pipe22;
        acc23 <= b23_i * pipe23;
        acc24 <= b24_i * pipe24;
        acc25 <= b25_i * pipe25;
        acc26 <= b26_i * pipe26;
        acc27 <= b27_i * pipe27;
        acc28 <= b28_i * pipe28;
        acc29 <= b29_i * pipe29;
        acc30 <= b30_i * pipe30;
    end

    assign m_axis_tdata = acc0 + acc1 + acc2 + acc3 + acc4 + acc5 + acc6 + acc7 + acc8 + acc9 + acc10 
                        + acc11 + acc12 + acc13 + acc14 + acc15 + acc16 + acc17 + acc18 + acc19 + acc20
                        + acc21 + acc22 + acc23 + acc24 + acc25 + acc26 + acc27 + acc28 + acc29 + acc30; 

endmodule
