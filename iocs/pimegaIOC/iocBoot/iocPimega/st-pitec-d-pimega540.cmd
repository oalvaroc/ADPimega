#!../../bin/linux-x86_64/pimegaApp

#ABOUT PIMEGA
# Prefix for all records
epicsEnvSet("PREFIX", "PIMEGA:PIMEGA135:")
# The detector model (0:mobipix; 1:pimega45D; 2:pimega135DL; 3:pimega135D; 4:pimega540D;5:pimega450D; 6:pimega450DS)
epicsEnvSet("DMODEL", "4");
# The IP address of the Pimega system
epicsEnvSet("PIMEGA_MODULE01_IP", "10.255.255.2")
epicsEnvSet("PIMEGA_MODULE02_IP", "10.255.255.6")
epicsEnvSet("PIMEGA_MODULE03_IP", "10.255.255.10")
epicsEnvSet("PIMEGA_MODULE04_IP", "10.255.255.14")
# The IP port for the command socket
epicsEnvSet("PIMEGA_PORT", "60000")

epicsEnvSet("FRAME_PORT", "6464")
epicsEnvSet("COMMAND_PORT", "5412")

epicsEnvSet("CALIBRATION_FILE", "/usr/local/etc/adpimega/pimega540d.ini")

#ABOUT PLUGINS
# The maximim image width; used for row profiles in the NDPluginStats plugin
epicsEnvSet("XSIZE",  "3072")
# The maximim image height; used for column profiles in the NDPluginStats plugin
epicsEnvSet("YSIZE",  "3072")
# Number of Elements. Should be at least X*Y
epicsEnvSet("NELEMENTS", "9437184")

< pimega-template.cmd
