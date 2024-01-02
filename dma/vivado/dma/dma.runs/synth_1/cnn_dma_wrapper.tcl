# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.runs/synth_1/cnn_dma_wrapper.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a200tsbg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.cache/wt} [current_project]
set_property parent.project_path {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.xpr} [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part_repo_paths {C:/Xilinx/Vivado/2021.2/data/xhub/boards/XilinxBoardStore/boards/Xilinx} [current_project]
set_property board_part digilentinc.com:nexys_video:part0:1.2 [current_project]
set_property ip_repo_paths {
  {c:/Users/Young Jae/OneDrive - SNU/maskgenfpga}
  {c:/Users/Young Jae/OneDrive - SNU/maskgenfpga/dfx/ip/dma}
  {c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/ip}
} [current_project]
update_ip_catalog
set_property ip_output_repo {c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
add_files {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/python_scripts/mask_biases.coe}}
add_files {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/python_scripts/mask_scales.coe}}
add_files {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/python_scripts/mask_weights_layer0.coe}}
add_files {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/python_scripts/mask_weights_layer1.coe}}
add_files {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/python_scripts/mask_weights_layer2.coe}}
read_mem {
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/m3/convout_L3.hex}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/new/omap_b.txt}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/m3/convout_L2.hex}
}
read_verilog -library xil_defaultlib -sv {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/params.v}}
read_verilog -library xil_defaultlib {
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/S_axilite.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/mask_calc/act_shifter.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/axi_dma_rd.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/axi_dma_wr.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/mask_calc/bias_shifter.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/mask_calc/bnorm_quant_act.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/cnn_dma_axi.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/cnn_fsm.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/mask_calc/conv_kern.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/mask_calc/conv_kern_wrapper_mask.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/mask_calc/dsp_wrapper.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/dual_port_block_ram.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/mask_calc/cnn_accel_h.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/mask_calc/mac.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/mask_calc/mac_kern.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/mask_calc/mask_gen_fsm.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/imports/mask_calc/mask_maker.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/out_writer.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/reg_fifo.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/cnn_dma_wrapper.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/AESL_axi_master_memory_bus.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/AESL_axi_slave_axilite.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/ConvNormReluPoolWrapper.autotb.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/ConvNormReluPoolWrapper_memory_bus_m_axi.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/verilog/cnn_accel_h.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/new/line_buffer_wrapper_l1.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/new/line_buffer_wrapper_l2.v}
  {C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/new/bmp_image_writer.v}
}
read_ip -quiet {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/ip/l2_o_data_128x4096/l2_o_data_128x4096.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/l2_o_data_128x4096/l2_o_data_128x4096_ooc.xdc}}]

read_ip -quiet {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/ip/axi_clock_converter_0/axi_clock_converter_0.xci}}
set_property used_in_synthesis false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/axi_clock_converter_0/axi_clock_converter_0_clocks.xdc}}]
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/axi_clock_converter_0/axi_clock_converter_0_clocks.xdc}}]
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/axi_clock_converter_0/axi_clock_converter_0_ooc.xdc}}]

read_ip -quiet {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/ip/axilite_clock_converter_0/axilite_clock_converter_0.xci}}
set_property used_in_synthesis false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/axilite_clock_converter_0/axilite_clock_converter_0_clocks.xdc}}]
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/axilite_clock_converter_0/axilite_clock_converter_0_clocks.xdc}}]
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/axilite_clock_converter_0/axilite_clock_converter_0_ooc.xdc}}]

read_ip -quiet {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/ip/bias_blk_mem/bias_blk_mem.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/bias_blk_mem/bias_blk_mem_ooc.xdc}}]

read_ip -quiet {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/ip/scale_blk_mem/scale_blk_mem.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/scale_blk_mem/scale_blk_mem_ooc.xdc}}]

read_ip -quiet {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/ip/weight_0_blk_mem/weight_0_blk_mem.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/weight_0_blk_mem/weight_0_blk_mem_ooc.xdc}}]

read_ip -quiet {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/ip/weight_1_blk_mem/weight_1_blk_mem.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/weight_1_blk_mem/weight_1_blk_mem_ooc.xdc}}]

read_ip -quiet {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/ip/weight_2_blk_mem/weight_2_blk_mem.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/weight_2_blk_mem/weight_2_blk_mem_ooc.xdc}}]

read_ip -quiet {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/ip/ifm_data_128x32768/ifm_data_128x32768.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/ifm_data_128x32768/ifm_data_128x32768_ooc.xdc}}]

read_ip -quiet {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/ip/layer1_line_buffer_128x256/layer1_line_buffer_128x256.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/layer1_line_buffer_128x256/layer1_line_buffer_128x256_ooc.xdc}}]

read_ip -quiet {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/ip/l1_o_data_128x4096/l1_o_data_128x4096.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/l1_o_data_128x4096/l1_o_data_128x4096_ooc.xdc}}]

read_ip -quiet {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/sources_1/ip/layer2_line_buffer_192x32/layer2_line_buffer_192x32.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.gen/sources_1/ip/layer2_line_buffer_192x32/layer2_line_buffer_192x32_ooc.xdc}}]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/constrs_1/imports/maskgenFPGA/Nexys-Video-Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/Young Jae/OneDrive - SNU/maskgenFPGA/dfx/ip/dma/vivado/dma/dma.srcs/constrs_1/imports/maskgenFPGA/Nexys-Video-Master.xdc}}]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1

read_checkpoint -auto_incremental -incremental C:/maskgenFPGA/ip/dma/vivado/dma/dma.srcs/utils_1/imports/synth_1/cnn_dma_wrapper.dcp
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top cnn_dma_wrapper -part xc7a200tsbg484-1
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef cnn_dma_wrapper.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file cnn_dma_wrapper_utilization_synth.rpt -pb cnn_dma_wrapper_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }