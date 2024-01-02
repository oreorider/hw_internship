// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Wed Nov 29 12:04:05 2023
// Host        : sml running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/Young Jae/OneDrive -
//               SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/weight_2_blk_mem/weight_2_blk_mem_sim_netlist.v}
// Design      : weight_2_blk_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "weight_2_blk_mem,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module weight_2_blk_mem
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;
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
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.375199 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
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
  (* C_INIT_FILE = "weight_2_blk_mem.mem" *) 
  (* C_INIT_FILE_NAME = "weight_2_blk_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  weight_2_blk_mem_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19232)
`pragma protect data_block
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
6XRu+2p7qYAR2t0Dgvf1spYR7Gxjcao=
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
