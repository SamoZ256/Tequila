//
//  Application.m
//  Tequila
//
//  Created by Samuliak on 18/11/2024.
//

#include "Tequila.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

int tqlApplicarionMain(int argc, const char* _Nonnull argv[_Nonnull]) {
    while (true) {}
    
    [[NSClassFromString(@"AppDelegate") alloc] init];
    
    return UIApplicationMain(argc, argv, @"UIApplication", nil);
}
