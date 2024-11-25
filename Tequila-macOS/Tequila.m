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

// Callbacks

// Default create
void tqlSetDefaultAppDelegateCreateCallback(PFN_tqlDefaultAppDelegateCreate _Nonnull callback) {}
void tqlSetDefaultViewControllerCreateCallback(PFN_tqlDefaultViewControllerCreate _Nonnull callback) {}

// Methods

// Application
void tqlSetApplicationDidFinishLaunchingCallback(PFN_tqlApplicationDidFinishLaunching _Nonnull callback) {}

// View controller
void tqlSetViewDidLoadCallback(PFN_tqlViewDidLoad _Nonnull callback) {}

// API

// Application
int tqlApplicarionMain(int argc, const char* _Nonnull argv[_Nonnull]) { return 0; }

// Color
void tqlColorYellowCreate(TqlObject* _Nonnull obj) {}
