# MacOS_SmartCharge_Tuner

This application will provide you some control over smart charging features of the macOS. I wrote this application to overcome the slow and hard to debug algorithm of macOS optimized charge feature. Currently stop charging battery and continue charging features are implemented in order to keep battery not at full charge during learning process ( It is for the use case when you are using your MacBook always with the charge adapter plugged).

![purpose](summ_jpg.jpg)


# Disclaimer Alert

This application is developed using undocumented APIs. Although I found it is safer to use than any other third party utilities ( because this one is running in high level library rather than communicating with hardware in low level) I do not take any responsibility caused by usage of this application. Use at your own risk. 

# Platforms Tested

Currently I've tested the app on my MBP2020 with Ventura and it is working ok. I've also tested on my MBA 2014 Monterey and I noticed that it is not working on platform that doesn't support optmized battery charging feature.

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

Expected output :
```
 % ./MacOS_SmartCharge_Tuner    
2023-08-02 18:36:09.148 MacOS_SmartCharge_Tuner[16237:1060895] MacOS SmartCharge Tuner version 1.0
2023-08-02 18:36:09.232 MacOS_SmartCharge_Tuner[16237:1060895] Stop charging command sent
2023-08-02 18:36:09.233 MacOS_SmartCharge_Tuner[16237:1060895] End of application
```

```./MacOS_SmartCharge_Tuner continue``` this usage will continue battery charging

Expected output :

```
% ./MacOS_SmartCharge_Tuner continue
2023-08-02 18:36:15.745 MacOS_SmartCharge_Tuner[16243:1060964] MacOS SmartCharge Tuner version 1.0
2023-08-02 18:36:15.761 MacOS_SmartCharge_Tuner[16243:1060964] Continue charging command sent
2023-08-02 18:36:15.761 MacOS_SmartCharge_Tuner[16243:1060964] End of application
```

# My Next Project

If I get enough votes I'm planning to make a project like following :

![GUI SS](sc_gui.png)

