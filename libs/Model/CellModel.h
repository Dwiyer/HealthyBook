//
//  CellModel.h
//  HealthyBook
//
//  Created by Mac mini on 14-10-30.
//  Copyright (c) 2014年 Efun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DWTableViewCellAccessoryType) {
    DWTableViewCellAccessoryNone,                   // show switch view
    DWTableViewCellAccessoryDisclosureIndicator,    // regular chevron. doesn't track
    DWTableViewCellAccessoryDetailDisclosureButton, // info button w/ chevron. tracks
    DWTableViewCellAccessoryCheckmark,              // checkmark. doesn't track
    DWTableViewCellAccessoryDetailButton,
    DWTableViewCellAccessorySwitch
};


@interface CellModel : NSObject

@property (strong, nonatomic) NSString *iconName;
@property (strong, nonatomic) NSString *displayStr;
@property (assign, nonatomic) DWTableViewCellAccessoryType customAccessoryType;
@property (strong, nonatomic) Class toPresentedController;
@property (copy, nonatomic) void(^operation)();

@end
