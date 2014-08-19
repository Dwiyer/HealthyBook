//
//  AppDelegate.m
//  HealthyBook
//
//  Created by Mac mini on 14/8/1.
//  Copyright (c) 2014年 Efun. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MALTabBarItemModel.h"
#import "MALTabBarViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // Override point for customization after application launch.
    NSMutableArray *itemsArray = [[NSMutableArray alloc] init];
    NSArray *controllerArray = [NSArray arrayWithObjects:@"HomeViewController",@"InnerViewController",@"OuterViewController", @"PlaceViewController" ,nil];//类名数组
    NSArray *titleArray = [NSArray arrayWithObjects:@"第一个",@"第二个",@"第三个", @"第四个",  nil];//item标题数组
    NSArray *normalImageArray = [NSArray arrayWithObjects:@"tab_filters_enabled@2x.png",@"tab_frame_enabled@2x.png",@"tab_rotate_enabled@2x.png", @"tab_contrast_enabled@2x.png", nil];//item 正常状态下的背景图片
    NSArray *selectedImageArray = [NSArray arrayWithObjects:@"tab_filters_disabled@2x.png", @"tab_frame_disabled@2x.png",@"tab_rotate_disabled@2x.png", @"tab_contrast_disabled@2x.png",nil];//item被选中时的图片名称
    
    for (int i = 0; i< controllerArray.count; i++) {
        
        MALTabBarItemModel *itemModel = [[MALTabBarItemModel alloc] init];
        itemModel.controllerName = controllerArray[i];
        itemModel.itemTitle = titleArray[i];
        itemModel.itemImageName = normalImageArray[i];
        itemModel.selectedItemImageName = selectedImageArray[i];
        [itemsArray addObject:itemModel];
    }
    
    
    MALTabBarViewController *tabBarController = [[MALTabBarViewController alloc] initWithItemModels:itemsArray defaultSelectedIndex:1];
    [tabBarController setTabBarBgImage:@"tabbar_background_os7@2x.png"];//设置tabBar的背景图片
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
