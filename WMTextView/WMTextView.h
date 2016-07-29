//
//  WMTextView.h
//  WMTextView
//
//  Created by David on 16/7/29.
//  Copyright © 2016年 WM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMTextView : UITextView

/**
 *  占位文字
 */
@property (nonatomic, copy) NSString * placehoder;
/**
 *  占位文字颜色
 */
@property (nonatomic, strong) UIColor * placehoderColor;

@end
