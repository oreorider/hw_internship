// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon Aug 28 13:47:18 2023
// Host        : sml running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ weight_2_blk_mem_sim_netlist.v
// Design      : weight_2_blk_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "weight_2_blk_mem,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19216)
`pragma protect data_block
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
H0qZXZ2Q4g==
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
