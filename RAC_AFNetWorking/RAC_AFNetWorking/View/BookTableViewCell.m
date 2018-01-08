//
//  BookTableViewCell.m
//  RAC_AFNetWorking
//
//  Created by 孙博文 on 2018/1/8.
//  Copyright © 2018年 孙博文. All rights reserved.
//

#import "BookTableViewCell.h"
#import "RequestModel.h"

static NSString * const BookTableViewCell_ID = @"BookTableViewCell_ID";

@interface BookTableViewCell ()

@property (nonatomic,strong) UIImageView * iconImageView;//头像

@property (nonatomic,strong) UILabel * nameLabel;//名字

@property (nonatomic,strong) UIView * line;


@end

@implementation BookTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    BookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BookTableViewCell_ID];
    if (cell == nil) {
        cell = [[BookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BookTableViewCell_ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUI];
        
    }
    return self;
}
- (void)setUI{
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.line];
 
}
#pragma mark - lazy

- (UIImageView *)iconImageView
{
    if(!_iconImageView)
    {
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 20, 40, 60)];
 
    }
    return _iconImageView;
}
- (UILabel *)nameLabel
{
    if(!_nameLabel)
    {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 40, screen_W - 100, 20)];
        _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];

    }
    return _nameLabel;
}

- (UIView *)line
{
    if(!_line)
    {
        _line = [[UIView alloc]initWithFrame:CGRectMake(15, 99.5f, screen_W - 30, .5f)];
        _line.backgroundColor = [UIColor colorWithRed:0.87 green:0.86 blue:0.87 alpha:1.00];
        
    }
    return _line;
}

- (void)setModel:(RequestModel *)model{
    _model = model;
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    _nameLabel.text = model.title;


}
@end
