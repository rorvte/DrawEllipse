//
//  YFClassList.h
//  DrawEllipse
//
//  Created by yolanda yuan on 20/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFClassList : NSObject

+ (NSArray*)subclassesOfClass:(Class)parentClass;

@end
