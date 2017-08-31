//
//  AppDelegate.m
//  instaPhoto
//
//  Created by Patrick McDonagh on 11/29/12.
//  Copyright (c) 2012 Patrick McDonagh. All rights reserved.
//

#import "AppDelegate.h"
#import "FeedTableViewController.h"
#import "ProfileViewController.h"
#import "FavoritesViewController.h"
#import "AlarmTableViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    FeedTableViewController *feedTableViewController = [[FeedTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    FavoritesViewController *favoritesViewController = [[FavoritesViewController alloc] init];
    ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
    AlarmTableViewController *alarmTableViewController = [[AlarmTableViewController alloc] init];

    
//Tabbed and Stacked Navigation
    UINavigationController *profileNavController = [[UINavigationController alloc] initWithRootViewController:profileViewController];
    UINavigationController *feedNavController = [[UINavigationController alloc] initWithRootViewController:feedTableViewController];
    UINavigationController  *favoritesNavController = [[UINavigationController alloc] initWithRootViewController:favoritesViewController];
    UINavigationController  *alarmNavController = [[UINavigationController alloc] initWithRootViewController:alarmTableViewController];
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
// for tabbed interface, uncomment these lines:
    
    //UITabBarController *tabBarController = [[UITabBarController alloc] init];
    //[tabBarController setViewControllers:@[feedViewController, favoritesViewController, profileViewController]];
    
    
// for stacked navigation, uncomment these lines:
    //UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:feedViewController];
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [tabBarController setViewControllers:@[alarmNavController, feedNavController, favoritesNavController,profileNavController]];
    //self.window.rootViewController = tabBarController;
    //self.window.rootViewController = navController;
    self.window.rootViewController = tabBarController;
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
							


@end
