//
//  YFImageEditor.m
//  DrawEllipse
//
//  Created by yolanda yuan on 14/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "YFImageEditor.h"
#import "YFImageEditorViewController.h"

@interface YFImageEditor ()

@end

@implementation YFImageEditor

- (id)init {
    return [YFImageEditorViewController new];
}

- (id)initWithImage:(UIImage*)image{
    return [self initWithImage:image delegate:nil];
}

- (id)initWithImage:(UIImage*)image delegate:(id<YFImageEditorDelegate>)delegate{
    return [[YFImageEditorViewController alloc] initWithImage:image delegate:delegate];
}

- (id)initWithDelegate:(id<YFImageEditorDelegate>)delegate {
    return [[YFImageEditorViewController alloc]initWithDelegate:delegate];
}

- (void)showInViewController:(UIViewController<YFImageEditorTransitionDelegate>*)controller withImageView:(UIImageView*)imageView{
    
}

@end
