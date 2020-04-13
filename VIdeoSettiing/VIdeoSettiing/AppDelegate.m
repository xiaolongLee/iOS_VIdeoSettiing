//
//  AppDelegate.m
//  VIdeoSettiing
//
//  Created by 李小龙 on 2020/4/13.
//  Copyright © 2020 李小龙. All rights reserved.
//

#import "AppDelegate.h"
#import "CQVideoSettingViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    CQVideoSettingViewController *vc = [CQVideoSettingViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController  = nav;
    return YES;
}






@end
