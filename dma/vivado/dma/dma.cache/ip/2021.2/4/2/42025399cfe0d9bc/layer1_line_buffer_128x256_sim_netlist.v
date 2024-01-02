// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon Nov  6 13:51:52 2023
// Host        : sml running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ layer1_line_buffer_128x256_sim_netlist.v
// Design      : layer1_line_buffer_128x256
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "layer1_line_buffer_128x256,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [127:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [127:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [127:0]dina;
  wire [127:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [127:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [127:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     12.74295 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "layer1_line_buffer_128x256.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "128" *) 
  (* C_READ_WIDTH_B = "128" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "128" *) 
  (* C_WRITE_WIDTH_B = "128" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[127:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[127:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oESHD2Q5NORrmTVTCApB+YFZJwjA1ezq7U6VZh96by+ofPCvSFp06AIoCLvB4BhPvxfob6kIkBpR
xVCOLM7HsDk7nO1JVWiYIJ6okoWTA8hAlPj3sdGuMwRlZNSBKn/c6F+CW5Jl37TEGotkhycSB3Bg
B/uu1THUZwIG87RPahE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RovEhaqHrFqzjckk+DIWG8LQeqg2Y/nACQDyXKKtSav7YHlgpKmgHZnsxwwNpqrqVRGyjTecSQ+e
6Mr/Pi9au3AgJVPL6VOgwNVE0yj2LpA4LPyWzxLN3+DiSDmsaCBNCBlVQi2MRKUabou8nLaXldbL
+7pv4pYhQdcyjDzuC2dx3HmzADqstdEiyXeU3ktJ29CDLDmGwDWdmsrl90s4YQSfBV2nj4/Vut3L
p/8dzphf1htPaNMujMxxgp3z4JzUEDJJokDL+gNutEEHiaWpI3URIA5v22vJu+NPD+eEraSioHfL
DPKAajZTwK5FHnonu4O2D0co8GWqWW5cUqZz9A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jBQ6Th9yy7jtKQD1h235YLT6qO6XiBaBKGJrV1Z8H9M9ePJ9R/fA8E1okt4LyBvoWjR7tmCbIg7A
0/vuKOogkLtDE/BtTlp4z1iurO8rQrAcdZy/e+7GATawyJxFY7kZhnXASu9zB8TiOBELSlapkpxe
WuAzXLde9FBMBkq4RSc=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eucSNV2Zbm4zYc2tIGRlGmlVM8+WHY1NHe9drZdgDhGPOHz8PTqHapfnZ1kWuTLtPBLSMvcXNScn
UTvpULofBV6qD7WHLPg7UJcjpZVDL69lk88chgqrlc/RqaJXKNVv+Ubku53ZLU20uZK71bNymjSM
855RVWw5lvTHTCNC2MYIS94Fmrzuq8i0+tFh5qBKkHK2BC+fD7xVyyfuh4mZR2yr/hRs/emoI79E
IKoJnLiglVp6RXTsXFzZW4pIthbjWSuZlOQvoYkS2RMj8a0r9lyariphRQunoudc0bLO4Phk578c
40gusaaS/MI7idMT7k1Di96kvu5mHi23loRcZQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
E/syLaRG2Ss/xTTkuAkOKXzm53+rCptYO2DkVukWhvlLmEB2daHCPrXt4gKeuG+0hIGWedSwCiLJ
7KNtEAiTumJ/j+3p7s3oXN9ftCSRolXoACsCclEAmwYjVM0ubCXUx6JNFOGt0yDl2Jsd5+W10mSJ
bYEKvRKi7koXM/eYJqbhTrtsrHDwRJEY0JVUPh8EOkLLqaIKbnjb6ENEY6qZOamp5PaWsSS30gJM
N6fB8D1AmGKnFbfY+d5TexS55Z92aYcAHNX2XwHsKnm45az1vHeZ0rTEU/oONIaSZfikRni1iDBg
x2GOue6sLiwxTEHaVkTJsOVR4mx0VsfFxavwRg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dSHHpkQiOEzzKs4D71WVyDXLpkKuR9h9h3pBLtnCq2bXiwE/eQHmk5HeQb+qREg0Yv193OukqaQz
RZyuF5GQcqOpqFHMxO62HQ2pdjdpMT5CC7gHvmgiw9qBkJJrXpihIHER4X7OF2iNUfeqxJ8eiSz3
C0V20NlIwKG7Mxg8MVj++xmb32KMUqL7ptikkym20vVdhecVMNvpPoXp8uvaGT7991enWP9HGKUC
9kLY2DEYwRGE71UJJLGWo4n49R50ExFRj91xWnYfvp7uJsMNwnBp5l3GTZiMELX2RkRVSPOHr7l1
n2p5Vq7Uee2drny1IxZ/4c0hYY6y3QWSEqpESw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HUtfqZ9dh5oZTOAt9a0ebo+wQbzg3izFQ0kVqZN81S4cBjQEF53WUiVlTKBDVjvLNUby4Se9WZjj
j86TQzuGJxLPDTohmbytErsg5JrlXHbHGwR4zGNGTbBs12X7PkxtS8wVCp+7b1rX6pOGOPqm6FoG
g6rZY/bTzVfGYF2CAOhjJUqUOXEAKnZRehspRyiBI28/ZZPSAUD/abKprW8PWCxMx2zPWztZz4No
R96jgvHezNzB1Ta8W7uRBFTMp+XVSToxTp2jzSXJZ0V5xJl+gdVjAMmf6+te2vqrK2wDWdMxk3Sf
iyLI4d0s25vCybcY2fZWacq5iO9pSlSaOQWgCA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
vYYu2Kvhv3RZi0pFbjRTQ/BBwfilCrGpkMls+Dz6HBGTZvSaC/anWgymoDS0XnoSENGG3Pz3EBF0
19OqLbyna95IHFe2bA7f8RgU9SEUffZ8eXGigfOjAWpZCN07Q77RkhGUKal7okWe3Q6xHtZy83l2
kW8ma3kOYL7GzQjtpbP3lINHLMqpGEo0dzbOHiJ5r6W5U6DsILGsoLQOXcw+MwrevvNRB0KkSklj
QnL8K2AK8PIsJGM6F8dj5KwRYhSBYNb1opuVpiJWlbHgADoeM+dhiRxBLmnaDE8PWs1ReY6uMzzH
SvvO6UEyxQtvS/Smm/uogr1eUFedUaBHPMEXnYlTAv/SKrh942GeknsqfrjGkZxWTN2NEnvpRUwT
fS0pyd/Err0s94b0srmcTYyxZfJGRUct2T8MCphZFaScAlhn655pxW9RaHMfcvDJUHpW8Qa+KhRt
9CWYScPIH6YNDByLQbhKL5BTpAYMNYPF2W7vM2ZzDob2NB7m6GGeKRr3

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QSNmIeTT4pBji+CTjknWXN6sH9Wff8+t8KF+AC3fIoIw08jtLtShcB9ZGeEKG02RGCO4lNIUf5YB
2TVYk6EJ5XyCav12qDhc60n56UVrnpfo7drorY0NmOypuxECgO43h6SDWp9W7px3r4CJnQ4+X2Mj
943GdP30WfL5kbWHZJC1Dz9cBIqRa1EbNXvvAqBvRPS2+aXBXAPOC4rNVZGeIUspn/33IW3yJLSp
Jm5GIct87ZuSoz8+DXhUvsTj4hq8lgirVhfz1qhHm8SfODcE91FGUPw3vbpGWXsBX73t2zxFC1Hz
/6m4YqQJVxd+H5iGE4kbHxHyHnH7FIerqc8Phw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UhfxKxECbuHK/o9ZExa2zP/MIPmFXuDNZwgpiawuBmPeRI1nJsYB7vzbBGMPKny4yIHLT8mHrQRc
fs05atkjIAbLea4+WNoCdCeg7/0PzuodM1ol3it6BHQ6Yzq4mnZbzlk8Xtwmk8ACAbzOr2SYxYWX
ueuUlimUSRusIe4+NiPvzbfHMAOVPjdmSY7zaSyeJuhdAR+fUGeHy5B23Xe2X6cDPeJ75IqcBeul
ox3dTXi3L8r/s1bTKX3FhxRyPZuh/xCWuEajsF2fEYdwWHKtLX6IQniLBJ5ZnVSS8D7IYPsvV4t0
9rWJqto5O1n3rAM44OvKvc9pOYXJupuv7g3gWg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fmo66vhS7nigYtLDMjdj7hgUnDG/fnO+cIaY/3qHrcwT7u/paj5enLuWHovegu9O9WRq3pPNnjuN
6vZRpuCgz5p4VAV7dVg9fuzg99BAjThp1Q/+HIPfdQ2LM14ZpTh4FXxthHGkTyS5PJArvZ3/UMpW
zwfdYd5+k2/emJ4/nuqoJHQG8k+O5EjSprLTvNZ/wrE1cT/fW/Lu2pxI4msHqVVYAXz7sJ13cQ+C
7tKxCV8vTyf0rpStdE+kZXg+jrc7vFKuPJO0U9axMsC0nXyeYx2jzfAHptGWKvfQaPg/Eo9mgLyN
qSJfFS6aIycuxNmg7L82WK401aWhnUn7GNrudg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52656)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
