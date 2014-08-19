//
//  MainViewController.m
//  HealthyBook
//
//  Created by Mac mini on 14/8/1.
//  Copyright (c) 2014年 Efun. All rights reserved.
//

#import "MainViewController.h"
#import "RKTabView/RKTabView.h"
#import "HomeViewController.h"

@interface MainViewController () <RKTabViewDelegate>

//@property (nonatomic, strong)RKTabView *standardView;
@property (weak, nonatomic) IBOutlet RKTabView *standardView;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Standard items example";
    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blurred_background.png"]];
//    UIWindow *keyWindow = [UIApplication sharedApplication].windows[0];
//    imageView.frame = keyWindow.bounds;
//    [keyWindow insertSubview:imageView atIndex:0];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blurred_background.png"]];
    
    RKTabItem *filtersTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"tab_filters_enabled"] imageDisabled:[UIImage imageNamed:@"tab_filters_disabled"]];
    filtersTabItem.tabState = TabStateEnabled;
    
    RKTabItem *frameTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"tab_frame_enabled"] imageDisabled:[UIImage imageNamed:@"tab_frame_disabled"]];
    RKTabItem *rotateTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"tab_rotate_enabled"] imageDisabled:[UIImage imageNamed:@"tab_rotate_disabled"]];
    RKTabItem *contrastTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"tab_contrast_enabled"] imageDisabled:[UIImage imageNamed:@"tab_contrast_disabled"]];
    RKTabItem *brightnessTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"tab_brightness_enabled"] imageDisabled:[UIImage imageNamed:@"tab_brightness_disabled"]];
    RKTabItem *blurTabItem = [RKTabItem createUsualItemWithImageEnabled:[UIImage imageNamed:@"tab_blur_enabled"] imageDisabled:[UIImage imageNamed:@"tab_blur_disabled"]];
    
    self.standardView.horizontalInsets = HorizontalEdgeInsetsMake(0, 0);
    
    self.standardView.darkensBackgroundForEnabledTabs = YES;
    self.standardView.drawSeparators = YES;
    self.standardView.tabItems = @[filtersTabItem, frameTabItem, rotateTabItem, contrastTabItem, brightnessTabItem,  blurTabItem];
    
    HomeViewController *home = [[HomeViewController alloc] init];
    
    [self addChildViewController:home];
    
//    [self.view addSubview:home.view];
    
    self.standardView.delegate = self;
}

#pragma mark - RKTabViewDelegate

- (void)tabView:(RKTabView *)tabView tabBecameEnabledAtIndex:(int)index tab:(RKTabItem *)tabItem {
    NSLog(@"Tab № %d became enabled on tab view", index);
    UIViewController *enabledController = self.childViewControllers[index];
    [self.view addSubview:enabledController.view];
}

- (void)tabView:(RKTabView *)tabView tabBecameDisabledAtIndex:(int)index tab:(RKTabItem *)tabItem {
    NSLog(@"Tab № %d became disabled on tab view", index);
    UIViewController *disabledController = self.childViewControllers[index];
    [disabledController.view removeFromSuperview];
}

@end
