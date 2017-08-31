//
//  FeedTableViewController.h
//  instaPhoto
//
//  Created by Patrick McDonagh on 11/30/12.
//  Copyright (c) 2012 Patrick McDonagh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableViewController : UITableViewController
@property (strong,nonatomic) NSArray *imageTitleArray;
@property (strong,nonatomic) NSArray *imageFileNameArray;
@property (strong, nonatomic) NSArray *imageDetailArray;
@end
