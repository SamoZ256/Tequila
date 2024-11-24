//
//  Application.m
//  Tequila-macOS
//
//  Created by Samuliak on 23/11/2024.
//

// TODO: why does there need to be "../" in the path?
#include "../Tequila.h"

#import <Foundation/Foundation.h>

TqlObject* _Nonnull tqlObjectCreate(id _Nonnull host) { return NULL; }
void tqlObjectFree(TqlObject* _Nonnull obj) {}
void tqlSetDefaultAppDelegateCreateCallback(PFN_tqlDefaultAppDelegateCreate _Nonnull defaultAppDelegateCreateCallback) {}
void tqlSetApplicationDidFinishLaunchingCallback(PFN_tqlApplicationDidFinishLaunching _Nonnull callback) {}
int tqlApplicarionMain(int argc, const char* _Nonnull argv[_Nonnull]) { return 0; }
