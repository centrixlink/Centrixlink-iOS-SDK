//
//  AppDelegate.m
//  CentrixlinkDemo
//
//  Created by 王俊拯 on 16/8/12.
//  Copyright © 2016年 Centrixlink. All rights reserved.
//

#import "AppDelegate.h"
#import <Centrixlink/Centrixlink.h>
#import "ViewController.h"
@interface AppDelegate ()<CentrixLinkSplashADDelegate>
{
    ViewController *vc;
}

@end

@implementation AppDelegate




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[CentrixlinkAD sharedInstance] setDebugEnable:YES];
    
    NSError *error;
    
    [[CentrixlinkAD sharedInstance] startWithAppID:@"app id" AppSecretKey:@"app key" error:nil];
    
    

    if (error) {
        NSLog(@"startWithAppID Error %@",error);
    }else {
        [[CentrixlinkAD sharedInstance] setSplashADdelegate:self];
        
        [[CentrixlinkAD sharedInstance] playSplashAD];
        
    }
    
    vc = (ViewController *) [self.window rootViewController];
    
   
    
    return YES;
}


#pragma mark - CentrixLinkSplashADDelegate

- (void)centrixlinkSplashADDidShow:(NSDictionary *)info {

}

- (void)centrixlinkSplashADClosed:(NSDictionary *)info {
    NSLog(@"%@", info);
}

- (void)centrixlinkSplashADShowFail:(NSError *)error {

}

- (void)centrixlinkSplashADSkip:(NSDictionary *)info {
    NSLog(@"%@", info);
}

- (void)centrixlinkSplashADAction:(NSDictionary *)info {
    NSLog(@"%@", info);
}




-(NSString *)logmessage{
    if(_logmessage == NULL)
    {
        _logmessage = @"";
    }
    
    return _logmessage;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
