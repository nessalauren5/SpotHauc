//
//  AppDelegate.h
//  Spothauc
//
//  Created by Vanessa Anderson on 6/21/14.
//  Copyright (c) 2014 Vanessa Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AmazonS3Client.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AmazonS3Client *S3;
@property (strong, nonatomic) AmazonCredentials *s3Credentials;
@end

