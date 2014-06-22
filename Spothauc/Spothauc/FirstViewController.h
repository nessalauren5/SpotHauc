//
//  FirstViewController.h
//  Spothauc
//
//  Created by Vanessa Anderson on 6/21/14.
//  Copyright (c) 2014 Vanessa Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
@interface FirstViewController : UIViewController<FBLoginViewDelegate>
@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@end

