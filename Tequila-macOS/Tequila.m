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
void tqlSetViewControllerViewDidLoadCallback(PFN_tqlViewControllerViewDidLoad _Nonnull callback) {}
void tqlSetViewControllerLoadViewCallback(PFN_tqlViewControllerLoadView _Nonnull callback) {}

// View
void tqlSetViewGetLayerClassCallback(PFN_tqlViewGetLayerClass _Nonnull callback) {}

// API

// Application
int tqlApplicarionMain(int argc, const char* _Nonnull argv[_Nonnull]) { return 0; }

// View controller
void tqlViewControllerCreate(TqlObject* _Nonnull obj) {}
void tqlViewControllerSetView(TqlObject* _Nonnull obj, TqlObject* _Nonnull view) {}

// View
void tqlViewCreate(TqlObject* _Nonnull obj, CGRect frame) {}
CALayer* _Nonnull tqlViewGetLayer(TqlObject* _Nonnull obj) { return nil; }
void tqlViewSetLayer(TqlObject* _Nonnull obj, CALayer* _Nonnull layer) {}

// Color
void tqlColorYellowCreate(TqlObject* _Nonnull obj) {}
CGColorRef _Nonnull tqlColorCGColor(TqlObject* _Nonnull obj) { return NULL; }
