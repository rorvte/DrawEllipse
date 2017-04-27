//
//  YFImageEditor.h
//  DrawEllipse
//
//  Created by yolanda yuan on 14/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YFImageToolInfo.h"
#import "CLImageEditorTheme.h"

@protocol YFImageEditorDelegate;
@protocol YFImageEditorTransitionDelegate;

@interface YFImageEditor : UIViewController

@property (nonatomic, weak) id<YFImageEditorDelegate> delegate;
@property (nonatomic, readonly) CLImageEditorTheme *theme;
@property (nonatomic, readonly) YFImageToolInfo *toolInfo;

- (id)initWithImage:(UIImage*)image;
- (id)initWithImage:(UIImage*)image delegate:(id<YFImageEditorDelegate>)delegate;
- (id)initWithDelegate:(id<YFImageEditorDelegate>)delegate;

- (void)showInViewController:(UIViewController<YFImageEditorTransitionDelegate>*)controller withImageView:(UIImageView*)imageView;

@end

@protocol YFImageEditorDelegate <NSObject>
@optional
- (void)imageEditor:(YFImageEditor*)editor didFinishEdittingWithImage:(UIImage*)image;
- (void)imageEditorDidCancel:(YFImageEditor*)editor;
@end

@protocol YFImageEditorTransitionDelegate <NSObject>
@optional
- (void)imageEditor:(YFImageEditor*)editor willDismissWithImageView:(UIImageView*)imageView canceled:(BOOL)canceled;
- (void)imageEditor:(YFImageEditor*)editor didDismissWithImageView:(UIImageView*)imageView canceled:(BOOL)canceled;
@end
