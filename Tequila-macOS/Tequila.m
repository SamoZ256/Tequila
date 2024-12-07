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

// -------- Callbacks --------

// Default create
void tqlSetDefaultAppDelegateCreateCallback(PFN_tqlDefaultAppDelegateCreate _Nonnull callback) {}
void tqlSetDefaultViewControllerCreateCallback(PFN_tqlDefaultViewControllerCreate _Nonnull callback) {}

// Methods

// Application
void tqlSetAppDelegateApplicationDidFinishLaunchingCallback(PFN_tqlAppDelegateApplicationDidFinishLaunching _Nonnull callback) {}

// View controller
void tqlSetViewControllerViewDidLoadCallback(PFN_tqlViewControllerViewDidLoad _Nonnull callback) {}
void tqlSetViewControllerLoadViewCallback(PFN_tqlViewControllerLoadView _Nonnull callback) {}

// View
void tqlSetViewGetLayerClassCallback(PFN_tqlViewGetLayerClass _Nonnull callback) {}

// -------- AppKit --------

// Application
void tqlApplicationCreateShared(TqlObject* _Nonnull obj) {}
int tqlApplicationMain(int argc, const char* _Nonnull argv[_Nonnull]) { return 0; }

// View controller
void tqlViewControllerCreate(TqlObject* _Nonnull obj) {}
void tqlViewControllerSetView(TqlObject* _Nonnull obj, TqlObject* _Nonnull view) {}

// View
void tqlViewCreate(TqlObject* _Nonnull obj, CGRect frame) {}
CALayer* _Nonnull tqlViewGetLayer(TqlObject* _Nonnull obj) { return nil; }
void tqlViewSetLayer(TqlObject* _Nonnull obj, CALayer* _Nonnull layer) {}
CGRect tqlViewGetFrame(TqlObject* _Nonnull obj) { return CGRectMake(0, 0, 0, 0); }
void tqlViewSetFrame(TqlObject* _Nonnull obj, CGRect frame) {}

// Cursor
void tqlCursorHide(void) {}
void tqlCursorUnhide(void) {}

// Color
void tqlColorCreateBlack(TqlObject* _Nonnull obj) {}
void tqlColorCreateDarkGray(TqlObject* _Nonnull obj) {}
void tqlColorCreateLightGray(TqlObject* _Nonnull obj) {}
void tqlColorCreateWhite(TqlObject* _Nonnull obj) {}
void tqlColorCreateGray(TqlObject* _Nonnull obj) {}
void tqlColorCreateRed(TqlObject* _Nonnull obj) {}
void tqlColorCreateGreen(TqlObject* _Nonnull obj) {}
void tqlColorCreateBlue(TqlObject* _Nonnull obj) {}
void tqlColorCreateCyan(TqlObject* _Nonnull obj) {}
void tqlColorCreateYellow(TqlObject* _Nonnull obj) {}
void tqlColorCreateMagenta(TqlObject* _Nonnull obj) {}
void tqlColorCreateOrange(TqlObject* _Nonnull obj) {}
void tqlColorCreatePurple(TqlObject* _Nonnull obj) {}
void tqlColorCreateBrown(TqlObject* _Nonnull obj) {}
void tqlColorCreateClear(TqlObject* _Nonnull obj) {}
CGColorRef _Nonnull tqlColorCGColor(TqlObject* _Nonnull obj) { return NULL; }
