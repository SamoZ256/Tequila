//
//  ViewController.m
//  Tequila
//
//  Created by Samuliak on 24/11/2024.
//

#include "ViewController.h"

@interface __TqlViewController ()

@end

@implementation __TqlViewController

DEFINE_INIT_WITH_OBJECT_AND_INIT(defaultViewControllerCreateCallback)

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Direct call
    [self->obj->host viewDidLoad];
    
    // HACK
    self.view.backgroundColor = [UIColor yellowColor];
}

@end
