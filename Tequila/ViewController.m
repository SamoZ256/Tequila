//
//  ViewController.m
//  Tequila
//
//  Created by Samuliak on 24/11/2024.
//

#include "ViewController.h"
#include "View.h"

@interface __TqlViewController ()

@end

@implementation __TqlViewController

DEFINE_INIT_WITH_OBJECT_AND_INIT(defaultViewControllerCreateCallback)

- (void)loadView {
    g_context.viewControllerLoadViewCallback(self->obj);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // HACK
    self.view.layer.backgroundColor = [[UIColor redColor] CGColor];
    
    g_context.viewControllerViewDidLoadCallback(self->obj);
}

@end

void tqlViewControllerSetView(TqlObject* _Nonnull obj, TqlObject* _Nonnull view) {
    [obj->impl setView:view->impl];
}
