// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Wed Nov 29 12:04:05 2023
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
NjKZ4LfyWoWcqfBozzpWQa0DrM8dE0YJDMjNz16ew6E7WpUcebm3WcgiWgQqUsygIUvSNiYPYq2W
oRKrLGV9aag5Frrrx6DtouLirghBgREJTyljAnFjwm7g1/RC7T5D5yg3/UnkcHLBkN0PM6MXvm7c
dGqF8UNYrSCBYoNr8s9FFnSFY0boxpvovtlbjD6j3wT+FKypw6kV6dXZMcknBeSd79ie7rsUZrGh
e9L8qV/F/+NuxVj6JyG4MvWV63mU7udcNDhZO4wYyXL1kigVTprwSAnEl7sPp6VNSidiqatxXxBV
+kwOoHqFohdA1/JeqreSh52bG5R+ctvR0jgp/bux149SEvZvXzae7k6eRXgYm52ejYis0Sgf8kbW
PDQ2kS/Q/P/fJv+wLqHPausikvDthvRiPQXNzzDsjyvw3QlKbKsOPh7BoDxxYhmAYb2jUHMWbs0t
7GhS/ddbbz5eknWYNlC4Xt8ZpgoEEC7Ph81W3gnkXyjCFFmDzaJuyMSPvtOamErR9l8Q+LC8wycG
nH4CU/p3U8OOM36byP2K4hfS6YySyP8tLWbaDUHwP9QZJT/Ms04qNg+rYBurfc0NcsHKf7OTKa6a
qibIE3clVDH04l6b+L3FOKiigzscIWCtzsFY7khwT1T7E0Pr7A/XJK/NJhRWG7JYVT519rmi6kZs
fd7+7DkpqiWDknQCCKCUjwDxnwNIRv+TSVPxMkGgbf+IxWvnfWgVsfnFM/EMrKExx71X46IiTt+Q
G+KopPmlt48vi3UjR4PAAPGP8BPmc/x7VnBH8DCT3XMk3RwAOjIJkLhl25YHdjLbARXZzwZ1i4kt
OP5wi6wlrkxOp2ZvAFkLZqxqzFuiIYhFtlNmISAQfIWRlgIgXqeneymZbLWMwXokl+uJ+zvVxBZU
pOAJkQ2HzPrh291f+UCaqugk68UZx/7ANeQdBW4fUcvKO7R+QwciJkSCJG79n8T5z/gF0ysPwtND
9nLKT2nZF5BRNL5sTcAjZR9YNe/yjoxCU+dr99xTL/oZTqY/4n7h9lg43Ew57AJDl+nLCnbKlOQI
ucequpJgv/pQBYXsLfVi9dWm2/ngP6183I4iSfG0o59XUzMGNFEX1CeOoWWw+iognM5AAnlcQKZd
rl6P244i3CYXlk+eQpRuM+NgS+Yx/4GkmgCYiB/SJFFeDO1smYeYtnOBAFGylxKNi7Ih4dyWDFyx
r/BHtxg/0iSCkom1YP4gRmD1wDkcZHpEPIm7csI6C5Zf+KJQu/cGKljq8+Khko3QUjH1853ZoLay
h6pyAIljjCcCiiHn/lbEWX/jy93+Esx1LPHjZHcHa/jxzA18fjyy36i21kAuX+yEv+J2Nkd4qGh7
aOKviAfMU2TaPuwywRhscAnDskU+OezvevkbqwwiAQYSlwZlqcFfQAE+qV+rA5apsavGuTfeBAFs
C8yIMwHIINJQl3cXz8Eop2wTdCQ1OxV/1APfqNEvPsNh7W3CCQBNi2sv21x2oYnfjAE2nyH3AX3M
VPttFLDxCmsOpmK9NqZgv+g7Be3g9Dk9XsDEwNmYdwS+zhK09GXWjFsumx9+SrC5Rr+6Rgd/azES
WgDateKfl4sPDyD1znkMKm8X++rzZwsC+cqKuXjnow+ZRP3CBjE6Ii3V86QP6hKE19hUlFvV/P86
QVQTKgYzZdXG1npP99YeZWMXAnDDsDteb6UkVdsSvf14nIyhj4rR5muIsZtl98S/7paqi9VKRPp4
ULeWTYrMvIQJvjobo7iXEcEm648nrdW61qmf4XgK+SIAEuwaIFspK0Fu74mHcZBp9zxwrjQ8WA+y
8D9TTZQQvNSE+YnuHVMA18lIbDEMDmK1U9y1nOcpg+QPhRX+z9hHpoAqC8W2IkxDdNfAqApen8dU
bqS55be0GtVYHGVspcqZC/2+Uc9Kw4hhVFJNX68l/kYkstODT2XwpGQPgziRyCirgq7NLl6618uz
5n8N3UpXkdIk3/XWXAURFLQIteNeqdoTU8YXswCtDphiqvCtxT4yM65TAL3s7LxSDh6wYEk1ERXZ
gEza72fDJhMCT/40yF+aLkZEg8RT8q88osVGI0c3o3vzpD5+juxNHRlJe8GpW3fF3l7Z5AE2+piy
s+yFsG6YpuLKqt58mcNBERsgpd9bnESYD5mYfL9ecVO9qsNTCOLi7kPi2R/g7zgSQVqT7U8jt19V
CsjlJvkmuyIpl2e2LjuPgg7ZTgKu7s9sP2hgxddsssabe41SphliovBjrnl3by3+PyzLAMvK4dtj
6ob0WRH3lWYpRnwPaAwTs/nNsmxUPM0wkdGF/727XeX7Os2sEhBasOYgB8luhWtRZxEi6cgTIoYT
iKyfDyGA/F6IHtxjcl2EzKunj9QYNMG4Per/IxZIqeyl548x+gcolD2WEYR5nt01AZUKghU3XKNU
XOyTmTxPWiiYAziZz4jufKznLbsC+DsxH/qSzzEaO5b5oqPLXFmi5X0Cno6Wn6z+pc+EyYoufm4R
yQTTZgdSyGi0StubhKt/XBTKE40QLAHlhL3y6zp00s3ZdZc0tCVHC7brnUBB1cEO5iUElwlHdBES
yrcTtZWz1cLaa4T363KiLeRpdeaCRoWKch9Y+sertRArRHw10BteBhWudl3UaBYyQNjLgQEtYzzA
QUw86d80sEc3jVZIZ3MzmqWdDpb8C+Z03A1MomrTsThOG8/N8FgPlNWNni9yJVoiaY5V/heQziuQ
mO029JieM12vLgkNytJJBXPBF1cLqXvaaH8h3WbaQMFtRos7M2jf6BT1JFpKlR+ftWhxFCfpxM5l
Mzpgp8K+QtrwYjALSqkDDd0AnyfvzU5mlV6JMRobpT2DBxyflDuHGEqvH8iipRQ/EEld6h3HvSSM
TbUbG2xEJh4ru6bx22ikCJH0R9wKSEmVxBQskUY7gito3SdZpoKcPIWnYnbOiFsg3MTXPAFrdqpS
ii3+EKvDxux3Q+vk1wuAXBn9RBsk664jm41m+gZTOjz8scy6IoBRGW97dk2DqD8vXUv8awZ4wzGw
lViE++D0keanRhGzOcz7X6f0NFokAJKq2xuxfy1JA3zxatozW9HGTw6EY0vP2CRf3CHZCMTitcwR
jFOJ9Xnezr0v4KrhaUBHszwUvam7gwNfdbu/62exgq6oTvsUOPQNQBT8Gj0O5Ymjx7E3wHUodfE3
fec++JGxNamGLtfbbz06+TrSa85Rm3UVOybISXdFP0G3+cM1Y2NHWIeGfn0n4lxBfHfm1mah4cA0
RdBXRlk+ltXMXAKx3bJ2zFzKLcWxkW6wds23DS1gYR7CSfO6LMb8Srd5vjwLBbMlbe5VnPB9hYej
BLfLKdMOlBtilLtFgqJRe+Jci0wVpqxJ8SbYGJphi6V4TG1iMfY1Swv+p2HWx11+BCpSQHUXqJPr
nVgWIQyT+XOGkxuFItJgzv6R7OdAAV47X3x/8I21HSgJMR7XbLCSxqKv/s8r6gkGXpNjxb6bYmil
q32GlT7EDRmzUuXqJH3uzkpcIRgiBJXjj//2aTq7qiz7do/UtXsuqpq4HxTs21CV1jhdtYfbD8Rl
vLYm3TfNHZk4AB42qHT0ADlxprTi6pvoatwGNKNfiPa1hTQAkXGfxzbdtY8iYWKMqjc9LZuMRhyy
xRPn2MTRSlP0OTD9ZWpfXBH8em1rLxKHQQfNT5bFdxd9spEFX7UQlzOtrE3GmdB8/rTi+7T49glP
Voof96CYab3EB7VDRCJDygRiJqhDLFmLsmCv2nCUatkp6TEj5qWyVEZQxuWFTVZ+JlkMEU1+GxY6
r0gNbPIKoR5RRZpp+Cw76/MMYDLdgjYfiEZFxpVOyEkGFIHe/0DE9fbLOR2EMpoUN0qRxPslc88M
bpB06Beiq6OdF1aorJmkzYH8PNgCSLXdHgyXvGW5X7dwiYvWLDznwzUdwEyhufTM6fWQHR/H5BHc
f9v8ljbVuSgSjp9jv5F4nFrH67GlogpOHUb+NFuIaFzPMdxAdVPYOjl4cM5uRTjn7p0TEnPyfu2q
84VUquu5xHOhfwRjewmZ83yTMiRUYPyYOms0S/rpEJL1iXoNdSWBqZIdBVAs1oxgTKEDQAucdd9p
/xiZa2RKmV+01qwgp4V5Fvc+/svB87ZIF/hk6T61Lu7GwINtBGq7BNtgHNNe5f6SCUeWXR3Jzd3L
bRHs6+4pIuMf0bYV5HfeOve49dTVNHPxt+HR/+wNJwefU4RR7mB4fMa3Bq1OvZnhW+OPQVl6BTwJ
4CBDnlsUwAtTCkucnLMGlqk3VWeB9wJ/09XqErjQoH3G0bEP/a0cAHc9qLWT3s85hMVXlZMhcYCe
vjKsTBjTNw/WIV7XakMKGcuXdBRnuFyFsy4At7quYslHN1WazOArSHEuye8Do3/knZrOy2a9Q+s8
YX35ePBP5CUPXUXSImx4PTjnmxc9RkWbwi7LuebqDxvEoQnCd5jxfFO5po40qTNXGZ8E1zulffFZ
ggxecy7JzMvQpiKn1645xaJC8hEhTFwIqD+KFwPMFVd7AnxEhi9TUuSDxBDj5/NjMBO1sONb7LYv
sznaNJYTyCL8+tBjA3ubhqKPRLMLxy6aarMztBtcwvXLajEboBCljBBw0L/VnSqsioeEto/eqNCC
aBaEQza+dskhusW2UXP0dnq8gFI/00tHRXA9b/wtvc3Xargpp9PbJ9pwzQSaCLAlSDFINz9PJTX9
R9aBbDJOTGqK39VxhSpXT2gKBpepMWHtrRZlm9dToA9xpPkJ97SO7mE6sBv08lZDF7Qe+Lnr3vnF
mQmF3EdXlp6ULPZDARluILanp7pUMCcd7WFfY32GjDRlvtLp3akLHZMM8LwMcha7JrAj6WxB84t1
3pQWaMU6A1J+87Qawt6f98p77OXRpqYaOVotyIRAuJcty7SFtAkrOLjkZ82PbafKBL0OFmixM/rH
OBE3B6tO3wtntUQ2YdGPF5CHiR+pj8BDEMUuMepPXm+OiC1+dqHDtxK2IRIu2/sCaFYft9X4vtY0
UmnA7LFmMl5CLM66T+X87VEY+Z2hfoJScEgfaKcObqsJOBuaQczimDFfviEnVrcvGYS6hExyGk9z
mTtMlldY9rrXlvZeEr6o2bAPVlkYxyKjjnzkrpVnsgbk3scvUWjpjCO+uqAPlj5ZJiJ1vSzF0Jc3
f/ByvpdDLNoKpKAxObXWmTFErHL3ckVr+ZPBfipufAUK6sgY4Wo/ounMaJ0gmAK6wbdFJWzcwc5C
XbORSBDo4P/hJ14+kzpnnr7XbofkPeQGCWLVf8LrERvFFZQ1AkK9duduern7gpS+27jlL3f/ZEXA
j7WZj+hGVyhcLFqAGZ6DnfXC/id7z8Yi6UTIZPKQabjZvh8hyfXHQ5tKFFXU1Un1aLPKsLsWR1ky
TyT5Nlw3XhqQfSSFSCJLoOyZJicTYzMFjdJjgpxjiMYChgwwIvn4sqvnIuJ/f4cKT7aXhYXOd1lP
Tew1mHHz/Nb6VCJkLFb4eF0ig4B/rjrKfTZ2cq/C+EIL4SV/UoSS42+2PKE1MizY+Wzzrh+kiNnz
b+rgmQzi0U5rIrLUy3tIM7c3AQ2caoGbs89qshy1ecCHq03/6BpwJjPW8cffN1T9JDKwC88xfZMB
peUweEv74yc6iTurvRG2leOgg3isbYylRPNf837g+ElgIY5t5HYkW04E/HLELUm4sCtYS6ZDh7uf
yE7jAWnKJ4DSPzU9UD6kQJnAv+8/+wc0WjTEGxWExnKuq9C9xPt66Atec0DuOoO3ExPXMXcpxgzU
Hi7/8xzNTCpJm5bZ929cMWQmbWe6pjB+WEbwrtXkEByUJ+J4UwOh28/NIjRfccyHXwU2ANqvz8ga
JCq1/PkddnlWsKFFxj6o6+GEds0eHPKL55ffnVarBkfGmOgFNfe8t097Xmp3e4kvJl+aX93Uvt5t
dYIUDAg6V8ZfRaF1bts0dgv0MQNiwant83eXI0gPwxZcMJX4D1y5GTaiv6m62Ri2072etTNVTS5Z
qR63bguT3ZUz8k8SjxbSOuJTTLhLW1wJEDzbXlsfF7o9LJ3QmoS19EiVCDtLiZS/F5FciSXBwWw8
TgCJECI4mQ0aXd6lLcAsXsuywgQSgABzE2fxD6o4H3MM/Ppese7UD+2Hu0jYKgQAnslYm2adP5HO
CP9hJnNbUlFaEnoq48UCYzLh/6V1lOe2EjB1QGmIUSjw65PaSp5NXOlCSmdUjjfB9KwzKtTS7rdG
vKhXlfyfM4w+iKHW37/MddQ7UIzD96Z4MCY8b3i/C/53VvSybkgLR3NsEKhhkawbnOt+eqfZgtQG
MgLu60WJmyDZfvBJ/mrAmNgydvZWmqhkGtpIdtgQY22wtWnhf82aK7OiXEIUnAMK1g1vw894LmyC
f2AeZoaSyshz63BfD6pkNdQCzprjeDetamKQt302dF7H2ZeXKId1DJMzola9C90yewJwCGiFSa+Z
pgVK4OJng6qPAa7Tc/UPqhTnn9YKMkdKaZd9njnCHW8Nd5pmlf+nari8pFFuUV9w9N2MV3b9439W
giIUYTOTshrn+jLKqtEeeF4ZVHEjuXqaiM6W5d7vnsiBg5/Hdjqp8mNqUPxI2fCHw8ocooukFXbt
yOGWb4uIavMRTpQz2SBcivPUU/I+W4WuwbgdpyhRpKBwFFOhz4W6keR8hKpgRWC4fGwG3HhgvRG0
HHTiskZYwl3GICYwOHMVD89V/pelU2phIgGYRNll+ex72YIV9DQUs/OWGXUA6K5fz92Q6XHrud97
8l5BmcoPLTEfZNWlIL0rcTa6lmiuaeW+HoMrlGStbwsi6i/j8I28rfIQFx8jqGf60yl5ImfPb+Zs
WujXBI4TFIcn/bM+l60xsda/UYnryZy6KLnWQcrSZmJZSDFXZwm+Sl5baSYIa4U769mcP/BrsClE
nzj/byh8Wh7NCusyTlNxyKj3QPUUhf49J5iSRI2vTuEG9c98U459hav56ft2gb0ZMfZUtNHCtmn2
rVienT6jf2nBmLLBsHKql+7jZOSuMbx9uq8w/ZRt7ft/LeDWcMtUXbTuTZo50jAnZNbB/zUeNiPr
uZzsID5e9UP/4akItar6ID7FdqwEyPeHFdgqIODbf83FzRmZLIwcIuHAaDik71MB0aOy+W3KTWFp
cWOi7s26ZmcaHoQD+d9Ep+5vlPbRdmLn2Xx9w+Ct1tyT3RASowy5OXOKvOWNV6SBNLEvcHCa4s/t
VkB1X83XEjsbh/yx8pldHEtJKB3ianqkNeLZPelPRxAqlsr4/iXH1QxSj8JtcFLSdkvjSdsK03vb
ecPrgihgTQI8auLwInQw/8cmmQSf8i2vn6lufxTZQfV0EhRelf/W6U/sYTs+FWxKKIfCpDj+QDVN
i+z3j9BJogNNhba46S2C6v+YReUlBQOo8iQX9bTMkzlkc+K2o1fbhgD3r/pDo1e5Heb46y4eMBKP
/L2+QhuH9YFgKQWt1NtiMOtOCxYWYw8MRm1ub/0ToO0rT+sKf/2hobHyOEO6FFpMwp5503HScn4A
IbsUNGlERcOUzCDah88yB5BuPZoas5sHaP4+R6xNXn9oTncJiM9xWA+a2g1Zy0zbLGzK/pu9+rea
3RM8hqxHS+q1BgO2LkYioXtdyKB3zLm3Y/n259D0BnS06p0NaTSTlTtPrNwNA8sc+yxjSyQAJ1tj
dfLYfaHhDDLqzxUcslVs9wh00DlVEJwu9GA85M60hlaU++bL5HUIcLv50x8oT85bKeKYjvVdVQL9
1F3K6XldLiGSTglG9Fr17hfS/uqhnPQycGeCFnaBwT/NaJ94jF5Adm/i+cAWvuQ4kMKh/wjt9L/k
974USkmLUKYBDkbumzaIcTv4go1Ztj6TYopaIl0tYHXb+MGYDnsHmXaWHyVhnXSAAJEmPpT2/P8q
+DNMUCr9Un3LMlvz5k7Dv+kf60D7LTRqAMwABXIeR2zMvcFLlvzv0OdOAaEuc8QDFXlZ2zdzpKyw
OsowyNCkY1xGIAmOSTVdH4kPISjSqV7aMdTWqfCpQLByrRD4qZxQXHouoRL0fb/nzkaagKHDU1Yd
Qm1XiTv+8AUqxTlBD+9E56YbZsDmVITJYe7zWbckrO6hZuz0M1YrQta9fGUtB/fQBX4zid5De8dH
UbzlQ6XFfVre+9a1R3gkvZ7+Z7gWcJVg1jsBwq0qnxznMH7oFXxvZue6q933KkF4bTdalHEN24cr
hBnSFO3XRMxhasAulz8ODTqF64eXpcU/W1kUkgoDbuyiIXb3uGum4w5udGWmw+0JEFOjb0+s/HA1
TcZNVBlKwpoe64qevENj636skWx1lriiNiYI4h3gvS+vPVQPWG2KB+r55nmfpuDnPQWOp3+n964U
oTqio4bZNx7KmKToYy77TnvIW7sDy6mTK0UGJ7ZnWeN9kWGXfbckyIrhX98HTX8dpV/ihn7vm2O0
C8uUCzWAYaBLgHahvfflWpxeIqQFFlkzT7EMX3FLYCeX3GmyF0WxJksrFQd+0RLtRaJPKnMWunzr
lRHGuctQt0z45qAseJgfXRJ7aHlWsVfdZ0ucVQgK5kQwL9WFn6Kf5A1FZjl0+gjEnT//E0NjKK1n
sqlCpYQmp4N9iIBqCErP5AlRO4mvB3ErmEfuA5aXNXqvBbwNDQU2CW2FsHQuLhTFDEEPylz7emlg
SgPVIXzsQOPTm9iEvcvDTltWMjXE4ypEJ4aX4C0A+TSDRHIIhYpoUwDIlHW20ngEM3GdkyyERlu2
A7yJlBpOsX+ns2mbTPBCIAVKb8gDE4bclv56pgkvEPOca6vpXUCN7tRt1JBm98Qht27w9wJ9Ac23
xtKyURmVgr4E7PZ6V/Kusus5HyLAxTB9F2QeLmsvfAsimH/3likEZwL3dCGnPQR05zRPqnqDI3+S
e6nY7TkMsCTG0pgyKpqhR/v1p/pn3GVrsEBdWAJbFs9WmHnE8y5nyidAtEDYiiBTJ69APIa4ZHIo
yC4K4fjp4UiThUZFyltXpoOqjz4yXVlGPDmMpv+8oiBqHc/lFbPQnnLNaZfyPPTPzsWjnDjxhpSf
55nvBFntxFy7lNIdR8LwXGvSBSfgp3IpMA9gJF1z8441gSRAu+JR+pwsbuBGZr6kJLQnVGDrCuP5
KVUP/BZKUsnOtyFdd++8rAby+MqKPpciV5GgIZxE1csTj7JZBTqARwIjAatgqx7QGyRZGSk8zRav
RxgX2SwRa5+YpfxsCA1nP3O++m0yxSfIEBrjmyOWUXW0Iza7ZTxlVUHbSxpJgiyVOKsm+vfxE8cP
rM6/UJ6DQNgoOj+46JkMEMMg8AynacCeHHvmA9wVQ6u744YJRY4PEAFFjoaJcbbdRW8A2A5cPSid
NFOxHyOWU/HbAHQqQdVyeO0NURDkXnjV0f3jjg4uBlEJh9cS1796irusDRs3Ev3mNZNFqhjZ6nR0
CqLYhanoVWzCG4K9Q3Q/ZtRJl/RHFMUTGow25Y61Qqs5e5v5+iFy5zdBGVlwNWg0V71QgwZ4WiXu
qy5z6/fvJ3d0RJYFcvWdZ+1hCa4VEQ1E2LqUssbSusW/qdaDqOgZoJFWgmtbKmO9G8vrnHSRdI1u
qJkTSEf88Y14umrpyEa/Js2SIm0XD3bNDWhMJ88CjfCx0+upMCAWSxw1IVsH5EKVnulkzvogavrq
BilFRTX2b9rDU7GoXx4IvRWraCOrQD9jVoBG1cZ9Ooh+FFRfY+YHp8pnhX+iKIuK3xYgTl8x8v+y
nE10GdLvp4mqzAu0rrh0oLN+RNzseFCKzpl671kvcNh8LOyVjYf+YrCRwL+LAsMXV68BknZGFYiT
B46Ijo+d6hfmrAcY0+McLaFqXNFS2s4W9L3peMtukcdUVbkrhr6KVgyw/G2fat6Psyl313uBsV7s
KeiXneE9xJ1whog8lNLyWv01l1GuaaBCCEt/2I8TCOeMIZDksPHaC6cuyjroLPrxQ6C+3Wl54Bbe
fvttVPh1NdUUchzKCVe2T0G03HzJssln8lSTvVuJqx+KMWuYzYwBZf269hdWOt34AcYeDd8wNB3X
kDOXG6dvhJxUCvyuulKc3qY9XM2CE7RvtkogE95FFCkutAIlQoJ8QR6qOGp3a4A2d29PvqBRkHvL
c8cGXJhBFbfMeU9JGOUCOprpy5af8Xhwi85bNiHKI9VdfXr+uB5/fjscbPLToWbzB49DlP6Z0wRN
wpu8Q5HglV4GjsZEuM85KSfmAPM8glrQODYXZYJiTYaWOziD+jdaSHBnwzfOTiqfE4of6ublvh5o
U+y26ATNyGkaljNiPLLGc3i70nzZzFvBq+v5jbeeKwf1ME21za8yVXkQD8nq0rx93aItSa5EEwfk
kW7dYCJD/eEkTgc6ku9beDHuPnyhXNtyjGRJmC6Hke0Ta+d8zeUCTeCSSzAkZtSTzbVNXY3POAMa
uhfNPKGVuo4u7p+VcjtJbUHCl99zcyaAFSNk3Ge8DERX7GnJquFdHvr/MnPSTJmqNEq4t26AvcRu
w8lu3hu+k5tl38CoWrPNaINF2AGO8PgIBPoXhkaOmGRoXbdSepNd4WWSg0Fgq+4rkMmZS6mOCDa3
/BlxAjg87838MJgGHeRBgyCMgQcMdatzPLYRe2Pml9xVVlWbOiEwSs0byUh9jOUOpmZAvg8dat1J
S8d+4EmGtgaep8CTDa33+R1N+WkilQL8HPormLGO0af/RO2KwpxeZ7SGPvxHkvxv6i9zLqC0bs/h
T5Tv4Xs6kvCuWzx+kSUUJ4tt5vO7d43C5RfoI9SyWnklqqz5mqWduTjQ5hRCJjYsl0sP4UWX2y7H
uuI2+rOvQy5859+WzK8TPG9JPpRwDY9XTBdKHzeOLzKxJftV1Yns8FWZ32bS9Gva/6VnWGzufvvQ
waP6iP4RS4ygUMVvSh2q3rjhiGYYT6w8+7j2aogwT7CEwFxvqLcQxN/iNwTsUz7Ov0l6vGuoVd8h
fILC6KXcDTnPRMGdpzfMSdSK9FSCna7BL/xtvD6lTewrK2N1jKn0twJS79MIGRre7V7QMSXN4U9Q
90rCMY3kctAKVgpfzZURg4OFKgz2Y71mB/upkwflogVG4uwgp3h3pDTG1MPuQAjZVAgdDVk3DVHb
U8qufOQ4dshlRTLOI1ZKgF8ybRFv0ZVc7r6wCmL/SGtyUcaSRLn0hjDjGqSnK3ikyRVTw05sjn5J
Xtx0NAclzdxsMJ0EXKykSCrxWw7x4nZiLA2QLbek8sDBVA6ij+cJQ4IHSvku24zBGdp1tX4Ct8dJ
Zks/E4m+lqrtonCkErdKAd5igZECiiD6HffW4mVfdSdz6t2qXd/r9f0c43+VvlvOGKyjnekoyGMU
HiLMvQeCyfAe9T1uTAtH8ag8zmfOxvEZFfouR2oTPGDYMMp0T0QNQ/qZlryLvqnc0aqoJaQNnmHl
BxB9diMmCNZ+i/6NDPnRDqXdSrIVNiDUhN7nog6ljbXcmaKCMWIkFUafDbZjQmgjke2GMgwXKq9H
N/v0WLon/wxq35fc8yItfzi0ghYK1pJ9Li4RiE5RMpvKoX8W34pViOYRSKQKcX13+eTepbYrafHs
Mts226jmXSBRP8hJbaSO7Xqw3/JVGvca4vUgcS0OLi45107x8DgqtQJnPFjyblXe+3rKmhqmf2S4
uRCxib3H7PNWrGQdVSN79aCs62e2nkM44tPgpAxs1dp5PZubox8pYuvHCzz5J+0BaWTVCHAUq63K
vtzAUTU+ipho2LxxfVSj8LjJVe44KPFvCaU1sQd46TchoIRjhlFHk4o2qbdBDK3CJYY0e35Id7pO
ySLB+SLUj0pr3DrYRBO/tNLe3fkzUVnSkb41hPnH8adETc3CLVtRtB4MSplJe/Ox3O8db1JeyZRg
P9v4ByQH9LaMd8vaF44IojhPdLeDgBXlB9iVC5iPpd3tXSJft+ZV4VGQD8HghVwplyaU9e2JIa73
DjjeF09PjjtfsCeU9Cc7L4o1SvfyHZbpOnBAn6gzSVHK2KyYt4Fu9D+9HrvjEnJlKITknKPkMhWP
dYniD07grb6tLFyfrUsjqRvfYU48ABzT/JwAEWUSPFSRkF13m4sCwqzFvuA50nNwStg4KpIecfrJ
eEXKsmbeZHdr+Dy7cgwNbad2dHrbYiXW+bSLOxHlKnfBerrCXhXLUWRYUbDqi7oan1r8X7quvgdS
HYX3nFvpR2phgu7aOL0owtmx6AyRz0TTBXGUf0PPtljxndjFReEr1nRH5FBL+p8U3qSwG45Na9rX
RmV6sh5ufxoRYEtYYImVFAuxKn9EP7ERHFgjjY2OzJvuqcRr7SxiWecncx3oXbyzxzo8BCbPxMLP
98iQWyi8fx9y5g3ah3nIAQINHMA3Uz+oHFuvXYnkOX0V/VYaCgOEeIa88uTgev0Ox0Lu1r22ilki
GdWEFYTm5DMUjxaVhg2LuII07QHe8+5ogOBgecRcVmEo+3h6ULhW8QbzbtRJljIIiSWlSjaWl73Z
9dDrOKVDjBy/UF2NUuIWiPq5JF4y2GevDHToUIaN2UlfFtSG2fWN9D9EPIbRkC7g4QbwrOFtrUuN
vn72J5e3XGqF/sesK6d1+GoN2SCtLuzaQUzUe6boEKx+Ms328IgB28RmFu+VlSvKiSHNZxGX/JXv
Tj6tyBLmgZPjbXEZ6ufQ8cmH/PdnJQbVVr4RaiIJ48YvNbvFOM0dfWDCmYj7a4bk/fL965uEh5Se
qNtRAEZ8vv7ZYGAai9NdAzFN7GZiKzZmD95j2OVdThm46vwEgHRQYlDVfFRjcpMIF3LxrWBjAdes
xKe2IrbpGYdOVtyuTNdhn1aXjmwE0dsO8QTVVTUsAZ7T4rf92haYyVnhKWVNr1upqmN2zawCVE4S
n1ACeh0L9t6scz+vMvjNNCtDuRmzNpylrNexWL14VW33vb9e4dlz82So7uSIoQb7sknAmFC65apu
pXVc5AXv6ch3dNf9SYDHdt1RopdUSDwUCMPCBwuS4JbxWGxxFAeYBEXAQHEtO0hcUg7GaoTvvuFd
JjlIdh4hrlL5vM0Xs/1e9s0EDKQ+Bsu04FH7ekvVkkCt1B71+/mit2D57mQb31VZAo/iJS1zfTip
LA+8oHVKpm5kZCEZt7G+U+xuIIAcTz1Rhr+OPDHbJ/9aKwMjXXUUvN5i9qEsUOZ3A/bgI9kYwKjU
e1YkvqzbPi4p0/qyYopgvnWcWEfzmqXcpWUO/2mDJ3RJj5O9X74qBSy6Q4JX0+91rfWoQCFl8THb
VoTUbQnQEQ8IieKeo+n5h1ZMxV9o0IeAMfadY1nfqkwhS2zBG117b5QZmMf70vVtYj9na4mIoVAA
JPjaRmPT3d0o7EulMsZeUXHpttaX9IbfIZaXElWMAN/dKVNBdf9Q7lgfGq4RHTQA/HKy371f1mps
jVg3dneq11MURODSXpUTwmp+E0fNP4Onf5IbNcVv0gyDjugcW85Aut9ID2MM34MQ2Hhco1zgoIO+
BtJAyST2qGCiMyQxM5rzpaiKd6o5JekswFlYNJuimKRH1hxmxvmZ2E9qhGD3KC2TqHUadt1Kf+vW
CYTgFETFTCnxn+CYEdGwfrxLEMcy5OZHDLR8PbycEhUrfJJ4jmzukW1VsHnsk5qTJRrdKjW5nCkA
G1+WM9Oq5MoG54xMvqC/5sZj1kR4b8dslDMZhA4/cY3HOWFGw0h/v5Pq3IyFaRid/QbFKZPGYrRs
q6hwZepRAdK8jSOYaYyXbzOeXQK5fhGgt1qRTjO2YNtrVEyjU0pcun+RN8Iu1Fax9fLeaI6GTRH1
iL5unl5W2nYqXTwhr0mzx4828HZaDcpY0O5eSPDcyPP6Xc/r/VbxYkuDnG+2+lJWgYCJHEb22yip
DqGaQ03kcj8Ylm4OTktI/XHU/NkM1bVYYX4Zw/Kqg3vb0ByiVPoCO87XRKEe73XC5Zr4bs+pDkEh
h/3oj/qGpR5dTH6gr0X2sIwFkmedkz6gPKAOKx1pqyp2o1lFqM1Wn8XHFazh1b8pC8l25wsHgooP
ty1Si0pwPO/+BHvkwOSuOvrp7nDAKsBvlnhYWi73Z/x9z3vLISv9bzADiYV5Zh81i8aLdIIqO7ba
TAbj+QmqOHduf14BdF8mDBcUNNH2fAs4l93sIWUkzYbfir60GiRJdkRkC4Z+KVM/w2V/y3xpcFcl
86nNCCvL7tXAiRCa+bp+l8Tp8vcruSuB/GymYVT1u95p/fwHJItI96a2kfR3mUGBJW489tP93eZ6
BQnMHrFZKv/0H1XvnIw11EnV5mhnHcFxUfyi4TuydXYRL9prHms8W1emp0TOBKpxv2vPRxSK1nvl
bsG0Vzws/Yjup19nwaNY1oCRhYamtfYukw0cOGDtD6aGjT6wqtCq729aFrW8SDYj7RRKH6EdrWn3
bWTPHl7FYrKY7dKKaRPEysbigE44ror833vch1PFDltOlbHHyd2Oc5iyHf61SakGjcE1lcHF1761
V4Zm2L/JEJNoxnYjji5dKiwavgIZc3osT9XXzRmy//46nQ9HwNbdlvQ1X8n5rWlfHchaaGyhweuX
uUneEFVvjXo2CNeES9KIXMb2gOlnyTfGvNbHmurM4vMsSqCxNs8wY02989tKZ+slCS2IA2/pVbNu
b+6Jbxq4YZmcoFy7pnjHNKm7+CTgd0a+tYN1UFD000kqWkfMHF1FDjxokYUpGd36A/TIOlOOhXuP
dge1cJQkqpy5oqgodTkSw/lV+5ctD6rc0nHfrhgW1JNikeXGvtjo4vUNFbTaL8fIslWTtvkUQH9j
g5ogDEIc4JRN0XVjWJG5N2yPf5+JfEOtjkAbQiZ9d5s/V9UZToKHGJKVxYsiL8fLYm+6OvxTc858
KX12P3vxn2JsCQjESCj8GHKZTvnuqD0UbRHS6rcsWyopVrUGX0/CA5H/jjDaAFKoivXA4LOKjMP4
3IX0WpumfISjOj0GTg+PUtEgfifbIjtYSBPVFNHNVZdB83QgAfbofjRVIKv82trTDNmpo4F+XBLi
rC+IGVCTQbQeOk/AJkZILllfqzGv0Z4IGuzNRgEf+/Z4M/v8tW5N/HY9ZGjXIOIRgEc+OfIvme+K
QHmvWxVxyhm5D07bw4p0ubGilMY9SxpktpLd3ucpIJe5rPArqfTbY6kYCJWK3n3h6na5iMC6Tfpv
WlwI9H2WLPOIVRkz7v2zUAK7oZ0krr5QBDL97FlYUICZ5YCBT+fUVLGBR04ergB4JjR7Vqrf+utE
n6QqED1+GLY6hM5BCJWfWyWaDpzMKVqGJCbJOG4EjxTFYrCusAqzjb7xCSBC0k5mXn2BlSpzfxlF
FQ5w0qkTmgHR3++skNxq9fw3YTc3B1Nr04hxGgP2C0W+ogl+QZ5ZSzpppJLWRaQyVy7kU92z2Gnw
rdtrKkCi+xEQZE/X7+9CiW64iwo72t0g1dFbdHIOT0H5cPnDBfobs08Ix1H6+HLkS4SvD85z7OtV
E3uJL7pyKTPUUa8DA+vHNyIKFb92YR041lMDLX8C5/ItzJZ6FyTHQwpLivCY2uvcX62LgzNb9Tuv
WV1Xx9sjW76YMwKbxJD1PpkxS42QrvDev3nszjLUVxlwYOffFsB1e3tTtXTjXoNLPOad04RJ//6F
jzm4Ce/0CHSoW1KR1NDPmJSN7ngE78ylJEEJUbqgMHYuSFLxjzPRh4WUFPpwUcq584GbsJXUhOGa
YCim9ct9t8JbJdUN8WS3ccpFMv0Trkmcighi8xeMAp5obtStFrxYNZeSNwTgORswemJqGooSdRK3
JvwzqtOOLIu1mErmZKoeE9HC+WCww/BCABvvVDxo09vXCnoi+tHB53aWt6WhKhy7csL03KOxxq7N
6ZAnZzA2E3UtjQ+IYE8zozJZWBKUMa96BjIn5hGlkGecVuF/8KakrnPTNa/GRE0BWgOWaF33U/Uw
sMGaaaYrKCa8ALLyCbt3r7DkIPZ6hxZX1JhRXScfmAOMHRjnbT5lo+kKCnfltnr70dCEhwUCuxwq
qLKt94fQHfEOVTgJESVQ203bw8sO2+yJIN1g2Bqha0v8/+FuzRx1E+/Wwpd8Z3v+METNRFdrpiEb
h0JtXaDtIjtp3iU24y/cVIARZOjwU4mQnZ8T6QQTeImSSnZiO3lADAOGr+Wr1p3nRHTughZzNZzG
uJK3IQFLJPWVlT+19Tzqp1nzBOuKXV43YRMl52YuQ+zM7QOOrKNZG+vTimNUEPH0ieujknAwWXS5
x/RXBZGhEKHY3xb781D9MGqFjOMtXJvb+E2IcKjSboi+3Lh4m6c5n1Khp8w8pMd2HK3u9FVAsLWx
Xdnybwlo/BZwVc+eY/he1LWY2tHpBzC4EGOp/PjeipIGlwYtCjstKo+Q/IwrfwkzXNof8+y8P4nl
TP1LNAe5foJR1xnXzsDNQP2Sp8chN1dThLCS5WlHnTM/xNct1T2b/gsiZzrcd0/vYZCjCEfSNx+T
UVHjZRW9d8zS83k3CUby+Rvv0YSnKZlnfQ8FCgQxTFqokqxl9bTW4PxwX6rDG/K7ZXxbjJXouuBi
0BgOjOIDrGCXeqpu9Zs1qHFJMM1uoVNcJeYvgG+3jiyfj/TvHScroKsS2t5DOpGcdqi6Jg9z49Ls
e2aUzp+2aYpPt8fADQWuDcdkOHt1ASXCdE+T4r3IwOKgL9IwrieVWK11t1b5qYkkRTPSfRzd3yku
KZRzx/gtWHI2iWjHU6BaMdyW58kSLBU/0SFtK5LlVkRiDpB6ch7j7KpW9HPCXNc/hKoBhzuipxUh
WNw27a23gtf7FoZFE6AVRg1RoucPrBd8cSP9nUlIWAfLJT9nEKFfWuCFAH9aMSS7unzVZD9B17Gd
VOxuqVFyobLme9VnXqjw062+xzbQpotk1qi28omgWxDeQKs36Tj3HFz+JB78Cv5usMyBGYrqx2RI
NCADiotdmf859RftcUpei0ZPxyAjuUx5lVjJTmk0c1uh2KA8bRXVjm3H/+RY+v9CuDGojVrYe/BI
oQUiFpzubBtiz3ITae+xLFZjLBhx1KX48Ih+A2wA0hXkMhLEi/5a3DQjNRb5OXQqsiSvZmjLgdJS
YdTNyc7+Dz/a7OuSmojevpjPPGDTLJoEbvi49Awz20T/vaI7+MYMmhKckgYha7ferDYmYQnF3mUI
32iRuvYjTvcBQxkAKdPdpLEr03lRnMUwO+ma8ahtdRreBgJBJ/XROGFvMqaQ4ucFdj++Vx1JDL0W
9/0z41Bba4fpZ8I51gkJZIW2Za7gUGhlyJSzSmr7CzbczqvV0KVA1C91EVxxTHrlpAkOYszWPjOl
v7L0uZ48SYTdp7rMIV+iwmdsH4Q5C35pELagg3uqYXw+fgX7yUOcvdEf/kc8AMFyLWBXl98zyN+V
EKPHpgliHGKWmKbP/lZe1jNEVaKDqZYkWSswpWElE/RjNZChTbbBA5KZw9QNSuah0oVn4C5dE53l
d8NT4goqJ2SKoOhy0YWjyXBbec5KlSNtiWqcGl9Tu22CJFjcAru9n8zG5r3zOw/ZGk6OT7yWQMPH
wfLGPQ/QOIycEsZFe+NLwRKzs1FVSQHvv08NKgoYVGaSZKz9wJfMpC5Ks6Oue+E3MI1dxJ6N5Wft
IAv6hqhIE8d1JHw3u1Z2/byNoy1pfBZYmXiH8dB11llKld7FXy0icax0qJ/3bVSwjTwCcfOidzQT
SyOslUZEK3qn59Y4h07sWHg1X9lnyrAem2bvTVDxCoFbG2PS18zs+dYnaVW1FOgZ5ydiYcWlEeve
l6vTLyqavWSvmrClr9T4R5hWdO8znSyqPdNIoOgEs7GZ2Nv6rQB/3/m+DpWMjmFWdsLkxU9Y91Wq
ZCmkLzAHN4qCQk1HrAdcYlg80A3Klk6ejBgfvlCQpgj+tyUzb+SJgLKBhr7Acc9ckYXgXWthv6wg
oFF2iARWAlaL+PBtUupLXvugktI2hvTBFBWJRJduQiMVx8lQr5CMjt2PpxEYrwHEXg4GofYpcIBr
Eq0FmZzbSz+KWaGJGefBLkc4r+73t+oVhi6FOtmdQHPvmkix799IJPkKtfG5fA+aPJ2PZBOjLNjd
peeME4t2RQONDwYMBqFHe5vfIY+IpogRzNL+egjwzTD/B0kmct+CFOZ33+0BApV8BboppnE9zRdg
qwUc8VCjrk+gFhbHUwEbAypIoJn7K1YBoyL0WBvlI1yn6OuwxSPbpLPaXPTEAnLUrFZuSgnKZZCd
h37AqlP0LOPPr2A4UKdkDeeknWp830vDkKMY9DPuljpuM+8T9qI+mNuzieKrhc7s9XJ8hARxI9Z1
mu7ufa3txvKwYi57w0QV7LOfgji3BTkGIYrPrRCiPbPe2vIGaj45SWw5rJkA7dNTvoAr3FPoN9Dh
i7QRlsxPgQMjxj9dprY/Jh7Cl4LaCkGU8R+7pznMA8izHgBC0CHLWIpTNWlcqzCev0HGfRckhx09
c8+aC7b5HKM4Mv1KsXWlOtplxwwT9l3oAId9E9bnvLTomddIlKHRJRDqR+AMe0KAodNWkO84RbEY
TebBt4kHeCUQXleZ+64GXofBN/Hp1e8gm4OJJ7zjHGNwvOgHQjA9SZa+C+5cE5lMyEYynYLC/3uu
TpkkZiPmZoLjM28WyLuhAmOwTr5Ed5DQwjuc9u1Lux+p8gNt7EFcMCwX1lqvSrt9BApN4jYm11Sq
xiQegJI5qie9a1x3Wq5qd71kecVjyEEyxmQFIYIQ7uiDycCixkdylNEfTWVpL9i4fEWltHtvtx81
AUqNA5rsQzIjeZeX8rlrFrGaqn4eR3ggx4O7hrCgnsIr3cWdk4SNcFICQtCO6A1dZLJhjLPdi8UB
vI0yDvWRLHxe35z1FVJijIColSQ41AYVouqCuVuZdUgkDdI61wg++wLs31taLuBFw7BKmCag0mvu
IjSVfuWd6N5Scf3k6NE6k5xZFWcMoyKuzsAvxSLqk1tBO+gbvl5xrNaGoHDLnyUQ82d3NloTluJ8
FxBHe0xgiG7UeAv7ZxE0PWZwj967IKTRrcMVONiYaq+0mSplHRMY7gCa8GrV6HVPJgc0TpeywYKk
Bd0rea9i3uL2u0JKKK7s3uRPjAA5wcbkdJPI64RywV3pFqwwZcUX+A5R/tHLg8nI73gMSj/4zp2L
Ch+/+c865x7iaL8mzPVMuohBuJuHObm/MSqT0EyqSAzzsFoEUmMqz8vxcwfC2vIxTF3J9mHctWJg
rDOhsGeftd9yeomKDt5JZ6q6N+SI0Nv6lZZaBiN93XW4F3O5ubBVmtr8Xqfmey1Ip56bivwA9JJ/
0pLKG65Qiuti0uEioksjc5bjl6sshHFBoRf9nHItBmZtFzul54KKW6vkkmx6WJUkeJ9q3BtLseAc
YcIya8B16WYwxHAAszEdy59kXj4ten5fZN2z6BOZfADZsi3Xy8COF+k9St08USHINvLjtomSFd3L
WwQWsq1F6xjayXhyHH6qIiNY5ZYnDxw43ziwx3KREqLSXFmMkKOGTsNDokazRr0gZEc384Nw09UP
AAqJoGIVlhmvM5hVaWGR1EdQsH/CV4Z9N2F2zDioa/uoNSxjD4BtBJ2NFCd2aAAP0EqCOAtWdgyX
Vnil24+rF3K7amQb7XzNvXwN8YGFBrH76biGZi89Kw4Yh5S8nHukP50Hvc85zD6xcJa3tg8omdjB
95crJo0DA3qqx5TOL9+ssob705CEC2Hr5Wqc8wyiZgd8Q3Cjy87W3j+wVx5of09qvggIhtEKIR71
NJcTSPJL0ZUdAPUvYQSt67fM8/ZMifD/4kJmi55CrFpJidCOfjYlWBYNb7exQmdEPxW8o5NM9ukX
l0frHi/wHga9fD2np4+IQFsy/igEAGTTQf8m8NAPsK/ZqoA2dR6PAjiu7El69ystlHe3M5FRvjD5
9uW1EjrkP3UhaSIOAtsoH82AZX1DF7osw93uN0UhqXhXPdCK7blCdHS4RYoboedclZ4bUj6RYQFw
lmPS5YQZtiU/fGFhBJRYbZZVGY//d8SxH8og/935xxWvJstpbsCG+gR4cR+QeYLwlwDTEsmRSeIU
YSoxKh9Bm/1O3wDdxMaZYLlgwDax/s2ygOH3u1rY15GIRLuovHfybdtsT8hVZ0FohDycNLdodEvX
RuehThYdNMYLjTzUO8icA1rSbk/B8PuDgWTP0obMWK/03ZyHlCKQ9dhgWupphEupnv0Bf5iDIEr5
OG4vWKqRKK2CX69yUFTlnOI6O++1cNHxTU+U8nc8rENHPe6n2S69FNeSYwtLAmq8F3suaEgL4QUe
e6loD9vPN2/XQCAFGkl1K2cIEByL9Ozj9QGSEFqYVSTNEU8aPsltBxtZsC4KHa4xzlPEVcQhEB/g
FGiSuF3hk34xUhv99j6MU6SK/x7S+mZ05lwdr+0flTgBo+QPi6YkN2UW2NUMWUsLmVmtY+nwdZfi
9T5tOO+zi35lPjEbwycjqyLJdiDXdwu2hTmkg80i/iVZePHgEfIBobUsmS4lOmbORjLZHZGI2+Af
fakF7f1peoyvmHE0gYi1tUzDJ1+PZLeNfQIaOSrjlETSYWo5nkgekVDNS6ulwcELSXdEo/hw1z+D
hgN8cJH3s2m8JNE6iSjpbVZlMQG6ntRLWWnTVgM45XxZNDVw/xVop8/q8dckZlnVWQKkbkshzWGn
qYXWQVGWa+yU4rjc83MaeG7W01Ziq/avu8m2vESBb9PFbznw8nbkidoNzv0LLyA7nOQAKXUVwC3o
i/lQMX/ObE90R0/y9CxYigLrgeLWFDO9p9HXtKO5D7MsULC8txq/i/sSvA3Sq0llFir5KW6tKKxX
FQmbcmmud4wFykKdeqz2GV/MKiOf/GfuwKpH68eeyKGvvflyOaXjJwjb7SqThv91vdBKvi3YDRHT
r6jLxUQPOlez2fAlN2Dir/Q5M/WQjRLdERe3xQ24ddMq8+ZeDNuk4NbbszlG5T2vYs0Sl1XJImX1
lbPqoN538gMRGAelex5n1vR/ngrVskWV6wz30JxBw9N6iCa71ZUbrLNBwWjRosketiJptNu1ndqn
7J9e2lRn/o276pTfm9ed2gdcX/9t6JrmGYiLYzJ5TGye7P7vbAtw8OIJ3PoWrFI8Clx+V/8Ei6cr
t0h1pT7C5uBD72IIx0fHI2nLVk0McZIRpeX+FsOaEkQf4SHfqZheIadd8udo7wzGau+brR0QT9/g
8SfBuaLyMKnGK3zBHZ3fj0HHWHsoTSqEE1NfiFmYQ7NyAb1sO32AAS6xxxSnRQq2//ki6UOQPaxw
lo6a+4Q26ZnSguat9Tjw79+iXWe7uZdqaU0N5pWF88sAo0f5nM9IhrwwX2mVfX7KryP9/oSZUdhs
2vbIdT/6BTFz1HZm0GQuDqZB0rk5KGglWTNzSzQNoLZvejOl2ZcvKZ+Gc2XQdn/hLnFjkcJYYQFJ
c6g30cZDgQorXzq3awQZfDr7UFqqzC7zjnuOuqaRQGR3qT3pfJFsc0WfCbd/L5Ta7s5/hEsd3+pr
ecZWPr0ORtlReevaeHJrEZRE/PC6nL/4pWrRR2K1ZDyH/LAz8hHVMaJ/gxJNPS+BT5ie2HapxfZX
Az/MM2Kntg/tqZ7M9pXU3E6YE2a3YFokFxSZz3KydfpCouMRWiBCMgXvEGxq2i3IDIlVg4k4ohG9
c+1MXIKELUGqF/AIUExcuQc8ydN4V8JqPC52CY1Uf1uuNZLn57lC2GJFG+haXayBOLnXUDaf/yMM
pBTgbUbsuNustSvf6e+6cWef7pNoXufyjpSt8eEBANBmh7/G/d/sZ0qge1Xu7jLmhKXBrIn/hNKe
HgXZFxyGnp+tDFp0/z0jTIpdqkqFXXxzDlBgIQ8xV5vfLCS0wN4YOsux9+K1XgKroY7ge4BejGWe
+lUzuaQ6g+W4xby5dticgUhOcZ1hCQ3Z54fRfIcG9F2735PTEc8tEuFDIwqEDYuYlXlBiQ48/VUB
YC7/tQQSWBr3b4gXvmeK1ZMrp9GX9hy3HQaucMWAynDPwLFmIYLjoH+2I/9ZAVrIGsRCawZB+R4y
LSbIAgcohF4+n/A9bSFrfmPKfPQKIqGathbDcqtCq9BCcT1C3ec91GGEGQ3manH1crklWjn1Lv3i
/Q0LLos6jqVOPQNvLrK1PrQyGC+zzYIJA9RP77mSc63MpVz46zyYmNrCNworwXYgVPsuVAV96tgs
eSHI0B8Nzin9J8wAimQrTC6oTTIdrAVR2ib7pS9jzKWnUdtlKPTFjsfM0UC9erG3+33IKEPCKdc7
gc1HU04aJyImW/HeCYV+paOSmdmofnCQQqY/Oi52M4QPMPS4RWE9Y1hL7mu8M2EkiPr76MqlbzAe
FKG1jFokcR8dBWf/sKzYWcZUD6+jNKRXR0GpFBiq4E026yQCQimslKDDBdywJGmkkMzNje+MEss2
qvvwfr3+HLyuwbfbusA62x/L5Kd0dyEJ1Rh/6lGGU7627lL/oUeG53OZvBPjfHlxoBcC1UPClIR+
v1hKBemiGT5Pk1cdM+gSsUhuF4kveGz6IikNOzpbrpfon2ziafXnbYiNGo4KyJb73T9LIseb7coD
+NE5SZL0BvUfllMqXOrBB/N5aw/+LcxhQDpXhqDTApGGvHZHVCkpVeq39GLsUF537jc5yAknVCxj
2PRObx1h9jHnox1R5ho8ZvUH8Rq0saF5CYxlyojQZspX/tJxqPbJLnfbnONGzZK0XuGeq3hNuS5T
L2pWz2uhzAdlABFaP9DnACY6G0DZDO7cGFqmmIE96dAy7tca5BJbrPYWl1nL9LzOT8KisIA2SsRN
3lwWrPd2OZZ4j/7hmo013XBkTawW8AykyWNyf0px7WRipJZDKykLOj7zmW9qmJqzlDhb/E5/Vk9i
tcNBMWmDGaz9SJumkwgFDonbq7ku4Lt6Kpx0LMYHRGc4kPabvVmO0ywXGO3XbUC20dHYwn2+rBZu
gEQR+XOsX2dTQHyQo6ywVZCEaFhHoYlYp2kvK9ZDhBOCYFXmT4k3ln2XlxUp2xFM1qAsnVaQlNYg
hsQ5xt1MjW5wbhcfHl3eE5mLn5oQgneMXj/NOuD8mg1vjPC60Ra/X4jgt0IM6XyyQ8OPSKK1XrND
qJdYDq6Nqn7u4NnaFbcZ881HyFAD5dDJPioUKnzKrr9Qimhnvx5eWhv5GKog0mtH2fNoPrXnxh6n
EONy96jXgw8fwZoUq1ttBmbzVKS2CQpP7FPy+1uNulg0G1vnByJi6oZ6/dYxkhd4ZPM03DLEK0S2
LuWe2i5S10ZleslyiiEa7eLqHguPKmSum/sldokHr97UzhNAXb1U5nJhAbq7gQNumQ1/cI5NNVkR
b5zYequEgVigAGtme/H/hCsT/6/ZDjeqTJtwOPtZYpUHD8rzD4pL7sh/WyScz8HYOkQ/rHefHFai
YAFPm3fSBl0h74IdWhNGXsdFY/I81kg6/qspL/K4YooSEvx1yT/mt9qgEEMF94uOhWplZ5Sv6u7z
x80V9eSxvN/DU+2js82AaegzZ2lGoZ39e5WpnvkX2pNE1ehPBemQy+GyiklyhQwgR/I1wIeVfpHn
qy9Axe08vXjOVyTQBXyd1mCpYKVMmK5C7FzLFM/sFvYadsOz0KkCvDIOLMoah1PCiaQLk8aLfl5e
bjrcV1NDDM/GLyGQaB9SyTrBH6sej3pEy8g/RIbhuL8yLnhlWHWkdUVtjIcOhhLaEPEUIxRQl1mh
LBB0aAgzsmJUEeccwbRd5lNVDjkBSCuHN4Zv8tJ4F3X/fir4G1q31gCYsf6zi/s7lOZT0wrgWTwc
QLLortb9bMHFJqVnVwWew7CzeaCfHC25enzzMRe7f+VLcz6GRG0vU+xS/qwsU/F4slvl27zLSPOW
VapTzHWnW6+HJWUv8O0zt13V/h78duqoD+RX9yZGg9SHcgLN0eKW8M0c+W7jyu9wXkWalw0exBUD
DIwQNZIWl+Kn5rwIeu8oO5DbGJI9gL1DXXwJ2fcvWml4UD0dX4Yz18cbiasSju6yK19yAGoxML1w
w1xV81VvNVLQoGemPtc3ySylDVxs1saGearD8C4o0F43moYJcBeMg3YiuS4RUIED2F8jyKHaW7EM
M6U3fJG7jbjuZKHE5ETGDFNxOh/AhMSpozWUSfd5ruMptD98N3sH023J0IXgX88JDOOEAd70SSmO
vhW7WfYsTEHMTcF6wvf6ZBQUqlxNfA1ecbvQi+UnEtTr61QIckZzkBksJzNZg83pyUa6YHDmU0P3
jGhE1gaQ37TnNO6vxl9Wl0uzp2UJMUBrowiKLGcJVVHwJcN4WVGLxerB7uoMZskquAweDeR/DPSE
Hyp+C3iBWs0eF2Bi2/Jj+Cv3hqLjQrVosGDisaTu8CEiMUPt2Zjpexoi1ZZ13l74/EQCV4P7AKQd
UPQ178KfO3MZcdiruxr0p87XMafFCkbp86nrFqw/yoG2S1YTHzERpzG8+Bcq2g0mgMIvNCiBRVR2
4xXhdcNLgCyrX9CwKTnwoZIZEtNHhE00Fysx2uZ+OP1DIMSdPZEGoT8aoJ6QZwy3IrV8rlZ0J6SY
a7RXSGmPzokZdv7LjM4QzvOn7I/SYqpE1d365W98YevSwv4ChWaT9JCwp6+kYmAvBmcyiLG1Evss
3TviJ1w3fSn48qV+vitXnRCjAqIKib7OA+hHxovJSIqn/AbCyMXBTucO1it9wbNt+tKZlCLUYBNu
dPIKErpBqa06Le9839IVQaK/ABECKDAjBczTrbnwnDFHB9BjrsCZZGW3vNLYxCNdT+V8B/iGOQdO
a8JU+o2EWhm7RqE8h4pJ0C8cyVyTvVfyXoXBz5aam3Gp1wCthaelENOZgOwb2dQZQWJourO5oebb
eR25Y26Vp4dBNl0GdoNciUGdaiO1IW94Dqtsq4/fk+4JgD6SoJdslLZrUB4BiZp+htE/ZBRELj7u
fb4hpz7tWAMm4BbhzSu4rV4oxee3bkJTFzieANlW8P9cyvWy6oj0OO9rs/o3xOC0ZD00ySS76hVH
u086A+D5teuHXxDwdYp4MNNudNY5j9Ijgyxk5fBWc5MAxcvIl2h1SDmVmQjU7Xs2o55QjIJ4j/DX
+EZ2UM/BzICQ1HiXwEQqUbbxBArW1YFESlxcBnsrDP2sJRTgqL9y+E6uVdvZhX0tsdNzCYsRR+Yf
d2rQtjjMgWm6Auz/gMtqx7gN7cNFnzgX6uyZDJSqMcgytTBG0doL1azLBpqCgIidj9fxSwQHR+uH
f2/Md2epVoPmdI/azcr1fmA+d2Uf04Vyejd52a5FGIaETfjwFO4FCvaDU4lbTCcSW4+YZBX9vsNM
pNv1eN2nZ2DBPMD8OxOszvOkwzjicQUmzQaiCQ94kot2IFn15shIKc5QQ9npbkgA7/9zTMiuHE8b
Fqcj7LAyrH2HpKrsaV9BmALBujsAIG7MZr9jFwkXtckSEqkNmAMcG+Uy2xQX85pbPW+krlAj/65q
01pXh2lAVFhebb8LQW0UMXE7xqigUa9YNJwK+GtMULpoqHk+Tl5fUmkkpdJxTZcmY64FUZ7umzXH
rWf+XzqPNixWJlapQjRQ8bW8kKOVeeQtonoQP14Z2+BRtmpc9FaLoqV91MjnDal+KMR6+D+88KNF
mmNQ+YEHutAb+/7+uyTGRkfVPTmwF+z/EvPltKzzMAooTnfKy2Hs4DIrcgkoUTGftum7QLv1s/KV
jGPzKwDFws/AnGL5ZTclumh4Rxk5LvOPhU7yEyMIEUhlN8fHhoar3InHxVL8p9osZPZeqApNSlE2
YBdAkBl6d9HwRGwCpY2iimhnqd8/8D/Z6n0FAGPWZOcsNPsn0x1FaAduYNeFMyBTKGAz2mj8/O0c
zQ/oCo5C8tvs09tX4Ux6bEInf34+KMGGAvsZUT6nH3v8a47klWC7ogHoCn8eK7LN7H0rSt777TUK
HgZw32kR6/YU0Jl1Oy4UiocgUHaUiGbwewOdQJFZy+OkIhHA9l1DYbeyT1CKXKSk022bNkMuFHR3
5saHozxAp+Gxwqg3FtenDWnoRDzHLbP97YxS0yYIyJGio7nxCmLvyxH1XCkdpAZSvqbfsVjp/KqV
ihcI/F8/TojUtSOnFn2uJD847Y/Mv39Y7tceHdz1dU+xcfEMxyIt5t4Q4Nk2KfeRmSPKvLT0BSrd
YPnItv4gZufula6ol9+qeK445cBsIV9ayJXI6hbjBPTtDhs4q2D4vQmXACyMC/36MkHwmKWxmACA
b6s6wGafTr+tY0pyEIjs83KdUux/hA/VYrzYIhWbQKHJMwBv9ZrjwfwYJRQI51VnQNVEYQWn6eA0
ut/4JCQr6KrO8dpNTDcDwumpQvLUSc1W/aFELLj+t+2PNYu3P3iVuNrdhReN9KKFtmOm+MlSMu/J
U/piy9vm4wJeivOQnc7yWmvmiiNUr5Z3t+EPNvF58BlMmdVASwgSMK2t9kcVDwMfUPZ2jY267uRy
eNniOr4VxDLKqGkMAPBBfD84EPicdvx5ptusjw6meB5u9KjAvXHls6UNNgbjAqBxrAy0mlsPDucE
aEFOj8HosFUYO769bdyC+rXVb+Pu/SCKIg3QvE40lryQSNQ8DEvd3q3GgR6fIzaesgXdAg==
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
