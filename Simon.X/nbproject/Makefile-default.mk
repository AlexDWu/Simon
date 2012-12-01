#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Simon.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Simon.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/1105076141/pic24_clockfreq.o ${OBJECTDIR}/_ext/1105076141/pic24_configbits.o ${OBJECTDIR}/_ext/1105076141/pic24_util.o ${OBJECTDIR}/_ext/1105076141/pic24_uart.o ${OBJECTDIR}/_ext/1105076141/pic24_serial.o ${OBJECTDIR}/_ext/1105076141/pic24_timer.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/_ext/1105076141/pic24_clockfreq.o.d ${OBJECTDIR}/_ext/1105076141/pic24_configbits.o.d ${OBJECTDIR}/_ext/1105076141/pic24_util.o.d ${OBJECTDIR}/_ext/1105076141/pic24_uart.o.d ${OBJECTDIR}/_ext/1105076141/pic24_serial.o.d ${OBJECTDIR}/_ext/1105076141/pic24_timer.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/1105076141/pic24_clockfreq.o ${OBJECTDIR}/_ext/1105076141/pic24_configbits.o ${OBJECTDIR}/_ext/1105076141/pic24_util.o ${OBJECTDIR}/_ext/1105076141/pic24_uart.o ${OBJECTDIR}/_ext/1105076141/pic24_serial.o ${OBJECTDIR}/_ext/1105076141/pic24_timer.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Simon.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24HJ32GP202
MP_LINKER_FILE_OPTION=,--script=p24HJ32GP202.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1105076141/pic24_clockfreq.o: ../../CD\ stuff/code/common/pic24_clockfreq.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1105076141 
	@${RM} ${OBJECTDIR}/_ext/1105076141/pic24_clockfreq.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../CD stuff/code/common/pic24_clockfreq.c"  -o ${OBJECTDIR}/_ext/1105076141/pic24_clockfreq.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1105076141/pic24_clockfreq.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1105076141/pic24_clockfreq.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1105076141/pic24_configbits.o: ../../CD\ stuff/code/common/pic24_configbits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1105076141 
	@${RM} ${OBJECTDIR}/_ext/1105076141/pic24_configbits.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../CD stuff/code/common/pic24_configbits.c"  -o ${OBJECTDIR}/_ext/1105076141/pic24_configbits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1105076141/pic24_configbits.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1105076141/pic24_configbits.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1105076141/pic24_util.o: ../../CD\ stuff/code/common/pic24_util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1105076141 
	@${RM} ${OBJECTDIR}/_ext/1105076141/pic24_util.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../CD stuff/code/common/pic24_util.c"  -o ${OBJECTDIR}/_ext/1105076141/pic24_util.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1105076141/pic24_util.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1105076141/pic24_util.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1105076141/pic24_uart.o: ../../CD\ stuff/code/common/pic24_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1105076141 
	@${RM} ${OBJECTDIR}/_ext/1105076141/pic24_uart.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../CD stuff/code/common/pic24_uart.c"  -o ${OBJECTDIR}/_ext/1105076141/pic24_uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1105076141/pic24_uart.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1105076141/pic24_uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1105076141/pic24_serial.o: ../../CD\ stuff/code/common/pic24_serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1105076141 
	@${RM} ${OBJECTDIR}/_ext/1105076141/pic24_serial.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../CD stuff/code/common/pic24_serial.c"  -o ${OBJECTDIR}/_ext/1105076141/pic24_serial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1105076141/pic24_serial.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1105076141/pic24_serial.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1105076141/pic24_timer.o: ../../CD\ stuff/code/common/pic24_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1105076141 
	@${RM} ${OBJECTDIR}/_ext/1105076141/pic24_timer.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../CD stuff/code/common/pic24_timer.c"  -o ${OBJECTDIR}/_ext/1105076141/pic24_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1105076141/pic24_timer.o.d"        -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1105076141/pic24_timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR} 
	@${RM} ${OBJECTDIR}/main.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1105076141/pic24_clockfreq.o: ../../CD\ stuff/code/common/pic24_clockfreq.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1105076141 
	@${RM} ${OBJECTDIR}/_ext/1105076141/pic24_clockfreq.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../CD stuff/code/common/pic24_clockfreq.c"  -o ${OBJECTDIR}/_ext/1105076141/pic24_clockfreq.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1105076141/pic24_clockfreq.o.d"        -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1105076141/pic24_clockfreq.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1105076141/pic24_configbits.o: ../../CD\ stuff/code/common/pic24_configbits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1105076141 
	@${RM} ${OBJECTDIR}/_ext/1105076141/pic24_configbits.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../CD stuff/code/common/pic24_configbits.c"  -o ${OBJECTDIR}/_ext/1105076141/pic24_configbits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1105076141/pic24_configbits.o.d"        -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1105076141/pic24_configbits.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1105076141/pic24_util.o: ../../CD\ stuff/code/common/pic24_util.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1105076141 
	@${RM} ${OBJECTDIR}/_ext/1105076141/pic24_util.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../CD stuff/code/common/pic24_util.c"  -o ${OBJECTDIR}/_ext/1105076141/pic24_util.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1105076141/pic24_util.o.d"        -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1105076141/pic24_util.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1105076141/pic24_uart.o: ../../CD\ stuff/code/common/pic24_uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1105076141 
	@${RM} ${OBJECTDIR}/_ext/1105076141/pic24_uart.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../CD stuff/code/common/pic24_uart.c"  -o ${OBJECTDIR}/_ext/1105076141/pic24_uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1105076141/pic24_uart.o.d"        -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1105076141/pic24_uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1105076141/pic24_serial.o: ../../CD\ stuff/code/common/pic24_serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1105076141 
	@${RM} ${OBJECTDIR}/_ext/1105076141/pic24_serial.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../CD stuff/code/common/pic24_serial.c"  -o ${OBJECTDIR}/_ext/1105076141/pic24_serial.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1105076141/pic24_serial.o.d"        -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1105076141/pic24_serial.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1105076141/pic24_timer.o: ../../CD\ stuff/code/common/pic24_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1105076141 
	@${RM} ${OBJECTDIR}/_ext/1105076141/pic24_timer.o.d 
	${MP_CC} $(MP_EXTRA_CC_PRE)  "../../CD stuff/code/common/pic24_timer.c"  -o ${OBJECTDIR}/_ext/1105076141/pic24_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1105076141/pic24_timer.o.d"        -g -omf=elf -O0 -msmart-io=1 -Wall -msfr-warn=off
	@${FIXDEPS} "${OBJECTDIR}/_ext/1105076141/pic24_timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Simon.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Simon.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -Wl,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Simon.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Simon.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -Wl,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}/xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Simon.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
