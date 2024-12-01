//
//  SettingsView.m
//  Tequila
//
//  Created by Samuliak on 01/12/2024.
//

#include "SettingsView.h"

static const uint32_t SETTINGS_BUTTON_OFFSET = 16;
static const uint32_t SETTINGS_BUTTON_SIZE = 64;

UIButton* createSettingsButton(void) {
    UIButton* settingsButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage* settingsIcon = [UIImage systemImageNamed:@"gearshape"];
    
    if (settingsIcon) {
        [settingsButton setImage:settingsIcon forState:UIControlStateNormal];
    }
    
    // TODO: make the position adjustable
    settingsButton.userInteractionEnabled = YES;
    settingsButton.tintColor = [UIColor systemBlueColor];
    settingsButton.backgroundColor = [UIColor systemBackgroundColor];
    settingsButton.frame = CGRectMake(SETTINGS_BUTTON_OFFSET, SETTINGS_BUTTON_OFFSET, SETTINGS_BUTTON_SIZE, SETTINGS_BUTTON_SIZE);
    settingsButton.layer.cornerRadius = SETTINGS_BUTTON_SIZE / 2;
    settingsButton.clipsToBounds = YES;
    
    return settingsButton;
}

@implementation __TqlSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
    
    self.view.backgroundColor = [UIColor systemBackgroundColor];

    // TODO: don't hardcode the frames
    
    // Back button
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [backButton setTitle:@"< Back" forState:UIControlStateNormal];
    backButton.frame = CGRectMake(20, 50, 100, 44);
    backButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [backButton addTarget:self action:@selector(backButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    // Settings label
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 300, 50)];
    label.text = @"Settings";
    label.font = [UIFont systemFontOfSize:24];
    [self.view addSubview:label];
}

- (void)backButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
