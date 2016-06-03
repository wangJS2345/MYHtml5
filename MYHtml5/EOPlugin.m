//
//  EOPlugin.m
//  MYHtml5
//
//  Created by E2-WANGJS-M on 16/6/3.
//  Copyright © 2016年 MY. All rights reserved.
//

#import "EOPlugin.h"

@implementation EOPlugin

- (void)myMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* myarg = [command.arguments objectAtIndex:0];
    if (myarg != nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
