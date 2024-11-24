//
//  Common.m
//  Tequila
//
//  Created by Samuliak on 24/11/2024.
//

#include "Common.h"

__TqlContext g_context = {NULL};

TqlObject* _Nonnull __tqlObjectAllocate(void) {
    return malloc(sizeof(TqlObject));
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
void tqlSetDefaultAppDelegateCreateCallback(PFN_defaultAppDelegateCreate _Nonnull defaultAppDelegateCreateCallback) {
    g_context.defaultAppDelegateCreateCallback = defaultAppDelegateCreateCallback;
}
