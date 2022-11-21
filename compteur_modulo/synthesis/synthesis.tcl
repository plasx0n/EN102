# script de synthèse logique pour Design Compiler

# initialisation des chemins de la librairie standard
source synopsys_dc.setup

# analyse synthaxiques du ou des fichiers VHDL
analyze -f vhdl ../vhdl/MON_FICHER_1.vhd
#analyze -f vhdl ../vhdl/MON_FICHER_2.vhd
#analyze -f vhdl ../vhdl/MON_FICHER_3.vhd

# synthèse générique
elaborate MON_TOP_LEVEL -arch MON_ARCHITECTURE -lib WORK -update

# synthèse technologique
compile
