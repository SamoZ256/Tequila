//
//  Common.h
//  Tequila
//
//  Created by Samuliak on 24/11/2024.
//

#ifndef Common_h
#define Common_h

#include "Tequila.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define DEFINE_INIT_WITH_OBJECT \
- (instancetype)initWithObject:(TqlObject* _Nonnull)obj { \
    self = [super init]; \
\
    self->obj = obj; \
    self->obj->impl = self; \
\
    return self; \
}

#define DEFINE_INIT_WITH_OBJECT_AND_INIT(defaultCreateCallback) \
DEFINE_INIT_WITH_OBJECT \
\
/* This class is always instantiated manually at least once */ \
- (instancetype)init { \
    self = [super init]; \
\
    /* Create Tequila object */ \
    self->obj = __tqlObjectAllocate(); \
    self->obj->host = g_context.defaultCreateCallback(self->obj); \
    self->obj->impl = self; \
\
    return self; \
}

typedef struct __TqlContext {
    PFN_tqlDefaultAppDelegateCreate _Nullable defaultAppDelegateCreateCallback;
    PFN_tqlDefaultViewControllerCreate _Nullable defaultViewControllerCreateCallback;
    PFN_tqlApplicationDidFinishLaunching _Nullable applicationDidFinishLaunchingCallback;
    PFN_tqlViewControllerViewDidLoad _Nullable viewControllerViewDidLoadCallback;
    PFN_tqlViewControllerLoadView _Nullable viewControllerLoadViewCallback;
} __TqlContext;

extern __TqlContext g_context;

TqlObject* _Nonnull __tqlObjectAllocate(void);

#endif /* Common_h */
