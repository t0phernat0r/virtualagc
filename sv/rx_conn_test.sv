
module rx_conn
  (input  logic [7:0] RX_byte,
   input  logic RX_valid,
   input  logic clk, resetn,
   output logic [4:0][2:0]  data_VERB, data_NOUN,
                            data_AXIG, data_AXIRA, data_AXIRB, data_AXIATX);

  logic [4:0][2:0] data_next_VERB, data_next_NOUN,
                   data_next_AXIG, data_next_AXIRA, data_next_AXIRB, data_next_AXIATX,
                   data_buf_VERB, data_buf_NOUN,
                   data_buf_AXIG, data_buf_AXIRA, data_buf_AXIRB, data_buf_AXIATX,
                   data_next_buf_VERB, data_next_buf_NOUN,
                   data_next_buf_AXIG, data_next_buf_AXIRA, data_next_buf_AXIRB, data_next_buf_AXIATX;
  logic [2:0] state_count, preset_state_count,
              byte_octal;
  logic incr_state_count, dn_state_count,
        byte_eq_start, byte_eq_end, byte_eq_neg, byte_eq_pos,
        state_signed, state_read;

  enum logic [2:0] {INIT = 3'd0,
                    VERB = 3'd1,
                    NOUN = 3'd2,
                    AXIG = 3'd3,
                    AXIRA = 3'd4,
                    AXIRB = 3'd5,
                    AXIATX = 3'd6} state, next_state;

  //
  // BYTE COUNTER
  //
  
  always_ff @(posedge clk) begin
  // Counter for byte reads in each state
    if (~resetn) begin
    // syncronous reset
      state_count <= 3'd0;
    end
    else if (state != next_state) begin
    // reset when entering new I/O reg state
      state_count <= 3'd0;
    end
    else if (incr_state_count) begin
    // increment case
      state_count <= state_count + 3'd1;
    end
    else begin
    // no increment, no reset case
      state_count <= state_count;
    end
  end

  //
  // STATE REGISTER AND LOGIC
  //
  
  always_ff @(posedge clk) begin
  // State register
    if (~resetn) begin
      state <= INIT;
    end
    else begin
      state <= next_state;
    end
  end

  always_comb begin
  // next_state driver
    unique case (state)
      INIT: begin
        next_state = (RX_valid & byte_eq_start) ? VERB : state;
      end 
      VERB: begin
        next_state = (RX_valid & dn_state_count) ? NOUN : state;
      end
      NOUN: begin
        next_state = (RX_valid & dn_state_count) ? AXIG : state;
      end
      AXIG: begin
        next_state = (RX_valid & dn_state_count) ? AXIRA : state;
      end
      AXIRA: begin
        next_state = (RX_valid & dn_state_count) ? AXIRB : state;
      end
      AXIRB: begin  
        next_state = (RX_valid & dn_state_count) ? AXIATX : state;
      end
      AXIATX: begin
        next_state = (RX_valid & dn_state_count) ? INIT : state;
      end
      default: begin
      end
    endcase 
  end

  //
  // INTERNAL COMBINATIONAL DRIVERS
  //
  
  always_comb begin
  // ASCII interpreter
    // Default assignments
    byte_eq_start = 1'b0;
    byte_eq_end = 1'b0;
    byte_eq_pos = 1'b0;
    byte_eq_neg = 1'b0;
    byte_octal = 3'd0;
    unique case (RX_byte)
      8'd60: begin
      // '<'
        byte_eq_start = 1'b1;
      end
      8'd62: begin
      // '>'
        byte_eq_end = 1'b1;
      end
      8'd43: begin
      // '+'
        byte_eq_pos = 1'b1;
      end
      8'd45: begin
      // '-'
        byte_eq_neg = 1'b1;
      end
      8'd48: begin
      // '0'
        byte_octal = 3'd0;
      end
      8'd49: begin
      // '1'
        byte_octal = 3'd1;
      end
      8'd50: begin
      // '2'
        byte_octal = 3'd2;
      end
      8'd51: begin
      // '3'
        byte_octal = 3'd3;
      end
      8'd52: begin
      // '4'
        byte_octal = 3'd4;
      end
      8'd53: begin
      // '5'
        byte_octal = 3'd5;
      end
      8'd54: begin
      // '6'
        byte_octal = 3'd6;
      end
      8'd55: begin
      // '7'
        byte_octal = 3'd7;
      end
      default: begin
      end
    endcase
  end

  always_comb begin 
    // Determine if current state requires sign interpretation
    state_signed = ((state == AXIG) |
                    (state == AXIRA) |
                    (state == AXIRB) |
                    (state == AXIATX));

    // Determine if current state involves data for input registers
    state_read = ((state == VERB) |
                  (state == NOUN) |
                  (state == AXIG) |
                  (state == AXIRA) |
                  (state == AXIRB) |
                  (state == AXIATX));

    // Set preset value for counter based on current state
    preset_state_count = (state_signed) ? 3'd5 : ((state_read) ? 3'd1 : 3'd0); 
    
    // Counter dn bit
    dn_state_count = (state_count == preset_state_count);

    // No counter increment enabled in IDLE
    incr_state_count = (state_read & RX_valid & ~dn_state_count);
  end
  
  //
  // INPUT REGISTER WRITES
  //
  
  always_ff @(posedge clk) begin
  // Input registers
    if (~resetn) begin
      data_VERB <= 15'd0;
      data_NOUN <= 15'd0;
      data_AXIG <= 15'd0;
      data_AXIRA <= 15'd0;
      data_AXIRB <= 15'd0;
      data_AXIATX <= 15'd0;  
    end
    else begin
      data_VERB <= data_next_VERB;
      data_NOUN <= data_next_NOUN;
      data_AXIG <= data_next_AXIG;
      data_AXIRA <= data_next_AXIRA;
      data_AXIRB <= data_next_AXIRB;
      data_AXIATX <= data_next_AXIATX;
    end
  end

  always_comb begin
  // Drive next value for input register updates
    // Default assignments
    data_next_VERB = data_VERB;
    data_next_NOUN = data_NOUN;
    data_next_AXIG = data_AXIG;
    data_next_AXIRA = data_AXIRA;
    data_next_AXIRB = data_AXIRB;
    data_next_AXIATX = data_AXIATX;

    unique case (state)
      VERB: begin
        if (RX_valid & dn_state_count) begin
          data_next_VERB = data_buf_VERB;
          data_next_VERB[state_count] = byte_octal;
        end
      end
      NOUN: begin
        if (RX_valid & dn_state_count) begin
          data_next_NOUN = data_buf_NOUN;
          data_next_NOUN[state_count] = byte_octal;
        end
      end
      AXIG: begin
        if (RX_valid & dn_state_count) begin
          data_next_AXIG = (byte_eq_neg) ? ~data_buf_AXIG : data_buf_AXIG;
        end    
      end
      AXIRA: begin
        if (RX_valid & dn_state_count) begin
          data_next_AXIRA = (byte_eq_neg) ? ~data_buf_AXIRA : data_buf_AXIRA;
        end
      end
      AXIRB: begin
        if (RX_valid & dn_state_count) begin
          data_next_AXIRB = (byte_eq_neg) ? ~data_buf_AXIRB : data_buf_AXIRB;
        end
      end
      AXIATX: begin
        if (RX_valid & dn_state_count) begin
          data_next_AXIATX = (byte_eq_neg) ? ~data_buf_AXIATX : data_buf_AXIATX;
        end
      end
      default: begin
      end
    endcase

  end
  
  always_ff @(posedge clk) begin
  // Buffer registers
    if (~resetn) begin
      data_buf_VERB <= 15'd0;
      data_buf_NOUN <= 15'd0;
      data_buf_AXIG <= 15'd0;
      data_buf_AXIRA <= 15'd0;
      data_buf_AXIRB <= 15'd0;
      data_buf_AXIATX <= 15'd0;  
    end
    else begin
      data_buf_VERB <= data_next_buf_VERB;
      data_buf_NOUN <= data_next_buf_NOUN;
      data_buf_AXIG <= data_next_buf_AXIG;
      data_buf_AXIRA <= data_next_buf_AXIRA;
      data_buf_AXIRB <= data_next_buf_AXIRB;
      data_buf_AXIATX <= data_next_buf_AXIATX;
    end
  end

  always_comb begin
  // Drive next value for buffer register updates
    // Default assignments
    data_next_buf_VERB = data_buf_VERB;
    data_next_buf_NOUN = data_buf_NOUN;
    data_next_buf_AXIG = data_buf_AXIG;
    data_next_buf_AXIRA = data_buf_AXIRA;
    data_next_buf_AXIRB = data_buf_AXIRB;
    data_next_buf_AXIATX = data_buf_AXIATX;

    unique case (state)
      VERB: begin
        if (RX_valid & ~dn_state_count) begin
          data_next_buf_VERB[state_count] = byte_octal;
        end
      end
      NOUN: begin
        if (RX_valid & ~dn_state_count) begin
          data_next_buf_NOUN[state_count] = byte_octal;
        end
      end
      AXIG: begin
        if (RX_valid & ~dn_state_count) begin
          data_next_buf_AXIG[state_count] = byte_octal;
        end     
      end
      AXIRA: begin
        if (RX_valid & ~dn_state_count) begin
          data_next_buf_AXIRA[state_count] = byte_octal;
        end
      end
      AXIRB: begin
        if (RX_valid & ~dn_state_count) begin
          data_next_buf_AXIRB[state_count] = byte_octal;
        end
      end
      AXIATX: begin
        if (RX_valid & ~dn_state_count) begin
          data_next_buf_AXIATX[state_count] = byte_octal;
        end
      end
      default: begin
      end
    endcase
  end

endmodule: rx_conn

module rx_test();
  logic [7:0] RX_byte;
  logic RX_valid, clk, resetn;
  logic [4:0][2:0] data_VERB, data_NOUN,
                   data_AXIG, data_AXIRA, data_AXIRB, data_AXIATX;

  rx_conn DUT (.RX_byte(RX_byte),
               .RX_valid(RX_valid), .clk(clk), .resetn(resetn),
               .data_VERB(data_VERB), .data_NOUN(data_NOUN),
               .data_AXIG(data_AXIG), .data_AXIRA(data_AXIRA), .data_AXIRB(data_AXIRB), .data_AXIATX(data_AXIATX));

  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $monitor($time,,
    "RX_byte: %d, RX_valid: %b, VERB: %o, NOUN: %o, G: %o, RA: %o",
    RX_byte, RX_valid, data_VERB[1:0], data_NOUN[1:0], data_AXIG, data_AXIRA);
    @(posedge clk);
    resetn <= 1'b0;
    RX_valid <= 1'b0;
    RX_byte <= 8'd62; // '>'
    @(posedge clk);
    resetn <= 1'b1;
    @(posedge clk);
    RX_valid <= 1'b1;
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd60; // '<'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd54; // '6'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd49; // '1'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd54; // '6'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd55; // '7'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd49; // '1'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd50; // '2'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd51; // '3'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd52; // '4'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd53; // '5'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd43; // '+'
    @(posedge clk);
    RX_valid <= 1'b0;
     @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd49; // '1'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd50; // '2'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd51; // '3'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd52; // '4'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd53; // '5'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk);
    RX_valid <= 1'b1;
    RX_byte <= 8'd45; // '-'
    @(posedge clk);
    RX_valid <= 1'b0;
    @(posedge clk) $finish;
  end 

endmodule