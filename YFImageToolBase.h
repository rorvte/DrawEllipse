//
//  YFImageToolBase.h
//  DrawEllipse
//
//  Created by yolanda yuan on 18/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFImageEditorViewController.h"
#import "YFImageToolInfo.h"
#import "UIView+Frame.h"
#import "UIImage+Utility.h"
#import "YFImageToolProtocol.h"

@interface YFImageToolBase : NSObject<YFImageToolProtocol>

@property (nonatomic,weak) YFImageEditorViewController *editor;
@property (nonatomic,weak) YFImageToolInfo *toolInfo;

- (id)initWithImageEditor:(YFImageEditorViewController*)editor withToolInfo:(YFImageToolInfo*)toolInfo;

@end
