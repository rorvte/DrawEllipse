//
//  UIView+YFImageToolInfo.m
//  DrawEllipse
//
//  Created by yolanda yuan on 20/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "UIView+YFImageToolInfo.h"
#import <objc/runtime.h>

@implementation UIView (YFImageToolInfo)

- (YFImageToolInfo*)toolInfo
{
    return objc_getAssociatedObject(self, @"UIView+YFImageToolInfo_toolInfo");
}

- (void)setToolInfo:(YFImageToolInfo *)toolInfo
{
    objc_setAssociatedObject(self, @"UIView+YFImageToolInfo_toolInfo", toolInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary*)userInfo
{
    return objc_getAssociatedObject(self, @"UIView+YFImageToolInfo_userInfo");
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
    objc_setAssociatedObject(self, @"UIView+YFImageToolInfo_userInfo", userInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
