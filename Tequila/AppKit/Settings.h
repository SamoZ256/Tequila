//
//  SettingsView.h
//  Tequila
//
//  Created by Samuliak on 01/12/2024.
//

#ifndef SettingsView_h
#define SettingsView_h

#include "Common.h"

typedef struct __TqlSetings {
    bool lockPointerOnHide;
    bool virtualPointerEnabled;
} __TqlSetings;

extern __TqlSetings g_settings;

UIButton* createSettingsButton(void);

@interface __TqlSettingsViewController : UIViewController

@end

#endif /* SettingsView_h */
