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
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication*)application didDiscardSceneSessions:(NSSet<UISceneSession*>*)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

@end

int tqlApplicationMain(int argc, const char* _Nonnull argv[_Nonnull]) {
    return UIApplicationMain(argc, argv, nil, NSStringFromClass([__TqlApplicationDelegate class]));
}
