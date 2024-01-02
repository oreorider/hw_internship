// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon Aug 28 13:35:03 2023
// Host        : sml running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bias_blk_mem_sim_netlist.v
// Design      : bias_blk_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bias_blk_mem,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19888)
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
