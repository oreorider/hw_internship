// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Wed Nov 29 12:04:06 2023
// Host        : sml running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/Young Jae/OneDrive -
//               SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/scale_blk_mem/scale_blk_mem_sim_netlist.v}
// Design      : scale_blk_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "scale_blk_mem,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module scale_blk_mem
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
  (* C_INIT_FILE = "scale_blk_mem.mem" *) 
  (* C_INIT_FILE_NAME = "scale_blk_mem.mif" *) 
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
  scale_blk_mem_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19872)
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
