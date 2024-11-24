//
//  Application.m
//  Tequila
//
//  Created by Samuliak on 18/11/2024.
//

#include "Application.h"

@interface __TqlApplicationDelegate ()

@end

@implementation __TqlApplicationDelegate

- (instancetype)initWithObject:(TqlObject* _Nonnull)obj {
    self = [super init];
    
    self->obj = obj;
    self->obj->impl = self;
    
    return self;
}

// For cases when UIKit manually creates this class
- (instancetype)init {
    self = [super init];
    
    // This instance was created by UIKit, which means we need to create the Tequila object manually
    self->obj = __tqlObjectAllocate();
    self->obj->host = g_context.defaultAppDelegateCreateCallback(self->obj);
    self->obj->impl = self;
    
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession*>*)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

@end

int tqlApplicarionMain(int argc, const char* _Nonnull argv[_Nonnull]) {
    return UIApplicationMain(argc, argv, nil, NSStringFromClass([__TqlApplicationDelegate class]));
}
