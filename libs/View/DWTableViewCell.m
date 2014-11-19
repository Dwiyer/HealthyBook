//
//  DWTableViewCell.m
//  HealthyBook
//
//  Created by Mac mini on 14-10-30.
//  Copyright (c) 2014年 Efun. All rights reserved.
//

#import "DWTableViewCell.h"


@implementation DWTableViewCell
//@dynamic cellModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
//    NSLog(@"%s",__FUNCTION__);
//    NSLog(@"%d",__LINE__);
    NSString *reuseIdentifier = @"CellIdentifier";
    DWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[DWTableViewCell alloc] init];
    }
    cell.tintColor = [UIColor clearColor];
    return cell;
}

- (void)setCellModel:(CellModel *)cellModel
{
    CUR_FUNCTION;
    self.imageView.image = [UIImage imageNamed:cellModel.iconName];
    self.textLabel.text = cellModel.displayStr;
    // 如果是自定义控件，它的响应事件需怎么做处理需要考虑一下
    UISwitch *switchView = [[UISwitch alloc] init]; // cell的accessoryView为UISwitch
    switch (cellModel.customAccessoryType) {
        case DWTableViewCellAccessorySwitch:
            self.accessoryView = switchView;
            break;
        case DWTableViewCellAccessoryCheckmark:
            self.accessoryType = UITableViewCellAccessoryCheckmark;
            break;
        case DWTableViewCellAccessoryDetailButton:
            self.accessoryType = UITableViewCellAccessoryDetailButton;
            break;
        case DWTableViewCellAccessoryDetailDisclosureButton:
            self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            break;
        case DWTableViewCellAccessoryDisclosureIndicator:
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case DWTableViewCellAccessoryNone:
            self.accessoryType = UITableViewCellAccessoryNone;
            break;
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
