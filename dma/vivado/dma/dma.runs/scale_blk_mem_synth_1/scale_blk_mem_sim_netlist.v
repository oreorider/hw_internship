// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Wed Nov 29 12:04:05 2023
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
