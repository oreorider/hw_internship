// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Wed Nov 29 12:04:07 2023
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
