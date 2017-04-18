//
//  YFToolbarMenuItem.h
//  DrawEllipse
//
//  Created by yolanda yuan on 18/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFImageToolInfo.h"
#import "UIView+Frame.h"

@interface YFToolbarMenuItem : UIView
{
    UIImageView *_iconView;
    UILabel *_titleLabel;
}

@property (nonatomic,assign) NSString *title;
@property (nonatomic,assign) UIImage *iconImage;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, readonly) UIImageView *iconView;

- (id)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action toolInfo:(YFImageToolInfo*)toolInfo;

@end
