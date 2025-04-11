\m5_TLV_version 1d: tl-x.org
\m5
   
   // ============================================
   // Welcome, new visitors! Try the "Learn" menu.
   // ============================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   |calc
      @1
         $val1[31:0] = $rand1[3:0];
         $val2[31:0] = $rand2[3:0];
      @2
         $su[31:0] = $val1[31:0] + $val2[31:0];
         $di[31:0] = $val1[31:0] - $val2[31:0];
         $pr[31:0] = $val1[31:0] * $val2[31:0];
         $qu[31:0] = $val1[31:0] / $val2[31:0];
         $op[1:0] = $rand[1:0];
      @3
         $out[31:0] = $reset ? 0 : ($op[1:0] == 2'b00) ? $su[31:0] : ($op[1:0] == 2'b01) ? $di[31:0] : ($op[1:0] == 2'b10) ? $pr[31:0] : $qu;
   
   //$cnt[31:0] = $reset ? 0 : >>1$cnt + 1;
   
   
   
   
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
