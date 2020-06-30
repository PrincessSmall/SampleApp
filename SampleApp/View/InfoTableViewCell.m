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
@property (nonatomic, strong) UILabel *sourceLabel;
@property (nonatomic, strong) UILabel *commendLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UIButton *deleteButton;

@end

@implementation InfoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.sourceLabel];
        [self.contentView addSubview:self.commendLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.rightImageView];
        [self.contentView addSubview:self.deleteButton];
        self.contentView.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

//- (void)setupTitleLabelInfoWithRow:(NSInteger)row {
//    self.titleLabel.text = [NSString stringWithFormat:@"主标题 -- row %ld",(long)row];
//}

- (void)touchDeleteButton {
    NSLog(@"touchDeleteButton");
}


#pragma lazy
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"极客时间从0学iOS开发";
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.frame = CGRectMake(20, 20, 200, 30);
    }
    return  _titleLabel;
}
- (UILabel *)sourceLabel {
    if (!_sourceLabel) {
        _sourceLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, 40, 20)];
        _sourceLabel.font = [UIFont systemFontOfSize:12];
        _sourceLabel.textColor = [UIColor grayColor];
        _sourceLabel.text = @"极客时间";
        [_sourceLabel sizeToFit];
//        _sourceLabel.lineBreakMode = NSLineBreakByWordWrapping;//最后一个字看到一半字
    }
    return _sourceLabel;
}
- (UILabel *)commendLabel {
    if (!_commendLabel) {
        _commendLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 10, 60, 40, 20)];
        _commendLabel.font = [UIFont systemFontOfSize:12];
        _commendLabel.textColor = [UIColor grayColor];
        _commendLabel.text = @"2000条评论";
        [_commendLabel sizeToFit];
//        _commendLabel.lineBreakMode = NSLineBreakByClipping;//直接截断
    }
    return _commendLabel;
}
- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.commendLabel.frame.origin.x + self.commendLabel.frame.size.width + 10, 60, 40, 20)];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.text = @"三分钟前";
        [_timeLabel sizeToFit];
//        _timeLabel.lineBreakMode = NSLineBreakByCharWrapping;////最后一个字看到一半字
    }
    return _timeLabel;
}
- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(300, 0, 100, 100)];
        _rightImageView.image = [UIImage imageNamed:@"beautifulGirl"];
//        _rightImageView.backgroundColor = [UIColor redColor];
    }
    return _rightImageView;;
}
- (UIButton *)deleteButton {
    if (!_deleteButton) {
        _deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(220, 70, 80, 30)];
        _deleteButton.backgroundColor = [UIColor blueColor];
        [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];//UIControlState是UIControl的手势类型；
        [_deleteButton setTitle:@"highLight" forState:UIControlStateHighlighted];
        [_deleteButton addTarget:self action:@selector(touchDeleteButton) forControlEvents:UIControlEventTouchUpInside];//UIControlEvents是UIControl的枚举交互类型
    }
    return _deleteButton;;
}


@end
