module state_machine_1 (
    input go, kill, clk, reset,
    output reg [6:0] count,
    output reg done
);

// internal signal
reg [1:0] state_reg;

// parameters state machine
parameter idle = 2'b00;
parameter active = 2'b01;
parameter finish = 2'b10;
parameter abort = 2'b11;

// state machine
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state_reg <= idle;

    end else begin
        case (state_reg)
            idle: 
            if (go) begin
                state_reg <= active;
            end

            active: 
            if (kill) begin
                state_reg <= abort;
            end
            else if (count == 7'd100) begin
                state_reg <= finish;
            end

            abort:
            if (!kill) begin
                state_reg <= idle;
            end

            finish:
                state_reg <= idle;

            default: 
                state_reg <= idle;
        endcase
    end
end

// counter
always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 7'h00;
    end
    else if (state_reg == finish || state_reg == abort) begin
        count <= 7'h00;
    end
    else if (state_reg == active) begin
        count <= count + 1;
    end
end

// register
always @(posedge clk or posedge reset) begin
    if (reset) begin
        done <= 1'b0;
    end else if (state_reg == finish) begin
        done <= 1'b1;
    end else begin
        done <= 1'b0;
    end
end

endmodule