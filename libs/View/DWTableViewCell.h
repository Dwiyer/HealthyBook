//
//  DWTableViewCell.h
//  HealthyBook
//
//  Created by Mac mini on 14-10-30.
//  Copyright (c) 2014年 Efun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"

@interface DWTableViewCell : UITableViewCell

@property (strong, nonatomic) CellModel *cellModel;


+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
