//
//  SettingsView.m
//  Tequila
//
//  Created by Samuliak on 01/12/2024.
//

#include "Settings.h"

#import <GameController/GameController.h>

__TqlSetings g_settings = {false, false};

static const uint32_t SETTINGS_BUTTON_POSITION = 16;
static const uint32_t SETTINGS_BUTTON_SIZE = 64;

static GCVirtualController* virtualController = nil;

UIButton* createSettingsButton(void) {
    UIButton* settingsButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage* settingsIcon = [UIImage systemImageNamed:@"gearshape"];
    
    if (settingsIcon) {
        [settingsButton setImage:settingsIcon forState:UIControlStateNormal];
    }
    
    // TODO: make the position adjustable
    settingsButton.frame = CGRectMake(SETTINGS_BUTTON_POSITION, SETTINGS_BUTTON_POSITION, SETTINGS_BUTTON_SIZE, SETTINGS_BUTTON_SIZE);
    settingsButton.tintColor = [UIColor systemBlueColor];
    settingsButton.backgroundColor = [UIColor systemBackgroundColor];
    settingsButton.layer.cornerRadius = SETTINGS_BUTTON_SIZE / 2;
    settingsButton.clipsToBounds = YES;
    
    return settingsButton;
}

static void createVirtualController(void) {
    if (virtualController)
        return;
    
    GCVirtualControllerConfiguration* config = [[GCVirtualControllerConfiguration alloc] init];
    // TODO: make the elements costumizable
    config.elements = [NSSet setWithObjects:GCInputButtonA, GCInputButtonB, GCInputButtonX, GCInputButtonY, GCInputLeftThumbstick, GCInputRightThumbstick, GCInputLeftShoulder, GCInputRightShoulder, GCInputLeftTrigger, GCInputRightTrigger, nil];
    
    virtualController = [[GCVirtualController alloc] initWithConfiguration:config];
}

@implementation __TqlSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
    
    self.view.backgroundColor = [UIColor systemBackgroundColor];

    // TODO: don't hardcode the frames
    
    // Back button
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.translatesAutoresizingMaskIntoConstraints = NO;
    [backButton setTitle:@"< Back" forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [backButton addTarget:self action:@selector(backButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    // Settings label
    UILabel* label = [[UILabel alloc] init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = @"Settings";
    label.font = [UIFont systemFontOfSize:24];
    [self.view addSubview:label];
    
    // Lock pointer on hide
    
    // Label
    UILabel* lockPointerOnHideLabel = [[UILabel alloc] init];
    lockPointerOnHideLabel.translatesAutoresizingMaskIntoConstraints = NO;
    lockPointerOnHideLabel.text = @"Lock pointer when cursor is hidden";
    [self.view addSubview:lockPointerOnHideLabel];
    
    // Switch
    UISwitch* lockPointerOnHideSwitch = [[UISwitch alloc] init];
    lockPointerOnHideSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:lockPointerOnHideSwitch];
    lockPointerOnHideSwitch.on = g_settings.lockPointerOnHide;
    
    [lockPointerOnHideSwitch addTarget:self action:@selector(lockPointerOnHideChanged:) forControlEvents:UIControlEventValueChanged];
    [self lockPointerOnHideChanged:lockPointerOnHideSwitch];
    
    // Virtual controller
    
    // Label
    UILabel* virtualControllerLabel = [[UILabel alloc] init];
    virtualControllerLabel.translatesAutoresizingMaskIntoConstraints = NO;
    virtualControllerLabel.text = @"Display on-screen controller";
    [self.view addSubview:virtualControllerLabel];
    
    // Switch
    UISwitch* virtualControllerSwitch = [[UISwitch alloc] init];
    virtualControllerSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:virtualControllerSwitch];
    virtualControllerSwitch.on = g_settings.virtualPointerEnabled;
    
    [virtualControllerSwitch addTarget:self action:@selector(virtualPointerChanged:) forControlEvents:UIControlEventValueChanged];
    [self virtualPointerChanged:virtualControllerSwitch];
    
    // Set up Auto Layout constraints
    [NSLayoutConstraint activateConstraints:@[
        // Back button
        [backButton.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
        [backButton.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:10],
        
        // Settings label
        [label.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
        [label.centerYAnchor constraintEqualToAnchor:backButton.bottomAnchor constant:20],
        
        // Lock pointer on hide
        
        // Label
        [lockPointerOnHideLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
        [lockPointerOnHideLabel.centerYAnchor constraintEqualToAnchor:lockPointerOnHideSwitch.centerYAnchor],
        
        // Switch
        [lockPointerOnHideSwitch.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20],
        [lockPointerOnHideSwitch.topAnchor constraintEqualToAnchor:label.bottomAnchor constant:20],
        
        // Virtual controller
        
        // Label
        [virtualControllerLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20],
        [virtualControllerLabel.centerYAnchor constraintEqualToAnchor:virtualControllerSwitch.centerYAnchor],
        
        // Switch
        [virtualControllerSwitch.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20],
        [virtualControllerSwitch.topAnchor constraintEqualToAnchor:lockPointerOnHideSwitch.bottomAnchor constant:20],
    ]];
}

- (void)backButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)lockPointerOnHideChanged:(UISwitch*)sender {
    g_settings.lockPointerOnHide = sender.isOn;
}

- (void)virtualPointerChanged:(UISwitch*)sender {
    g_settings.virtualPointerEnabled = sender.isOn;
    
    if (g_settings.virtualPointerEnabled) {
        createVirtualController();
        
        [virtualController connectWithReplyHandler:^(NSError* error) {
            if (error)
                NSLog(@"%@", error.localizedDescription);
        }];
    } else {
        [virtualController disconnect];
    }
}

@end
