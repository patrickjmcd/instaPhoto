//
//  FavoritesViewController.m
//  instaPhoto
//
//  Created by Patrick McDonagh on 11/29/12.
//  Copyright (c) 2012 Patrick McDonagh. All rights reserved.
//

#import "FavoritesViewController.h"
#import "ProfileViewController.h"

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Favorites";
        self.tabBarItem.image = [UIImage imageNamed:@"star"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor redColor];
    
    //UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"patrick.jpg"]];
    //[logoView setContentMode:UIViewContentModeScaleAspectFit];
    //logoView.frame =CGRectMake(10, 10, 100, 140);
    //[self.view addSubview:logoView];
    
    UIButton *picZoomView = [UIButton buttonWithType:UIButtonTypeCustom];
    [picZoomView setImage:[UIImage imageNamed:@"patrick.jpg"] forState:UIControlStateNormal];
    [picZoomView setImage:[UIImage imageNamed:@"patrick.jpg"] forState:UIControlStateHighlighted];
    [picZoomView setFrame:CGRectMake(10, 10, 100, 140)];
    [self.view addSubview:picZoomView];
    [picZoomView addTarget:self action:@selector(showZoomedPicture:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    UIButton *profileButton= [UIButton buttonWithType:UIButtonTypeRoundedRect];
    profileButton.frame = CGRectMake(60, 300, 200, 44);
    [profileButton setTitle:@"View Profile" forState:UIControlStateNormal];
    [self.view addSubview:profileButton];
    [profileButton addTarget:self action:@selector(showProfile:) forControlEvents:UIControlEventTouchUpInside];
    
    

}

- (void)showZoomedPicture:(UIButton *)sender
{
    UIViewController *zoomedPicViewController = [[UIViewController alloc] init];
    zoomedPicViewController.view.frame = self.view.frame;
    zoomedPicViewController.title = @"Patrick and the Trophy";
    
    UIImageView *zoomedPicView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"patrick.jpg"]];
    [zoomedPicView setContentMode:UIViewContentModeScaleAspectFit];
    
    zoomedPicView.frame = zoomedPicViewController.view.frame;
    [zoomedPicViewController.view addSubview:zoomedPicView];
    
    [self.navigationController pushViewController:zoomedPicViewController animated:YES];
    
}


-(void)showProfile:(UIButton *)sender
{
    ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
    [self.navigationController pushViewController:profileViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
