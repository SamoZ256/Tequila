//
//  Application.m
//  Tequila
//
//  Created by Samuliak on 18/11/2024.
//

#include "Application.h"

@interface __TqlApplicationDelegate ()

@end

// TODO: save settings to file on exit
@implementation __TqlApplicationDelegate {
    bool isDefault;
}

DEFINE_INIT_WITH_OBJECT_AND_INIT(defaultAppDelegateCreateCallback)

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
    // TODO: load settings from file
    
    g_context.appDelegateApplicationDidFinishLaunchingCallback(self->obj);
    
    return YES;
}

- (UISceneConfiguration*)application:(UIApplication*)application configurationForConnectingSceneSession:(UISceneSession*)connectingSceneSession options:(UISceneConnectionOptions*)options {
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication*)application didDiscardSceneSessions:(NSSet<UISceneSession*>*)sceneSessions {
}

@end

void tqlApplicationCreateShared(TqlObject* _Nonnull obj) {
    obj->impl = [UIApplication sharedApplication];
}

int tqlApplicationMain(int argc, const char* _Nonnull argv[_Nonnull]) {
    return UIApplicationMain(argc, argv, nil, NSStringFromClass([__TqlApplicationDelegate class]));
}
