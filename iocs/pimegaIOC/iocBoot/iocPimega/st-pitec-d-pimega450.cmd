#!../../bin/linux-x86_64/pimegaApp

#ABOUT PIMEGA
# Prefix for all records
epicsEnvSet("PREFIX", "PIMEGA:PIMEGA135:")
# The detector model (0:mobipix; 1:pimega45D; 2:pimega135DL; 3:pimega135D; 4:pimega540D;5:pimega450D; 6:pimega450DS)
epicsEnvSet("DMODEL", "5");
# The IP address of the Pimega system
epicsEnvSet("PIMEGA_MODULE01_IP", "10.255.255.2")
epicsEnvSet("PIMEGA_MODULE02_IP", "10.255.255.3")
epicsEnvSet("PIMEGA_MODULE03_IP", "10.255.255.4")
epicsEnvSet("PIMEGA_MODULE04_IP", "10.255.255.5")
epicsEnvSet("PIMEGA_MODULE05_IP", "10.255.255.6")
epicsEnvSet("PIMEGA_MODULE06_IP", "10.255.255.7")
epicsEnvSet("PIMEGA_MODULE07_IP", "10.255.255.8")
epicsEnvSet("PIMEGA_MODULE08_IP", "10.255.255.9")
epicsEnvSet("PIMEGA_MODULE09_IP", "10.255.255.10")
epicsEnvSet("PIMEGA_MODULE10_IP", "10.255.255.11")
# The IP port for the command socket
epicsEnvSet("PIMEGA_PORT", "60000")

epicsEnvSet("FRAME_PORT", "6464")
epicsEnvSet("COMMAND_PORT", "5412")

epicsEnvSet("CALIBRATION_FILE", "/usr/local/etc/adpimega/pimega450d.ini")

#ABOUT PLUGINS
# The maximim image width; used for row profiles in the NDPluginStats plugin
epicsEnvSet("XSIZE",  "15360")
# The maximim image height; used for column profiles in the NDPluginStats plugin
epicsEnvSet("YSIZE",  "512")
# Number of Elements. Should be at least X*Y
epicsEnvSet("NELEMENTS", "7864320")

< pimega-template.cmd
