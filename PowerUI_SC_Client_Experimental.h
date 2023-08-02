//
//  PowerUI_SC_Client_Experimental.h
//  MacOS_SmartCharge_Controller
//
//  Created by Kivanc Gunalp on 2.08.2023.
//

#import <Foundation/Foundation.h>

@protocol PowerUI_SC_Client_Experimental <NSObject>

-(BOOL)isOBCSupported;
-(id)status;
-(BOOL)setDesktopMode:(NSString*)arg;
-(BOOL)setChargingStatus:(BOOL)arg; 

@end

