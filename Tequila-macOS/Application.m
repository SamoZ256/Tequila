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
void tqlSetDefaultViewControllerCreateCallback(PFN_tqlDefaultViewControllerCreate _Nonnull callback) {}

void tqlSetApplicationDidFinishLaunchingCallback(PFN_tqlApplicationDidFinishLaunching _Nonnull callback) {}
void tqlSetViewDidLoadCallback(PFN_tqlViewDidLoad _Nonnull callback) {}

int tqlApplicarionMain(int argc, const char* _Nonnull argv[_Nonnull]) { return 0; }
