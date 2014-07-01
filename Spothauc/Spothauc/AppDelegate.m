//
//  AppDelegate.m
//  Spothauc
//
//  Created by Vanessa Anderson on 6/21/14.
//  Copyright (c) 2014 Vanessa Anderson. All rights reserved.
//

#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>
#import <Parse/Parse.h>


@interface AppDelegate ()
            

@end

@implementation AppDelegate
@synthesize S3=_S3;
@synthesize s3Credentials = _s3Credentials;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Parse setApplicationId:@"wwg1wbzl8p5kAE85I4mxz2QsRVbVIShcrgzVpl1z"
                  clientKey:@"wJMNp4AJiwUeLUc5djDG6IDkhfO8ah506ow699Kd"];
    
    [PFFacebookUtils initializeFacebook];
    
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|
     UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound];
    
    self.S3 = [[AmazonS3Client alloc] initWithAccessKey:@"AKIAJXQVA2XJ2536FH4Q"
                                                     withSecretKey:@"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"];
    self.s3Credentials =  [[AmazonCredentials alloc] initWithAccessKey:@"AKIAJXQVA2XJ2536FH4Q" withSecretKey:@"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"];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
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

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}

@end
