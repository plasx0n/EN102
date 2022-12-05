# Author Camille Leroux
# IMS Laboratory Bordeaux
# script de synthèse logique pour design_vision
################################################


################################################
# 1. INITIALIZATION
################################################


# execute a script containing standard cells library path and other things
source ./synopsys_dc.setup

# define the tol level name
set MON_TOP_LEVEL detect_impulsion
# define the name of the VHDL architecture
set MON_ARCHI Behavioral

# define the name of the clock port in the VHDL
set CLK_PORT clk


# define the target frequency (MHz)
set FREQ_MHZ  50.0

# calculte the clock period (ns)
set CLK_PERIOD [expr 1000.0 / $FREQ_MHZ]

################################################################################################
# 2. FIRST LOGIC SYNTHESIS : NO TECHNOLOGY MAPPING
################################################################################################

analyze -f vhdl ../vhdl/FSM.vhd
analyze -f vhdl ../vhdl/counter.vhd
analyze -f vhdl ../vhdl/comparator.vhd
analyze -f vhdl ../vhdl/timer.vhd
analyze -f vhdl ../vhdl/$MON_TOP_LEVEL.vhd


# first logic synthesis without technology mapping
elaborate $MON_TOP_LEVEL -arch $MON_ARCHI -lib WORK -update

################################################################################################
# 3. APPLY TIMING CONSTRAINTS
################################################################################################

# define a clock (my_clock) with a period of $CLK_PERIOD and link it to our design clock port : $CLK_PORT
create_clock -name my_clock [get_ports $CLK_PORT] -period $CLK_PERIOD

# tell the tool not to optimize the clock tree. This will be done during Place and Route
set_dont_touch_network my_clock

check_design

################################################################################################
# 4. SECOND LOGIC SYNTHESIS : TECHNOLOGY MAPPING + OPTIMIZATION
################################################################################################

# perform technology mapping + optimizations
# options may improve the performance of the circuit
compile

