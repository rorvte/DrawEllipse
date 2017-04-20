//
//  YFImageToolInfo+Private.h
//  DrawEllipse
//
//  Created by yolanda yuan on 20/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "YFImageToolInfo.h"

@protocol YFImageToolProtocol;

@interface YFImageToolInfo (Private)

+ (YFImageToolInfo*)toolInfoForToolClass:(Class<YFImageToolProtocol>)toolClass;
+ (NSArray*)toolsWithToolClass:(Class<YFImageToolProtocol>)toolClass;

@end
