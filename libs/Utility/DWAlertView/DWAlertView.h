//
//  DWAlertView.h
//  HealthyBook
//
//  Created by Mac mini on 14-10-28.
//  Copyright (c) 2014年 Efun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWAlertView : UIAlertView

- (instancetype)initWithTitle:(NSString *)title
            message:(NSString *)message
       clickedBlock:(void (^)(DWAlertView *alertView, BOOL cancelled, NSInteger buttonIndex))clickedBlock
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

+ (DWAlertView *)showAlertViewWithTitle:(NSString *)title
                               message:(NSString *)message
                          clickedBlock:(void (^)(DWAlertView *alertView, BOOL cancelled, NSInteger buttonIndex))clickedBlock
                     cancelButtonTitle:(NSString *)cancelButtonTitle
                     otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

+ (DWAlertView *)showAlertViewWithMessage:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle;
@end
