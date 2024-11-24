//
//  Common.m
//  Tequila
//
//  Created by Samuliak on 24/11/2024.
//

#include "Common.h"

__TqlContext g_context = {NULL, NULL, NULL};

TqlObject* _Nonnull __tqlObjectAllocate(void) {
    TqlObject* obj = malloc(sizeof(TqlObject));
    obj->host = NULL;
    obj->impl = NULL;
    
    return obj;
}

TqlObject* _Nonnull tqlObjectCreate(id _Nonnull host) {
    TqlObject* obj = __tqlObjectAllocate();
    obj->host = host;
    
    return obj;
}

void tqlObjectFree(TqlObject* _Nonnull obj) {
    free(obj);
}

// Callbacks

// Default create
void tqlSetDefaultAppDelegateCreateCallback(PFN_tqlDefaultAppDelegateCreate _Nonnull callback) {
    g_context.defaultAppDelegateCreateCallback = callback;
}

void tqlSetDefaultViewControllerCreateCallback(PFN_tqlDefaultViewControllerCreate _Nonnull callback) {
    g_context.defaultViewControllerCreateCallback = callback;
}

// Methods
void tqlSetApplicationDidFinishLaunchingCallback(PFN_tqlApplicationDidFinishLaunching _Nonnull callback) {
    g_context.applicationDidFinishLaunchingCallback = callback;
}
