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
@synthesize gender = _gender;
@synthesize fbUser;
@synthesize message=_message;

NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

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
    if(self.fbUser){
        [self.message setText:@"Choose a username: "];
        [self.first setHidden:YES];
        [self.last setHidden:YES];
        [self.email setHidden:YES];
        [self.gender setHidden:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) validate{
    
    return [self.email text] && [self.first text] && [self.last text] && [self.username text];
}


-(NSString *) randomStringWithLength: (int) len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length]) % [letters length]]];
    }
    
    return randomString;
}

-(IBAction)registerUser:(id)sender{
    if([self validate]){
    NSString *userName = [self.username text];
        if(self.fbUser){
            [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                if (!error) {
                    
                    [[PFUser currentUser] setPassword:[self randomStringWithLength:12]];
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
                    [[PFUser currentUser] saveEventually:^(BOOL succeeded, NSError *error) {
                        if (!succeeded){
                            NSLog(@"%@",error);
                            NSLog(@"email address is already registered, please login to link your facebook account.");
                        }
                        else{
                            NSLog(@"Successfully saved!");
                        }
                    }];
                    
                    [self performSegueWithIdentifier:@"RegtoHome" sender:self];
                }
            }];
        }
        else{
            NSString *emailAddress = [self.email text];
            NSString *firstName = [self.first text];
            NSString *lastName = [self.last text];
            
            PFUser *user = [PFUser user];
            user.username = userName;
            user.password = @"my pass";
            user.email = emailAddress;
           
                    
            [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    // Hooray! Let them use the app now.
                    [[PFUser currentUser] setObject:firstName
                                             forKey:@"firstName"];
                    
                    [[PFUser currentUser] setObject:lastName
                                             forKey:@"lastName"];
                    [[PFUser currentUser] saveEventually:^(BOOL succeeded, NSError *error) {
                        if (!succeeded){
                            NSLog(@"%@",error);
                            NSLog(@"email address is already registered, please login to link your facebook account.");
                        }

                    }];
                    [self performSegueWithIdentifier:@"RegtoHome" sender:self];
                } else {
                    NSString *errorString = [error userInfo][@"error"];
                    // Show the errorString somewhere and let the user try again.
                }
            }];

        }
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
