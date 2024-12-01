//
//  ViewController.m
//  Tequila
//
//  Created by Samuliak on 24/11/2024.
//

#include "ViewController.h"
#include "View.h"
#include "SettingsView.h"

@interface __TqlViewController ()

@end

@implementation __TqlViewController {
    bool isDefault;
}

DEFINE_INIT_WITH_OBJECT_AND_INIT(defaultViewControllerCreateCallback)

- (void)loadView {
    g_context.viewControllerLoadViewCallback(self->obj);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    g_context.viewControllerViewDidLoadCallback(self->obj);
    
    self.view.userInteractionEnabled = YES;
    
    // Create the settings button
    // TODO: make this toggable
    if (self->isDefault) {
        UIButton* settingsButton = createSettingsButton();
        
        [settingsButton addTarget:self action:@selector(settingsButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:settingsButton];
    }
}

- (void)settingsButtonTapped {
    // TODO: make this a navigation view
    SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
    settingsVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:settingsVC animated:YES completion:nil];
}

@end

void tqlViewControllerCreate(TqlObject* _Nonnull obj) {
    (void)[[__TqlViewController alloc] initWithObject:obj];
}

void tqlViewControllerSetView(TqlObject* _Nonnull obj, TqlObject* _Nonnull view) {
    [obj->impl setView:view->impl];
}
