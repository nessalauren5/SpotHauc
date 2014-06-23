//
//  RegistrationViewController.h
//  Spothauc
//
//  Created by Anderson, Vanessa on 6/23/14.
//  Copyright (c) 2014 Vanessa Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationViewController : UIViewController
@property(weak,nonatomic) IBOutlet UITextField *username, *email, *first, *last;
@property BOOL fbUser;
@end
