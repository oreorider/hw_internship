// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon Nov  6 13:51:52 2023
// Host        : sml running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top layer1_line_buffer_128x256 -prefix
//               layer1_line_buffer_128x256_ layer1_line_buffer_128x256_sim_netlist.v
// Design      : layer1_line_buffer_128x256
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "layer1_line_buffer_128x256,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module layer1_line_buffer_128x256
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
  layer1_line_buffer_128x256_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 52432)
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
