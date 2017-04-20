//
//  YFImageToolInfo+Private.m
//  DrawEllipse
//
//  Created by yolanda yuan on 20/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "YFImageToolInfo+Private.h"
#import "YFImageToolProtocol.h"
#import "YFClassList.h"

@interface YFImageToolInfo()

@property (nonatomic, strong) NSString *toolName;
@property (nonatomic, strong) NSArray *subtools;

@end

@implementation YFImageToolInfo (Private)

+ (YFImageToolInfo*)toolInfoForToolClass:(Class<YFImageToolProtocol>)toolClass;
{
    if([(Class)toolClass conformsToProtocol:@protocol(YFImageToolProtocol)] && [toolClass isAvailable]){
        YFImageToolInfo *info = [YFImageToolInfo new];
        info.toolName  = NSStringFromClass(toolClass);
        info.title     = [toolClass defaultTitle];
        info.available = YES;
        info.dockedNumber = [toolClass defaultDockedNumber];
        info.iconImagePath = [toolClass defaultIconImagePath];
        info.subtools = [toolClass subtools];
        info.optionalInfo = [[toolClass optionalInfo] mutableCopy];
        
        return info;
    }
    return nil;
}

+ (NSArray*)toolsWithToolClass:(Class<YFImageToolProtocol>)toolClass{
    NSMutableArray *array = [NSMutableArray array];
    
    YFImageToolInfo *info = [YFImageToolInfo toolInfoForToolClass:toolClass];
    if(info){
        [array addObject:info];
    }
    
    NSArray *list = [YFClassList subclassesOfClass:toolClass];
    for(Class subtool in list){
        info = [YFImageToolInfo toolInfoForToolClass:subtool];
        if(info){
            [array addObject:info];
        }
    }
    return [array copy];
}

@end
