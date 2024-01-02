// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Wed Nov 29 12:04:08 2023
// Host        : sml running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/Young Jae/OneDrive -
//               SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/weight_1_blk_mem/weight_1_blk_mem_sim_netlist.v}
// Design      : weight_1_blk_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "weight_1_blk_mem,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module weight_1_blk_mem
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [127:0]douta;

  wire [5:0]addra;
  wire clka;
  wire [127:0]douta;
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
  wire [127:0]NLW_U0_doutb_UNCONNECTED;
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [127:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "6" *) 
  (* C_ADDRB_WIDTH = "6" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     12.7408 mW" *) 
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
  (* C_INIT_FILE = "weight_1_blk_mem.mem" *) 
  (* C_INIT_FILE_NAME = "weight_1_blk_mem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "64" *) 
  (* C_READ_DEPTH_B = "64" *) 
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
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "64" *) 
  (* C_WRITE_DEPTH_B = "64" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "128" *) 
  (* C_WRITE_WIDTH_B = "128" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  weight_1_blk_mem_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[127:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[5:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[5:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 51888)
`pragma protect data_block
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
Chlr6qyGajP27rh3vfqmrT7L
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
