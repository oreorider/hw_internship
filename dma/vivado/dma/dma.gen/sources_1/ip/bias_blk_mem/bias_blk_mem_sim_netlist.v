// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Wed Nov 29 12:04:06 2023
// Host        : sml running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/Young Jae/OneDrive -
//               SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/bias_blk_mem/bias_blk_mem_sim_netlist.v}
// Design      : bias_blk_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bias_blk_mem,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module bias_blk_mem
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [15:0]douta;
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
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.7096 mW" *) 
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
  (* C_INIT_FILE = "bias_blk_mem.mem" *) 
  (* C_INIT_FILE_NAME = "bias_blk_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
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
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  bias_blk_mem_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19856)
`pragma protect data_block
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
EWbIYnaByUrGpN3EbR7XKD9yCjY=
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
