//
//  FirstViewController.m
//  Spothauc
//
//  Created by Vanessa Anderson on 6/21/14.
//  Copyright (c) 2014 Vanessa Anderson. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
            

@end

@implementation FirstViewController 

-(IBAction)toSettings:(id)sender{
    [self performSegueWithIdentifier:@"ProfiletoSettings" sender:self];
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
