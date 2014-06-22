//
//  SecondViewController.m
//  Spothauc
//
//  Created by Vanessa Anderson on 6/21/14.
//  Copyright (c) 2014 Vanessa Anderson. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
            

@end

@implementation SecondViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [FBRequestConnection startWithGraphPath:@"/me?fields=likes"
                                 parameters:nil
                                 HTTPMethod:@"GET"
                          completionHandler:^(
                                              FBRequestConnection *connection,
                                              id result,
                                              NSError *error
                                              ) {
                              NSLog(@"landed.");
                          }];
    
    FBLoginView *loginView = [[FBLoginView alloc] initWithReadPermissions:
                              @[@"public_profile", @"email", @"user_friends"]]; //@user_likes for suggested follows
    
    // Align the button in the center horizontally
    loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), 5);
    [self.view addSubview:loginView];
    
//    [[FBSession activeSession] closeAndClearTokenInformation];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
