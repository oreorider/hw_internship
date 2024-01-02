// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Wed Nov 29 12:04:04 2023
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
rW+l9UdxaQ==
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
