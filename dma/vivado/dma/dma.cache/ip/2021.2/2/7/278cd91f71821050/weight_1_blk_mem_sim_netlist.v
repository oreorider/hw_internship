// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon Aug 28 13:46:09 2023
// Host        : sml running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ weight_1_blk_mem_sim_netlist.v
// Design      : weight_1_blk_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "weight_1_blk_mem,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 51968)
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
