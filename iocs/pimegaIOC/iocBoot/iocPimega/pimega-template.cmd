< envPaths

errlogInit(20000)

dbLoadDatabase("$(TOP)/dbd/pimegaApp.dbd")
pimegaApp_registerRecordDeviceDriver(pdbbase) 

# The port name for the detector
epicsEnvSet("PORT",   "PIMEGA")

# The search path for database files
epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(ADCORE)/db")

# pimegaDetectorConfig(
#              portName,           # The name of the asyn port to be created
#              address,            # The ip address of the pimega detector
#              port,               # the number port of pimega detector
#              maxSizeX,           # The size of the pimega detector in the X direction.
#              maxSizeY,           # The size of the pimega detector in the Y direction.
#			   detectorModel,      # Detector model, 0:mobipix; 1:pimega540D.
#              maxBuffers,         # The maximum number of NDArray buffers that the NDArrayPool for this driver is
#                                    allowed to allocate. Set this to 0 to allow an unlimited number of buffers.
#              maxMemory,          # The maximum amount of memory that the NDArrayPool for this driver is
#                                    allowed to allocate. Set this to 0 to allow an unlimited amount of memory.
#              priority,           # The thread priority for the asyn port driver thread if ASYN_CANBLOCK is set in asynFlags.
#              stackSize,          # The stack size for the asyn port driver thread if ASYN_CANBLOCK is set in asynFlags.
#              simulate            # If set to 1, simulation mode is activated
#              backendOn           # Run the IOC without connecting to the backend. Obviously, there will be no images received.
#              logFileEnable       # enable disable logging
#              BackendPort         # select the backend port for commands and status
#              BackendPortFrame    # select the backend port for frame receiving
#              IntAcqResetRDMA     # Reset the RDMA buffer before the acquisition (true -> 1 or false - > 0)

pimegaDetectorConfig("$(PORT)",$(PIMEGA_MODULE01_IP="127.0.0.1"), $(PIMEGA_MODULE02_IP="127.0.0.1"),$(PIMEGA_MODULE03_IP="127.0.0.1"),$(PIMEGA_MODULE04_IP="127.0.0.1"),$(PIMEGA_MODULE05_IP="127.0.0.1"),$(PIMEGA_MODULE06_IP="127.0.0.1"),$(PIMEGA_MODULE07_IP="127.0.0.1"),$(PIMEGA_MODULE08_IP="127.0.0.1"),$(PIMEGA_MODULE09_IP="127.0.0.1"),$(PIMEGA_MODULE10_IP="127.0.0.1"),$(PIMEGA_PORT), $(XSIZE), $(YSIZE), $(DMODEL), $(ARRAYPOOL_MAX_BUFFERS="0"), $(ARRAYPOOL_MAX_MEMORY="0"), $(ASYN_THREAD_PRIORITY="0"), $(ASYN_STACK_SIZE="0"), $(SIMULATION="0"), $(BACKEND_ON="1"),$(ENABLE_LOG="0"), $(COMMAND_PORT), $(FRAME_PORT), $(RESET_RDMA="1"))

dbLoadRecords("$(ADPIMEGA)/db/pimega.template","P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")
dbLoadRecords("$(ADPIMEGA)/db/NDFile.template","P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")

# Load asynRecord record
dbLoadRecords("$(ASYN)/db/asynRecord.db", "P=${PREFIX}, R=asyn1,PORT=$(PORT),ADDR=0,OMAX=256,IMAX=256")
asynSetTraceMask($(PORT), 0, 0x00)

< plugins.cmd
