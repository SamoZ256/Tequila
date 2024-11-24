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

typedef struct __TqlContext {
    PFN_defaultAppDelegateCreate _Nullable defaultAppDelegateCreateCallback;
} __TqlContext;

extern __TqlContext g_context;

TqlObject* _Nonnull __tqlObjectAllocate(void);

#endif /* Common_h */
