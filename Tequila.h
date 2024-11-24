//
//  Tequila.h
//  Tequila
//
//  Created by Samuliak on 23/11/2024.
//

typedef struct TqlObject {
    id _Nonnull host;
    id _Nonnull impl;
} TqlObject;

TqlObject* _Nonnull tqlObjectCreate(id _Nonnull host);
void tqlObjectFree(TqlObject* _Nonnull obj);

// Callbacks
typedef id _Nonnull (*PFN_defaultAppDelegateCreate)(TqlObject* _Nonnull object);

void tqlSetDefaultAppDelegateCreateCallback(PFN_defaultAppDelegateCreate _Nonnull defaultAppDelegateCreateCallback);

// Application
extern int tqlApplicarionMain(int argc, const char* _Nonnull argv[_Nonnull]);
