//
//  Tequila.h
//  Tequila
//
//  Created by Samuliak on 23/11/2024.
//

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
typedef void (*PFN_tqlViewDidLoad)(TqlObject* _Nonnull obj);

void tqlSetViewDidLoadCallback(PFN_tqlViewDidLoad _Nonnull callback);

// API

// Application
extern int tqlApplicarionMain(int argc, const char* _Nonnull argv[_Nonnull]);
