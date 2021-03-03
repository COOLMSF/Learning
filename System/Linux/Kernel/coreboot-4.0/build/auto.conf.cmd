deps_config := \
	src/console/Kconfig \
	src/devices/Kconfig \
	src/superio/winbond/Kconfig \
	src/superio/via/Kconfig \
	src/superio/smsc/Kconfig \
	src/superio/serverengines/Kconfig \
	src/superio/renesas/Kconfig \
	src/superio/nsc/Kconfig \
	src/superio/ite/Kconfig \
	src/superio/intel/Kconfig \
	src/superio/fintek/Kconfig \
	src/superio/Kconfig \
	src/southbridge/via/vt8237r/Kconfig \
	src/southbridge/via/vt8235/Kconfig \
	src/southbridge/via/vt8231/Kconfig \
	src/southbridge/via/k8t890/Kconfig \
	src/southbridge/via/Kconfig \
	src/southbridge/ti/pci7420/Kconfig \
	src/southbridge/ti/Kconfig \
	src/southbridge/sis/sis966/Kconfig \
	src/southbridge/sis/Kconfig \
	src/southbridge/ricoh/rl5c476/Kconfig \
	src/southbridge/ricoh/Kconfig \
	src/southbridge/nvidia/mcp55/Kconfig \
	src/southbridge/nvidia/ck804/Kconfig \
	src/southbridge/nvidia/Kconfig \
	src/southbridge/intel/pxhd/Kconfig \
	src/southbridge/intel/i82870/Kconfig \
	src/southbridge/intel/i82801xx/Kconfig \
	src/southbridge/intel/i82801gx/Kconfig \
	src/southbridge/intel/i82801er/Kconfig \
	src/southbridge/intel/i82801dbm/Kconfig \
	src/southbridge/intel/i82801ca/Kconfig \
	src/southbridge/intel/i82371eb/Kconfig \
	src/southbridge/intel/i3100/Kconfig \
	src/southbridge/intel/esb6300/Kconfig \
	src/southbridge/intel/Kconfig \
	src/southbridge/broadcom/bcm5785/Kconfig \
	src/southbridge/broadcom/bcm5780/Kconfig \
	src/southbridge/broadcom/bcm21000/Kconfig \
	src/southbridge/broadcom/Kconfig \
	src/southbridge/amd/sb600/Kconfig \
	src/southbridge/amd/rs690/Kconfig \
	src/southbridge/amd/cs5535/Kconfig \
	src/southbridge/amd/cs5530/Kconfig \
	src/southbridge/amd/amd8151/Kconfig \
	src/southbridge/amd/amd8132/Kconfig \
	src/southbridge/amd/cs5536/Kconfig \
	src/southbridge/amd/amd8131/Kconfig \
	src/southbridge/amd/amd8111/Kconfig \
	src/southbridge/amd/Kconfig \
	src/southbridge/Kconfig \
	src/northbridge/via/vx800/Kconfig \
	src/northbridge/via/vt8623/Kconfig \
	src/northbridge/via/vt8601/Kconfig \
	src/northbridge/via/cn400/Kconfig \
	src/northbridge/via/cx700/Kconfig \
	src/northbridge/via/cn700/Kconfig \
	src/northbridge/via/Kconfig \
	src/northbridge/intel/i945/Kconfig \
	src/northbridge/intel/i855pm/Kconfig \
	src/northbridge/intel/i855gme/Kconfig \
	src/northbridge/intel/i82830/Kconfig \
	src/northbridge/intel/i82810/Kconfig \
	src/northbridge/intel/i440lx/Kconfig \
	src/northbridge/intel/i440bx/Kconfig \
	src/northbridge/intel/i3100/Kconfig \
	src/northbridge/intel/e7525/Kconfig \
	src/northbridge/intel/e7520/Kconfig \
	src/northbridge/intel/e7501/Kconfig \
	src/northbridge/intel/Kconfig \
	src/northbridge/amd/lx/Kconfig \
	src/northbridge/amd/amdfam10/root_complex/Kconfig \
	src/northbridge/amd/amdfam10/Kconfig \
	src/northbridge/amd/gx2/Kconfig \
	src/northbridge/amd/gx1/Kconfig \
	src/northbridge/amd/amdk8/root_complex/Kconfig \
	src/northbridge/amd/amdk8/Kconfig \
	src/northbridge/amd/Kconfig \
	src/northbridge/Kconfig \
	src/cpu/x86/Kconfig \
	src/cpu/via/model_c7/Kconfig \
	src/cpu/via/model_c3/Kconfig \
	src/cpu/via/Kconfig \
	src/cpu/intel/socket_441/Kconfig \
	src/cpu/intel/socket_PGA370/Kconfig \
	src/cpu/intel/socket_mPGA604/Kconfig \
	src/cpu/intel/socket_mPGA603/Kconfig \
	src/cpu/intel/socket_mPGA479M/Kconfig \
	src/cpu/intel/socket_mPGA478/Kconfig \
	src/cpu/intel/socket_mFCPGA478/Kconfig \
	src/cpu/intel/slot_2/Kconfig \
	src/cpu/intel/ep80579/Kconfig \
	src/cpu/intel/bga956/Kconfig \
	src/cpu/intel/model_106cx/Kconfig \
	src/cpu/intel/model_1067x/Kconfig \
	src/cpu/intel/model_6fx/Kconfig \
	src/cpu/intel/model_6ex/Kconfig \
	src/cpu/intel/model_6dx/Kconfig \
	src/cpu/intel/model_69x/Kconfig \
	src/cpu/intel/Kconfig \
	src/cpu/emulation/qemu-x86/Kconfig \
	src/cpu/emulation/Kconfig \
	src/cpu/amd/sc520/Kconfig \
	src/cpu/amd/model_lx/Kconfig \
	src/cpu/amd/model_gx2/Kconfig \
	src/cpu/amd/model_gx1/Kconfig \
	src/cpu/amd/model_10xxx/Kconfig \
	src/cpu/amd/model_fxx/Kconfig \
	src/cpu/amd/socket_S1G1/Kconfig \
	src/cpu/amd/socket_F_1207/Kconfig \
	src/cpu/amd/socket_F/Kconfig \
	src/cpu/amd/socket_AM2r2/Kconfig \
	src/cpu/amd/socket_AM2/Kconfig \
	src/cpu/amd/socket_940/Kconfig \
	src/cpu/amd/socket_939/Kconfig \
	src/cpu/amd/socket_754/Kconfig \
	src/cpu/amd/Kconfig \
	src/cpu/Kconfig \
	src/arch/i386/Kconfig \
	src/mainboard/via/vt8454c/Kconfig \
	src/mainboard/via/pc2500e/Kconfig \
	src/mainboard/via/epia-n/Kconfig \
	src/mainboard/via/epia-m700/Kconfig \
	src/mainboard/via/epia-m/Kconfig \
	src/mainboard/via/epia-cn/Kconfig \
	src/mainboard/via/epia/Kconfig \
	src/mainboard/via/Kconfig \
	src/mainboard/tyan/s4882/Kconfig \
	src/mainboard/tyan/s4880/Kconfig \
	src/mainboard/tyan/s2912_fam10/Kconfig \
	src/mainboard/tyan/s2912/Kconfig \
	src/mainboard/tyan/s2895/Kconfig \
	src/mainboard/tyan/s2892/Kconfig \
	src/mainboard/tyan/s2891/Kconfig \
	src/mainboard/tyan/s2885/Kconfig \
	src/mainboard/tyan/s2882/Kconfig \
	src/mainboard/tyan/s2881/Kconfig \
	src/mainboard/tyan/s2880/Kconfig \
	src/mainboard/tyan/s2875/Kconfig \
	src/mainboard/tyan/s2850/Kconfig \
	src/mainboard/tyan/s2735/Kconfig \
	src/mainboard/tyan/s1846/Kconfig \
	src/mainboard/tyan/Kconfig \
	src/mainboard/thomson/ip1000/Kconfig \
	src/mainboard/thomson/Kconfig \
	src/mainboard/televideo/tc7020/Kconfig \
	src/mainboard/televideo/Kconfig \
	src/mainboard/technologic/ts5300/Kconfig \
	src/mainboard/technologic/Kconfig \
	src/mainboard/technexion/tim5690/Kconfig \
	src/mainboard/technexion/tim8690/Kconfig \
	src/mainboard/technexion/Kconfig \
	src/mainboard/supermicro/x6dhr_ig2/Kconfig \
	src/mainboard/supermicro/x6dhr_ig/Kconfig \
	src/mainboard/supermicro/x6dhe_g2/Kconfig \
	src/mainboard/supermicro/x6dhe_g/Kconfig \
	src/mainboard/supermicro/x6dai_g/Kconfig \
	src/mainboard/supermicro/h8qme_fam10/Kconfig \
	src/mainboard/supermicro/h8dmr_fam10/Kconfig \
	src/mainboard/supermicro/h8dmr/Kconfig \
	src/mainboard/supermicro/h8dme/Kconfig \
	src/mainboard/supermicro/Kconfig \
	src/mainboard/sunw/ultra40/Kconfig \
	src/mainboard/sunw/Kconfig \
	src/mainboard/soyo/sy-6ba-plus-iii/Kconfig \
	src/mainboard/soyo/Kconfig \
	src/mainboard/roda/rk886ex/Kconfig \
	src/mainboard/roda/Kconfig \
	src/mainboard/rca/rm4100/Kconfig \
	src/mainboard/rca/Kconfig \
	src/mainboard/pcengines/alix1c/Kconfig \
	src/mainboard/pcengines/Kconfig \
	src/mainboard/olpc/btest/Kconfig \
	src/mainboard/olpc/rev_a/Kconfig \
	src/mainboard/olpc/Kconfig \
	src/mainboard/nvidia/l1_2pvv/Kconfig \
	src/mainboard/nvidia/Kconfig \
	src/mainboard/newisys/khepri/Kconfig \
	src/mainboard/newisys/Kconfig \
	src/mainboard/nec/powermate2000/Kconfig \
	src/mainboard/nec/Kconfig \
	src/mainboard/msi/ms9282/Kconfig \
	src/mainboard/msi/ms9185/Kconfig \
	src/mainboard/msi/ms7260/Kconfig \
	src/mainboard/msi/ms7135/Kconfig \
	src/mainboard/msi/ms6178/Kconfig \
	src/mainboard/msi/ms6156/Kconfig \
	src/mainboard/msi/ms6147/Kconfig \
	src/mainboard/msi/ms6119/Kconfig \
	src/mainboard/msi/Kconfig \
	src/mainboard/mitac/6513wu/Kconfig \
	src/mainboard/mitac/Kconfig \
	src/mainboard/lippert/spacerunner-lx/Kconfig \
	src/mainboard/lippert/roadrunner-lx/Kconfig \
	src/mainboard/lippert/frontrunner/Kconfig \
	src/mainboard/lippert/Kconfig \
	src/mainboard/kontron/kt690/Kconfig \
	src/mainboard/kontron/986lcd-m/Kconfig \
	src/mainboard/kontron/Kconfig \
	src/mainboard/jetway/j7f24/Kconfig \
	src/mainboard/jetway/Kconfig \
	src/mainboard/iwill/dk8x/Kconfig \
	src/mainboard/iwill/dk8s2/Kconfig \
	src/mainboard/iwill/dk8_htx/Kconfig \
	src/mainboard/iwill/Kconfig \
	src/mainboard/intel/xe7501devkit/Kconfig \
	src/mainboard/intel/truxton/Kconfig \
	src/mainboard/intel/mtarvon/Kconfig \
	src/mainboard/intel/jarrell/Kconfig \
	src/mainboard/intel/eagleheights/Kconfig \
	src/mainboard/intel/d945gclf/Kconfig \
	src/mainboard/intel/Kconfig \
	src/mainboard/iei/pcisa-lx-800-r10/Kconfig \
	src/mainboard/iei/nova4899r/Kconfig \
	src/mainboard/iei/juki-511p/Kconfig \
	src/mainboard/iei/Kconfig \
	src/mainboard/ibm/e326/Kconfig \
	src/mainboard/ibm/e325/Kconfig \
	src/mainboard/ibm/Kconfig \
	src/mainboard/hp/e_vectra_p2706t/Kconfig \
	src/mainboard/hp/dl145_g3/Kconfig \
	src/mainboard/hp/Kconfig \
	src/mainboard/gigabyte/m57sli/Kconfig \
	src/mainboard/gigabyte/ga-6bxc/Kconfig \
	src/mainboard/gigabyte/ga_2761gxdk/Kconfig \
	src/mainboard/gigabyte/Kconfig \
	src/mainboard/emulation/qemu-x86/Kconfig \
	src/mainboard/emulation/Kconfig \
	src/mainboard/eaglelion/5bcm/Kconfig \
	src/mainboard/eaglelion/Kconfig \
	src/mainboard/digitallogic/msm800sev/Kconfig \
	src/mainboard/digitallogic/msm586seg/Kconfig \
	src/mainboard/digitallogic/adl855pc/Kconfig \
	src/mainboard/digitallogic/Kconfig \
	src/mainboard/dell/s1850/Kconfig \
	src/mainboard/dell/Kconfig \
	src/mainboard/compaq/deskpro_en_sff_p600/Kconfig \
	src/mainboard/compaq/Kconfig \
	src/mainboard/broadcom/blast/Kconfig \
	src/mainboard/broadcom/Kconfig \
	src/mainboard/biostar/m6tba/Kconfig \
	src/mainboard/biostar/Kconfig \
	src/mainboard/bcom/winnetp680/Kconfig \
	src/mainboard/bcom/winnet100/Kconfig \
	src/mainboard/bcom/Kconfig \
	src/mainboard/azza/pt-6ibd/Kconfig \
	src/mainboard/azza/Kconfig \
	src/mainboard/axus/tc320/Kconfig \
	src/mainboard/axus/Kconfig \
	src/mainboard/asus/mew-vm/Kconfig \
	src/mainboard/asus/mew-am/Kconfig \
	src/mainboard/asus/m2v-mx_se/Kconfig \
	src/mainboard/asus/p3b-f/Kconfig \
	src/mainboard/asus/p2b-f/Kconfig \
	src/mainboard/asus/p2b-ds/Kconfig \
	src/mainboard/asus/p2b-d/Kconfig \
	src/mainboard/asus/p2b/Kconfig \
	src/mainboard/asus/a8v-e_se/Kconfig \
	src/mainboard/asus/a8n_e/Kconfig \
	src/mainboard/asus/Kconfig \
	src/mainboard/asi/mb_5blmp/Kconfig \
	src/mainboard/asi/mb_5blgp/Kconfig \
	src/mainboard/asi/Kconfig \
	src/mainboard/artecgroup/dbe61/Kconfig \
	src/mainboard/artecgroup/Kconfig \
	src/mainboard/arima/hdama/Kconfig \
	src/mainboard/arima/Kconfig \
	src/mainboard/amd/serengeti_cheetah_fam10/Kconfig \
	src/mainboard/amd/serengeti_cheetah/Kconfig \
	src/mainboard/amd/rumba/Kconfig \
	src/mainboard/amd/pistachio/Kconfig \
	src/mainboard/amd/norwich/Kconfig \
	src/mainboard/amd/dbm690t/Kconfig \
	src/mainboard/amd/db800/Kconfig \
	src/mainboard/amd/Kconfig \
	src/mainboard/advantech/pcm-5820/Kconfig \
	src/mainboard/advantech/Kconfig \
	src/mainboard/abit/be6-ii_v2_0/Kconfig \
	src/mainboard/abit/Kconfig \
	src/mainboard/a-trend/atc-6240/Kconfig \
	src/mainboard/a-trend/atc-6220/Kconfig \
	src/mainboard/a-trend/Kconfig \
	src/mainboard/Kconfig \
	src/Kconfig

build/auto.conf: \
	$(deps_config)


$(deps_config): ;
