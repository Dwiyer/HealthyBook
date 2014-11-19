//
//  OuterViewController.m
//  HealthyBook
//
//  Created by Mac mini on 14/8/5.
//  Copyright (c) 2014年 Efun. All rights reserved.
//

#import "OuterViewController.h"
#import "CellModel.h"
#import "MainViewController.h"

@interface OuterViewController ()

@end

@implementation OuterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:2];
        self.view.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    CellModel *push = [[CellModel alloc] init];
    push.iconName = @"cloud_disabled";
    push.displayStr = @"11It's cloudy day!";
    push.customAccessoryType = DWTableViewCellAccessoryCheckmark;
    
    CellModel *pop = [[CellModel alloc] init];
    pop.iconName = @"cloud_disabled";
    pop.displayStr = @"22It's cloudy day!";
    pop.customAccessoryType = DWTableViewCellAccessoryDetailButton;
    
    CellModel *pop2 = [[CellModel alloc] init];
    pop2.iconName = @"cloud_disabled";
    pop2.displayStr = @"33It's cloudy day!";
    pop2.customAccessoryType = DWTableViewCellAccessoryDetailDisclosureButton;
    
    CellModel *pop3 = [[CellModel alloc] init];
    pop3.iconName = @"cloud_disabled";
    pop3.displayStr = @"44It's cloudy day!";
    pop3.customAccessoryType = DWTableViewCellAccessorySwitch;
    pop3.toPresentedController = [MainViewController class];
    
    [_allGroup addObject:@[push,pop,pop2,pop3]];
}

@end
