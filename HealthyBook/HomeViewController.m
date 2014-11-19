//
//  HomeViewController.m
//  HealthyBook
//
//  Created by Mac mini on 14/8/1.
//  Copyright (c) 2014年 Efun. All rights reserved.
//

#import "HomeViewController.h"
#import "SAMultisectorControl/SAMultisectorControl.h"
#import "DWAlertView.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet SAMultisectorControl *multisectorControl;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
- (IBAction)pageClicked:(id)sender;

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton * loginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame=CGRectMake(10, 10, 100, 50);
    loginBtn.center = self.view.center;
//    loginBtn.backgroundColor=[UIColor greenColor];
    [loginBtn setTitle:@"Click Me" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    
//    [self setupDesign];
//    [self setupMultisectorControl];
//
//    [self testVarList:3 name:@"wo",@"shi",@"shui"];
}
/**
 * 按钮事件绑定方法
 *
 */
- (void)clicked:(UIButton *)button
{
    [DWAlertView showAlertViewWithTitle:@"Hi" message:@"How are you?" clickedBlock:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel",@"De", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupDesign{
    self.view.backgroundColor = [UIColor colorWithRed:26.0/255.0 green:26.0/255.0 blue:26.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)setupMultisectorControl{
    [self.multisectorControl addTarget:self action:@selector(multisectorValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    UIColor *redColor = [UIColor colorWithRed:245.0/255.0 green:76.0/255.0 blue:76.0/255.0 alpha:1.0];
    UIColor *blueColor = [UIColor colorWithRed:0.0 green:168.0/255.0 blue:255.0/255.0 alpha:1.0];
//    UIColor *greenColor = [UIColor colorWithRed:29.0/255.0 green:207.0/255.0 blue:0.0 alpha:1.0];
    
    SAMultisectorSector *sector1 = [SAMultisectorSector sectorWithColor:redColor maxValue:16.0];
    SAMultisectorSector *sector2 = [SAMultisectorSector sectorWithColor:blueColor maxValue:8.0];
//    SAMultisectorSector *sector3 = [SAMultisectorSector sectorWithColor:greenColor maxValue:1000.0];
    
    sector1.tag = 0;
    sector2.tag = 1;
//    sector3.tag = 2;
    
    sector1.endValue = 13.0;
    sector2.endValue = 3.0;
//    sector3.startValue = 300.0;
//    sector3.endValue = 650.0;
    
    [self.multisectorControl addSector:sector1];
    [self.multisectorControl addSector:sector2];
//    [self.multisectorControl addSector:sector3];
    
    [self updateDataView];
}

- (void)multisectorValueChanged:(id)sender{
    [self updateDataView];
}

- (void)updateDataView{
//    for(SAMultisectorSector *sector in self.multisectorControl.sectors){
//        NSString *startValue = [NSString stringWithFormat:@"%.0f", sector.startValue];
//        NSString *endValue = [NSString stringWithFormat:@"%.0f", sector.endValue];
//        if(sector.tag == 0){
//            self.waitStartLable.text = startValue;
//            self.waitEndLable.text = endValue;
//        }
//        if(sector.tag == 1){
//            self.distanceStartLable.text = startValue;
//            self.distanceEndLable.text = endValue;
//        }
//        if(sector.tag == 2){
//            self.priceStartLable.text = startValue;
//            self.priceEndLable.text = endValue;
//        }
//    }
}

- (void)testVarList:(int)num name:(NSString *)strs,...
{
//    va_list args;
//    va_start(args, strs);
//    
//    for (NSString *str = strs; str != nil; str = va_arg(args,NSString*))
//    {
//        NSLog(@"arg:  %@",str);
//    }
//    va_end(args);
}

- (IBAction)pageClicked:(id)sender {
    self.pageControl = sender;
    self.myImageView.backgroundColor = self.pageControl.currentPage == 1 ? [UIColor redColor] : [UIColor greenColor];
    NSLog(@"%li",(long)self.pageControl.currentPage);
}
@end
