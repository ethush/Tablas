//
//  ViewController.h
//  Tablas
//
//  Created by Alejandra B on 18/01/15.
//  Copyright (c) 2015 Alejandra B. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import <Twitter/Twitter.h>







@interface HomeTable : UIViewController<UITableViewDelegate,UITableViewDataSource>
//buttons
//images
//labels
//table
- (IBAction)btnCompartir:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblSelectedName;
@property (weak, nonatomic) IBOutlet UITableView *tblMain;

@end

