//
//  InfoTableViewCell.m
//  SampleApp
//
//  Created by Limin on 2020/6/27.
//  Copyright © 2020 Limin. All rights reserved.
//

#import "InfoTableViewCell.h"

@interface InfoTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;


@end

@implementation InfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.subTitleLabel];
        [self.contentView addSubview:self.titleLabel];
        self.contentView.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setupTitleLabelInfoWithRow:(NSInteger)row {
    self.titleLabel.text = [NSString stringWithFormat:@"主标题 -- row %ld",(long)row];
}


#pragma lazy
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"主标题";
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.frame = CGRectMake(10, 10, 200, 30);
    }
    return  _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc]init];
        _subTitleLabel.text = @"副标题";
        _subTitleLabel.textColor = [UIColor orangeColor];
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        _subTitleLabel.frame = CGRectMake(10, 40, 100, 14);
    }
    return _subTitleLabel;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
