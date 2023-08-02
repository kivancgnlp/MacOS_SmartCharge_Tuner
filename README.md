# MacOS_SmartCharge_Tuner
MacOS SmartChargeController Fine Tuning Client

# Disclaimer Alert

This application is developed using undocumented APIs. Although I found it is safer to use than any other third party utilities ( because this one is running in high level library rather than communicating with hardware in low level) I do not take any responsibility caused by usage of this application. Use at your own risk. 

# Compiling
After downloading the sources, open a terminal in the download folder and just type make for compilation. 

Note : Xcode or Xcode command line utilities is required for compilation.

# Running
Executing the program without arguments will stop battery charging and you do not need to disable optimized charging features. This state will be preserved until next restart or using the command with some argument like `continue`.

No special permission is required to run the application.

Executing the program with an argument will continue charging.

# Examples
 
 ## Compiling :

 After downloading the repository (or you can use git clone) type make in the directory where sources reside.

Output should look like following
 ```
MacOS_SmartCharge_Tuner % make
cc -fobjc-arc    MacOS_SmartCharge_Tuner.m   -o MacOS_SmartCharge_Tuner


 ```


## Running 

```./MacOS_SmartCharge_Tuner``` this usage will stop battery charging

```./MacOS_SmartCharge_Tuner continue``` this usage will continue battery charging
