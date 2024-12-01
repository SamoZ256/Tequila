//
//  SettingsView.m
//  Tequila
//
//  Created by Samuliak on 01/12/2024.
//

#include "Settings.h"

#import <GameController/GameController.h>

__TqlSetings g_settings = {false, false};

static const uint32_t SETTINGS_BUTTON_OFFSET = 16;
static const uint32_t SETTINGS_BUTTON_SIZE = 64;

static GCVirtualController* virtualController = nil;

UIButton* createSettingsButton(void) {
    UIButton* settingsButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage* settingsIcon = [UIImage systemImageNamed:@"gearshape"];
    
    if (settingsIcon) {
        [settingsButton setImage:settingsIcon forState:UIControlStateNormal];
    }
    
    // TODO: make the position adjustable
    settingsButton.tintColor = [UIColor systemBlueColor];
    settingsButton.backgroundColor = [UIColor systemBackgroundColor];
    settingsButton.frame = CGRectMake(SETTINGS_BUTTON_OFFSET, SETTINGS_BUTTON_OFFSET, SETTINGS_BUTTON_SIZE, SETTINGS_BUTTON_SIZE);
    settingsButton.layer.cornerRadius = SETTINGS_BUTTON_SIZE / 2;
    settingsButton.clipsToBounds = YES;
    
    return settingsButton;
}

static void createVirtualController(void) {
    if (virtualController)
        return;
    
    GCVirtualControllerConfiguration* config = [[GCVirtualControllerConfiguration alloc] init];
    // TODO: make the elements costumizable
    config.elements = [NSSet setWithObjects:GCInputButtonA, GCInputButtonB, GCInputButtonX, GCInputButtonY, GCInputLeftThumbstick, GCInputRightThumbstick, GCInputLeftShoulder, GCInputRightShoulder, nil];
    
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
    
    // Lock pointer on hide switch
    UILabel* lockPointerOnHideLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 400, 30)];
    lockPointerOnHideLabel.text = @"Lock pointer when cursor is hidden";
    [self.view addSubview:lockPointerOnHideLabel];
    
    UISwitch* lockPointerOnHideSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(1100, 150, 0, 0)];
    [self.view addSubview:lockPointerOnHideSwitch];
    lockPointerOnHideSwitch.on = g_settings.lockPointerOnHide;
    
    [lockPointerOnHideSwitch addTarget:self action:@selector(lockPointerOnHideChanged:) forControlEvents:UIControlEventValueChanged];
    [self lockPointerOnHideChanged:lockPointerOnHideSwitch];
    
    // Virtual controller
    UILabel* virtualControllerLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 400, 30)];
    virtualControllerLabel.text = @"Display on-screen controller";
    [self.view addSubview:virtualControllerLabel];
    
    UISwitch* virtualControllerSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(1100, 200, 0, 0)];
    [self.view addSubview:virtualControllerSwitch];
    virtualControllerSwitch.on = g_settings.virtualPointerEnabled;
    
    [virtualControllerSwitch addTarget:self action:@selector(virtualPointerChanged:) forControlEvents:UIControlEventValueChanged];
    [self virtualPointerChanged:virtualControllerSwitch];
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
