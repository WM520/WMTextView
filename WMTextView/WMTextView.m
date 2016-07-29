//
//  WMTextView.m
//  WMTextView
//
//  Created by David on 16/7/29.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "WMTextView.h"
#import "UIView+Extension.h"

@interface WMTextView ()

@property (nonatomic, weak) UILabel * placeHoderLabel;

@end


@implementation WMTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 垂直方向上永远有弹簧效果
        self.alwaysBounceVertical = YES;
        
        UILabel * placeHoderLabel = [[UILabel alloc] init];
        placeHoderLabel.numberOfLines = 0;
        placeHoderLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:placeHoderLabel];
        
        self.placeHoderLabel = placeHoderLabel;
        self.placehoderColor = [UIColor lightGrayColor];
        _placeHoderLabel.font = [UIFont systemFontOfSize:14];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textDidChange
{
    self.placeHoderLabel.hidden = self.hasText;
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self textDidChange];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    [self textDidChange];
}

- (void)setPlacehoder:(NSString *)placehoder
{
    _placehoder = [placehoder copy];
    self.placeHoderLabel.text = _placehoder;
}



- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeHoderLabel.font = [UIFont systemFontOfSize:15];
    // 重新计算子控件的frame
    [self setNeedsLayout];
}

- (void)setPlacehoderColor:(UIColor *)placehoderColor
{
    _placehoderColor = placehoderColor;
    _placeHoderLabel.textColor = placehoderColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.placeHoderLabel.x = 5;
    self.placeHoderLabel.y = 8;
    self.placeHoderLabel.width = self.width - 2 * self.placeHoderLabel.x;
    // 根据文字计算label的高度
    CGSize placehoderSize = [self.placeHoderLabel.text boundingRectWithSize:CGSizeMake(self.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    self.placeHoderLabel.height = placehoderSize.height;
}


@end
