//
//  YFClassList.m
//  DrawEllipse
//
//  Created by yolanda yuan on 20/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "YFClassList.h"
#import <objc/runtime.h>

@implementation YFClassList

+ (NSArray*)subclassesOfClass:(Class)parentClass {
    int numClasses = objc_getClassList(NULL, 0);
    Class *classes = (Class*)malloc(sizeof(Class) * numClasses);
    
    numClasses = objc_getClassList(classes, numClasses);
    
    NSMutableArray *result = [NSMutableArray array];
    for(NSInteger i=0; i<numClasses; i++){
        Class cls = classes[i];
        
        do{
            cls = class_getSuperclass(cls);
        }while(cls && cls != parentClass);
        
        if(cls){
            [result addObject:classes[i]];
        }
    }
    
    free(classes);
    
    return [result copy];
}

@end
