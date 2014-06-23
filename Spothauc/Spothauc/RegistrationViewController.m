//
//  RegistrationViewController.m
//  Spothauc
//
//  Created by Anderson, Vanessa on 6/23/14.
//  Copyright (c) 2014 Vanessa Anderson. All rights reserved.
//

#import "RegistrationViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <Parse/Parse.h>
@interface RegistrationViewController ()

@end

@implementation RegistrationViewController
@synthesize username = _username;
@synthesize email = _email;
@synthesize first = _first;
@synthesize last = _last;
@synthesize fbUser;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) validate{
    
    return [self.email text] && [self.first text] && [self.last text] && [self.username text];
}

-(IBAction)registerUser:(id)sender{
    NSString *userName = [self.username text];
    if([self validate] && self.fbUser){
        [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
            if (!error) {
                // Store the current user's Facebook ID on the user
                [[PFUser currentUser] setObject:[result objectForKey:@"id"]
                                         forKey:@"id"];
                [[PFUser currentUser] setObject:[result objectForKey:@"first_name"]
                                         forKey:@"firstName"];
                
                [[PFUser currentUser] setObject:[result objectForKey:@"last_name"]
                                         forKey:@"lastName"];
                
                [[PFUser currentUser] setObject:[result objectForKey:@"gender"]
                                         forKey:@"gender"];

                [[PFUser currentUser] setObject:userName forKey:@"username"];
                [[PFUser currentUser] setObject:[result objectForKey:@"email"]
                                         forKey:@"email"];
                [[PFUser currentUser] saveInBackground];
            }
        }];
    }
    else{
//        NSString *emailAddress = [self.email text];
//        NSString *firstName = [self.first text];
//        NSString *lsstName = [self.last text];
//        
//        PFUser *user = [PFUser user];
//        user.username = userName;
//        user.password = @"my pass";
//        user.email = emailAddress;
//        
//        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//            if (!error) {
//                // Hooray! Let them use the app now.
//            } else {
//                NSString *errorString = [error userInfo][@"error"];
//                // Show the errorString somewhere and let the user try again.
//            }
//        }];

    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
