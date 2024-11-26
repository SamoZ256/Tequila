//
//  Tequila.h
//  Tequila
//
//  Created by Samuliak on 23/11/2024.
//

#import <QuartzCore/QuartzCore.h>

typedef struct TqlObject {
    id _Nullable host;
    id _Nullable impl;
} TqlObject;

TqlObject* _Nonnull tqlObjectCreate(id _Nonnull host);
void tqlObjectFree(TqlObject* _Nonnull obj);

// Callbacks

// Default create
typedef id _Nonnull (*PFN_tqlDefaultAppDelegateCreate)(TqlObject* _Nonnull obj);
typedef id _Nonnull (*PFN_tqlDefaultViewControllerCreate)(TqlObject* _Nonnull obj);

void tqlSetDefaultAppDelegateCreateCallback(PFN_tqlDefaultAppDelegateCreate _Nonnull callback);
void tqlSetDefaultViewControllerCreateCallback(PFN_tqlDefaultViewControllerCreate _Nonnull callback);

// Methods

// Application
typedef void (*PFN_tqlApplicationDidFinishLaunching)(TqlObject* _Nonnull obj); // TODO: include options as a parameter

void tqlSetApplicationDidFinishLaunchingCallback(PFN_tqlApplicationDidFinishLaunching _Nonnull callback);

// View controller
typedef void (*PFN_tqlViewControllerViewDidLoad)(TqlObject* _Nonnull obj);
typedef void (*PFN_tqlViewControllerLoadView)(TqlObject* _Nonnull obj);

void tqlSetViewControllerViewDidLoadCallback(PFN_tqlViewControllerViewDidLoad _Nonnull callback);
void tqlSetViewControllerLoadViewCallback(PFN_tqlViewControllerLoadView _Nonnull callback);

// View
typedef Class _Nonnull (*PFN_tqlViewGetLayerClass)(TqlObject* _Nonnull obj);

void tqlSetViewGetLayerClassCallback(PFN_tqlViewGetLayerClass _Nonnull callback);

// API

// Application
int tqlApplicarionMain(int argc, const char* _Nonnull argv[_Nonnull]);

// View controller
void tqlViewControllerCreate(TqlObject* _Nonnull obj);
void tqlViewControllerSetView(TqlObject* _Nonnull obj, TqlObject* _Nonnull view);

// View
void tqlViewCreate(TqlObject* _Nonnull obj, CGRect frame);
CALayer* _Nonnull tqlViewGetLayer(TqlObject* _Nonnull obj);
void tqlViewSetLayer(TqlObject* _Nonnull obj, CALayer* _Nonnull layer);

// Color
void tqlColorYellowCreate(TqlObject* _Nonnull obj);
CGColorRef _Nonnull tqlColorCGColor(TqlObject* _Nonnull obj);
