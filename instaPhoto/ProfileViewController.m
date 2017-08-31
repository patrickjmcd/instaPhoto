//
//  ProfileViewController.m
//  instaPhoto
//
//  Created by Patrick McDonagh on 11/29/12.
//  Copyright (c) 2012 Patrick McDonagh. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIImageView+AFNetworking.h"
#import "AFJSONRequestOperation.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Profile";
        self.tabBarItem.image = [UIImage imageNamed:@"man"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.contentSize = CGSizeMake(320,560);
    
    //UIImageView *patrickView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"patrick.jpg"]];
    //patrickView.frame = CGRectMake(20,20,100,140);
    //[self.scrollView addSubview:patrickView];
    
    UIImageView *profileImageView = [[UIImageView alloc] init];
    profileImageView.frame = CGRectMake(20, 20, 100, 114);
    
    UIImage *placeholder = [UIImage imageNamed: @"placeholder"];
    NSURL *imageURL = [NSURL URLWithString:@"https://fbcdn-sphotos-f-a.akamaihd.net/hphotos-ak-snc6/169645_3400231887093_728988727_o.jpg"];
    [profileImageView setImageWithURL:imageURL placeholderImage:placeholder];
    [self.scrollView addSubview:profileImageView];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://localhost:3000/events/1.json"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        self.userProfile = JSON;
        [self requestSuccessful];
        NSLog(@"JSON request successful");
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"NSError: %@",error.localizedDescription);
        
    }];
    
    [operation start];
    
    
    
    
    UILabel *nameLabelPJM = [[UILabel alloc] initWithFrame:CGRectMake(20, 140, 280, 40)];
    nameLabelPJM.text = self.userProfile[@"sourcename"];
    [self.scrollView addSubview:nameLabelPJM];
    
    UILabel *cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 180, 280, 40)];
    cityLabel.text = @"From: Dallas, TX";
    [self.scrollView addSubview:cityLabel];
    
    UITextView *biography = [[UITextView alloc] initWithFrame:CGRectMake(12, 220, 300, 180)];
    biography.text = @"Patrick McDonagh is an awesome guy. He is so awesome that it is actually quite difficult to describe his awesomeness. If you try to describe his awesomeness, I'm sure you would fail, but he really wouldn’t mind you trying!";
    biography.editable = NO;
    [self.scrollView addSubview:biography];
    
    UILabel *memberSinceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 410, 280, 40)];
    memberSinceLabel.text = @"November 2012";
    [self.scrollView addSubview:memberSinceLabel];
    
    UILabel *twitterNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 450, 280, 40)];
    twitterNameLabel.text = @"@PatrickJMcD";
    [self.scrollView addSubview:twitterNameLabel];
    
    
    [self.view addSubview:self.scrollView];
    
    
    
    
            
}
- (void)requestSuccessful {
    UIImageView *profileImageView = [[UIImageView alloc] init];
    profileImageView.frame = CGRectMake(20, 20, 100, 114);
    [profileImageView setImageWithURL:[NSURL URLWithString:self.userProfile[@"profilePhoto"]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    UILabel *nameLabel =[[UILabel alloc] init];
    nameLabel.frame = CGRectMake(20, 140, 280, 40);
    nameLabel.text =[NSString stringWithFormat:@"Name: %@ %@", self.userProfile[@"firstName"], self.userProfile[@"lastName"]];
    
     
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
