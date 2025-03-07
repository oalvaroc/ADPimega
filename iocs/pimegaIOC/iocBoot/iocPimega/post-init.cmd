# Post IOC initialization setup
#
# Configuration parameters:
#
# $(PREFIX)
# Prefix for all records
#
# $(CALIBRATION_FILE)
# Calibration file path containing default DAC values

dbpf(${PREFIX}cam1:FilePath,"/tmp")
dbpf(${PREFIX}cam1:FileName,"test")
dbpf(${PREFIX}cam1:FileTemplate,"%s%s_%3.3d.hdf5")
dbpf(${PREFIX}cam1:dac_defaults_files, $(CALIBRATION_FILE))
dbpf(${PREFIX}cam1:ImgChipNumberID, 1)
dbpf(${PREFIX}image1:EnableCallbacks, 1)
dbpf(${PREFIX}cam1:LoadEqualization, 60)
