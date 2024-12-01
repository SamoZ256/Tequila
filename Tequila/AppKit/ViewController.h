//
//  ViewController.h
//  Tequila
//
//  Created by Samuliak on 24/11/2024.
//

#ifndef ViewController_h
#define ViewController_h

#include "Common.h"

@interface __TqlViewController : UIViewController {
    TqlObject* _Nonnull obj;
}

@end

extern __TqlViewController* _Nonnull __tqlMainViewController;
extern bool __tqlPrefersPointerLocked;

#endif /* ViewController_h */
