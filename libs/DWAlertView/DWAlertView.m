//
//  DWAlertView.m
//  HealthyBook
//
//  Created by Mac mini on 14-10-28.
//  Copyright (c) 2014年 Efun. All rights reserved.
//

#import "DWAlertView.h"

@interface DWAlertView () <UIAlertViewDelegate>

@end

static void (^clickBlock)(DWAlertView *, BOOL, NSInteger);
@implementation DWAlertView {
    void (^clickBlock)(DWAlertView *, BOOL, NSInteger);
}

- (instancetype)initWithTitle:(NSString *)title
            message:(NSString *)message
       clickedBlock:(void (^)(DWAlertView *alertView, BOOL cancelled, NSInteger buttonIndex))clickedBlock
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    
    self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil ];
    
    if (self) {
        clickBlock = clickedBlock;
        va_list _arguments;
        va_start(_arguments, otherButtonTitles);
        for (NSString *key = otherButtonTitles; key != nil; key = (__bridge NSString *)va_arg(_arguments, void *)) {
            [self addButtonWithTitle:key];
        }
        va_end(_arguments);
    }
    return self;
}

+ (DWAlertView *)showAlertViewWithTitle:(NSString *)title
                      message:(NSString *)message
                 clickedBlock:(void (^)(DWAlertView *alertView, BOOL cancelled, NSInteger buttonIndex))clickedBlock
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    DWAlertView *alertView = [[DWAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (alertView) {
        clickBlock = clickedBlock;
        va_list _arguments;
        va_start(_arguments, otherButtonTitles);
        for (NSString *key = otherButtonTitles; key != nil; key = (__bridge NSString *)va_arg(_arguments, void *)) {
            [alertView addButtonWithTitle:key];
        }
        va_end(_arguments);
    }
    [alertView show];
    return alertView;
}

+ (DWAlertView *)showAlertViewWithMessage:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle
{
    DWAlertView *alertView = [[DWAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    [alertView show];
    return alertView;
}
#pragma mark - UIAlertViewDelegate Method
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    clickBlock(self, buttonIndex==self.cancelButtonIndex, buttonIndex);
}

@end
