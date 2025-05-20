# Standard configuration for PIMEGA detectors
#
# Configuration parameters:
#
# $(PREFIX)
# Prefix for all records
#
# $(DMODEL)
# Detector model, according to the following mapping:
#   0 - mobipix
#   1 - pimega45D
#   2 - pimega135DL
#   3 - pimega135D
#   4 - pimega540D
#   5 - pimega450D
#   6 - pimega450DS
#
# $(PIMEGA_MODULE{01..10}_IP)
# IP address for each detector module. Addresses which refer to a non-existent
# module for a given detector model are ignored (and contain a default value),
# therefore can be left undefined.
#
# $(PIMEGA_PORT)
# The detector TCP connection port number
#
# $(XSIZE)
# The size of the sensor in the X direction.
#
# $(YSIZE)
# The size of the sensor in the Y direction.
#
# $(COMMAND_PORT)
# Backend port for commands and status
#
# $(FRAME_PORT)
# Backend port for frame receiving
#
# $(CALIBRATION_FILE)
# Calibration file path containing default DAC values
#
# Optional parameters:
#
# $(BACKEND_ON), default 1 (true)
# Run the IOC without connecting to the backend. Obviously, there will be no
# images received.
#
# $(ENABLE_LOG), default 0 (false)
# Enable pimega library logging to file (according to logFile PV)
#
# $(RESET_RDMA), default 1 (true)
# Reset the RDMA buffer before the acquisition
#
# $(SIMULATION), default 0 (false)
# Activate simulation mode.
#
# $(ARRAYPOOL_MAX_BUFFERS), default 0 (unlimited)
# The maximum number of NDArray buffers that the NDArrayPool for this driver is
# allowed to allocate.
#
# $(ARRAYPOOL_MAX_MEMORY), default 0 (unlimited)
# The maximum amount of memory that the NDArrayPool for this driver is allowed
# to allocate. Defaults to an unlimited amount of memory.
#
# $(ASYN_THREAD_PRIORITY), default 0
# The thread priority for the asyn port driver thread if ASYN_CANBLOCK is set
# in asynFlags.
#
# $(ASYN_STACK_SIZE), default 0
# The stack size for the asyn port driver thread if ASYN_CANBLOCK is set in asynFlags.

on error halt

< envPaths

errlogInit(20000)

dbLoadDatabase("$(TOP)/dbd/pimegaApp.dbd")
pimegaApp_registerRecordDeviceDriver(pdbbase) 

# The port name for the detector
epicsEnvSet("PORT",   "PIMEGA")

# The search path for database files
epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(ADCORE)/db")

pimegaDetectorConfig("$(PORT)",$(PIMEGA_MODULE01_IP="127.0.0.1"), $(PIMEGA_MODULE02_IP="127.0.0.1"),$(PIMEGA_MODULE03_IP="127.0.0.1"),$(PIMEGA_MODULE04_IP="127.0.0.1"),$(PIMEGA_MODULE05_IP="127.0.0.1"),$(PIMEGA_MODULE06_IP="127.0.0.1"),$(PIMEGA_MODULE07_IP="127.0.0.1"),$(PIMEGA_MODULE08_IP="127.0.0.1"),$(PIMEGA_MODULE09_IP="127.0.0.1"),$(PIMEGA_MODULE10_IP="127.0.0.1"),$(PIMEGA_PORT), $(XSIZE), $(YSIZE), $(DMODEL), $(ARRAYPOOL_MAX_BUFFERS="0"), $(ARRAYPOOL_MAX_MEMORY="0"), $(ASYN_THREAD_PRIORITY="0"), $(ASYN_STACK_SIZE="0"), $(SIMULATION="0"), $(BACKEND_ON="1"),$(ENABLE_LOG="0"), $(COMMAND_PORT), $(FRAME_PORT), $(RESET_RDMA="1"))

dbLoadRecords("$(ADPIMEGA)/db/pimega.template","P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")
dbLoadRecords("$(ADPIMEGA)/db/NDFile.template","P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")

# Load asynRecord record
dbLoadRecords("$(ASYN)/db/asynRecord.db", "P=${PREFIX}, R=asyn1,PORT=$(PORT),ADDR=0,OMAX=256,IMAX=256")
asynSetTraceMask($(PORT), 0, 0x00)
