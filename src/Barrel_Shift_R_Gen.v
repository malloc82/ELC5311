module Barrel_Shift_R_Gen#(
    parameter ADDRESS_BITS = 3
    )(
    input wire[WIDTH-1:0] num,
    input wire[ADDRESS_BITS-1:0] amt,
    output wire[WIDTH-1:0] shifted
    );

    localparam WIDTH = 2**ADDRESS_BITS;
	 
    wire[WIDTH-1:0] intermediate[ADDRESS_BITS:0];
	 
    assign intermediate[0] = num;
    assign shifted         = intermediate[ADDRESS_BITS];

    genvar i;
    generate
        for(i=0;i<ADDRESS_BITS;i=i+1)
            assign intermediate[i+1] = amt[i] ? {intermediate[i][2**i-1:0],intermediate[i][WIDTH-1:2**i]} : intermediate[i];
    endgenerate
endmodule
