//
//  LoginViewController.m
//  Spothauc
//
//  Created by Anderson, Vanessa on 6/23/14.
//  Copyright (c) 2014 Vanessa Anderson. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "RegistrationViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize fbLogin;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)facebookRegistration:(id)sender{

    
    [PFFacebookUtils logInWithPermissions:@[@"public_profile",@"email",@"user_friends"] block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            self.fbLogin = YES;
            [self performSegueWithIdentifier:@"LogintoRegistration" sender:self];
        }
        else{
            NSLog(@"Existing User trying to log in through Facebook!");
            if (![PFFacebookUtils isLinkedWithUser:user]) {
                [PFFacebookUtils linkUser:user permissions:nil block:^(BOOL succeeded, NSError *error) {
                    if (succeeded) {
                        NSLog(@"Woohoo, user logged in with Facebook!");
                        [self performSegueWithIdentifier:@"LogintoHome" sender:self];
                    }
                }];
            }
            else{
                NSLog(@"Existing user was logged in!");
                [self performSegueWithIdentifier:@"LogintoHome" sender:self];
            }

        }
    }];

}

-(IBAction)emailRegistration:(id)sender{
    [self performSegueWithIdentifier:@"LogintoRegistration" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"LogintoRegistration"]) {
        RegistrationViewController* rVC = [segue destinationViewController];
        rVC.fbUser = self.fbLogin;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        NSLog(@"Cached user was logged in!");
        [self performSegueWithIdentifier:@"LogintoHome" sender:self];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
