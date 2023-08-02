//
//  main.m
//  MacOS_SmartCharge_Tuner
//
//  Created by Kivanc Gunalp on 2.08.2023.
//  Version 1.0 : Initial version
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>

#import "PowerUI_SC_Client_Experimental.h"

int send_stop_charging_command(BOOL stop, BOOL display_status){
    
    Class sc_client_class = objc_getClass("PowerUISmartChargeClient");
    if (!sc_client_class) {
        NSLog(@"[%s] main: Unable to get class", __FILE__);
        return -1;
    }
    
    id ne = [sc_client_class alloc];
    id<PowerUI_SC_Client_Experimental> sc_client = [ne performSelector:@selector(initWithClientName:) withObject:@"Kiv_Client"];
    
    if(display_status){
        NSDictionary *dict = [sc_client status];
        NSLog(@"Status : %@", [dict description]);
    }
    
    if([sc_client isOBCSupported] == false){
        NSLog(@"Optimized battery charging is not supported on this platform so application will quit now\n");
        
        return -2;
        
    }

    if(stop){
        [sc_client setChargingStatus:NO];  // stop charging
        NSLog(@"Stop charging command sent\n");
    }else{
        [sc_client setChargingStatus:YES];  // continue charging
        NSLog(@"Continue charging command sent\n");
    }
    
    return 0;
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BOOL stop_charge = YES;
        
        if(argc > 1){
            stop_charge = NO;
        }
        
        NSLog(@"MacOS SmartCharge Tuner version 1.0");
        
        void* lib_handle = dlopen("/usr/libexec/PowerUIAgent", RTLD_LOCAL);
        
        if (!lib_handle) {
            NSLog(@"[%s] main: Unable to open library: %s\n",__FILE__, dlerror());
            return -1;
        }
        
        send_stop_charging_command(stop_charge, NO);
        
        // Close the library.
        if (dlclose(lib_handle) != 0) {
            NSLog(@"[%s] Unable to close library: %s\n", __FILE__, dlerror());
        }
        
        NSLog(@"End of application\n");
        
        
    }
    return 0;
}
