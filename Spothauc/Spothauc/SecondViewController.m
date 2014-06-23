//
//  SecondViewController.m
//  Spothauc
//
//  Created by Vanessa Anderson on 6/21/14.
//  Copyright (c) 2014 Vanessa Anderson. All rights reserved.
//

#import "SecondViewController.h"
#import <Parse/Parse.h>
@interface SecondViewController ()
            

@end

@implementation SecondViewController

-(IBAction)facebookLink:(id)sender{
}

-(IBAction)logout:(id)sender{
    [PFUser logOut];
    //[[[UIApplication sharedApplication] delegate] window] setRootViewController:
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
