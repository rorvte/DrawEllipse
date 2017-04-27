//
//  CLRotateTool.m
//  DrawEllipse
//
//  Created by Yolanda Yuan on 25/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "CLRotateTool.h"
#import "CLImageEditorTheme.h"

static NSString* const kCLRotateToolRotateIconName = @"rotateIconAssetsName";
static NSString* const kCLRotateToolFlipHorizontalIconName = @"flipHorizontalIconAssetsName";
static NSString* const kCLRotateToolFlipVerticalIconName = @"flipVerticalIconAssetsName";
static NSString* const kCLRotateToolFineRotationEnabled = @"fineRotationEnabled";
static NSString* const kCLRotateToolCropRotate = @"cropRotateEnabled";


@interface CLRotatePanel : UIView
@property(nonatomic, strong) UIColor *bgColor;
@property(nonatomic, strong) UIColor *gridColor;
@property(nonatomic, assign) CGRect gridRect;
- (id)initWithSuperview:(UIView*)superview frame:(CGRect)frame;
@end

@implementation CLRotateTool


+ (NSString*)defaultTitle
{
    return @"haha";
}

+ (BOOL)isAvailable
{
    return YES;
}

#pragma mark- optional info

+ (NSDictionary*)optionalInfo
{
    return @{
             kCLRotateToolRotateIconName : @"",
             kCLRotateToolFlipHorizontalIconName : @"",
             kCLRotateToolFlipVerticalIconName : @"",
             kCLRotateToolFineRotationEnabled : @NO,
             kCLRotateToolCropRotate : @NO
             };
}

#pragma mark-

- (void)setup
{

}

- (void)cleanup
{
}

- (void)executeWithCompletionBlock:(void(^)(UIImage *image, NSError *error, NSDictionary *userInfo))completionBlock
{
}
@end
