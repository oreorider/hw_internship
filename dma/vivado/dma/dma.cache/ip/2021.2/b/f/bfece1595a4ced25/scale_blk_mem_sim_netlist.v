// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon Aug 28 13:35:48 2023
// Host        : sml running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ scale_blk_mem_sim_netlist.v
// Design      : scale_blk_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "scale_blk_mem,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
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
