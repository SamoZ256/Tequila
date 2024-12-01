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
    settingsButton.tintColor = [UIColor systemBlueColor];
    settingsButton.backgroundColor = [UIColor blackColor];
    settingsButton.frame = CGRectMake(SETTINGS_BUTTON_OFFSET, SETTINGS_BUTTON_OFFSET, SETTINGS_BUTTON_SIZE, SETTINGS_BUTTON_SIZE);
    settingsButton.layer.cornerRadius = SETTINGS_BUTTON_SIZE / 2;
    settingsButton.clipsToBounds = YES;
    
    return settingsButton;
}
