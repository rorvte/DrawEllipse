//
//  YFImageToolBase.m
//  DrawEllipse
//
//  Created by yolanda yuan on 18/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "YFImageToolBase.h"

@implementation YFImageToolBase

- (id)initWithImageEditor:(YFImageEditorViewController *)editor withToolInfo:(YFImageToolInfo *)toolInfo {
    
    self = [super init];
    if(self) {
        self.editor = editor;
        self.toolInfo = toolInfo;
    }
    return self;
}

+ (NSString*)defaultIconImagePath
{
    return nil;
}

+ (CGFloat)defaultDockedNumber
{
    // Image tools are sorted according to the dockedNumber in tool bar.
    // Override point for tool bar customization
    NSArray *tools = @[
                       @"CLFilterTool",
                       @"CLAdjustmentTool",
                       @"CLEffectTool",
                       @"CLBlurTool",
                       @"CLRotateTool",
                       @"CLClippingTool",
                       @"CLToneCurveTool",
                       ];
    return [tools indexOfObject:NSStringFromClass(self)];
}

+ (NSArray*)subtools
{
    return nil;
}

+ (NSString*)defaultTitle
{
    return @"DefaultTitle";
}

+ (BOOL)isAvailable
{
    return NO;
}

+ (NSDictionary*)optionalInfo
{
    return nil;
}

#pragma mark-

- (void)setup
{
    
}

- (void)cleanup
{
    
}

- (void)executeWithCompletionBlock:(void(^)(UIImage *image, NSError *error, NSDictionary *userInfo))completionBlock {
    completionBlock(self.editor.imageView.image, nil, nil);
}

- (UIImage*)imageForKey:(NSString*)key defaultImageName:(NSString*)defaultImageName {
    NSString *iconName = self.toolInfo.optionalInfo[key];
    
    if(iconName.length>0){
        return [UIImage imageNamed:iconName];
    }
    else{
        return nil;
//        return [CLImageEditorTheme imageNamed:[self class] image:defaultImageName];
    }
}



@end
