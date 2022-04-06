# Begin_DVE_Session_Save_Info
# DVE restart session
# Saved on Wed Apr 6 10:45:37 2022
# Designs open: 1
#   Sim: /afs/ece.cmu.edu/usr/cabernar/Private/capstone/virtualagc/sv/simv
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Source.1: _vcs_unit__1064167090
#   Wave.1: 35 signals
#   Group count = 1
#   Group Group1 signal count = 35
# End_DVE_Session_Save_Info

# DVE version: K-2015.09_Full64
# DVE build date: Aug 25 2015 21:36:02


#<Session mode="Restart" path=".restartSimSession.tcl" type="Debug">

gui_set_loading_session_type Restart
gui_continuetime_set
gui_clear_window -type Wave
gui_clear_window -type List

# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

set TopLevel.1 TopLevel.1

# Docked window settings
set HSPane.1 HSPane.1
set Hier.1 Hier.1
set DLPane.1 DLPane.1
set Data.1 Data.1
set Console.1 Console.1
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 Source.1
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings


# Create and position top-level window: TopLevel.2

set TopLevel.2 TopLevel.2

# Docked window settings
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
set Wave.1 Wave.1
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 427} {child_wave_right 1043} {child_wave_colname 211} {child_wave_colvalue 212} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings


#</WindowLayout>

#<Database>

gui_set_precision 1ps
gui_set_time_units 1ps
#</Database>

# DVE Global setting session: 


# Global: Breakpoints

# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {TB.core}
gui_load_child_values {TB.core.rf}


set _session_group_6 Group1
gui_sg_create "$_session_group_6"
set Group1 "$_session_group_6"

gui_sg_addsignal -group "$_session_group_6" { TB.core.clock TB.core.reset_n TB.core.pc_F TB.core.pc_1_F TB.core.next_pc_F TB.core.alu_out_E TB.core.alu_src2_E TB.core.ctrl_D TB.core.ctrl_E TB.core.ctrl_W TB.core.eq_0_E TB.core.alu_src1_E TB.core.alu_out_W TB.core.rf.reg_A TB.core.rf.reg_L TB.core.rf.reg_Q TB.core.rf.reg_BB TB.core.rf.reg_CYR TB.core.rf.reg_SR TB.core.rf.reg_CYL TB.core.rf.reg_SL TB.core.rf.reg_TIME1 TB.core.rf.reg_TIME2 TB.core.ALU.operation_sel TB.core.ALU.source_1 TB.core.ALU.source_2 TB.core.ALU.result TB.core.ALU.res_eq_0 TB.core.ALU.res_add_sub TB.core.ALU.res_div_quot TB.core.ALU.res_div_remain TB.core.ALU.add_sub_src_1 TB.core.ALU.add_sub_src_2 TB.core.ALU.res_mult TB.core.ALU.sel_subtract }

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_change_design -id ${Hier.1} -design Sim
catch {gui_list_expand -id ${Hier.1} TB}
catch {gui_list_expand -id ${Hier.1} TB.core}
catch {gui_list_select -id ${Hier.1} {TB.core.ALU}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {TB.core.ALU}
gui_show_window -window ${Data.1}
catch { gui_list_select -id ${Data.1} {TB.core.ALU.add_sub_src_1 TB.core.ALU.add_sub_src_2 TB.core.ALU.result TB.core.ALU.res_div_quot TB.core.ALU.operation_sel TB.core.ALU.sel_subtract TB.core.ALU.res_div_remain TB.core.ALU.res_add_sub TB.core.ALU.res_mult TB.core.ALU.source_1 TB.core.ALU.source_2 TB.core.ALU.res_eq_0 }}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active _vcs_unit__1064167090 /afs/ece.cmu.edu/usr/cabernar/Private/capstone/virtualagc/sv/top.sv
gui_view_scroll -id ${Source.1} -vertical -set 0
gui_src_set_reusable -id ${Source.1}

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_wv_zoom_timerange -id ${Wave.1} 0 341
gui_list_add_group -id ${Wave.1} -after {New Group} {Group1}
gui_list_expand -id ${Wave.1} TB.core.ctrl_E
gui_seek_criteria -id ${Wave.1} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group Group1  -position in

gui_view_scroll -id ${Wave.1} -vertical -set 900
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${DLPane.1}
}
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

