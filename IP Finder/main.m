//
//  main.m
//  IP Finder
//
//  Created by Vaughn, Jack on 1/16/15.
//  Copyright (c) 2015 RCSNC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[]) {
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
