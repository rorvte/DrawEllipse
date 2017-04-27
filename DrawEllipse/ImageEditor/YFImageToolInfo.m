//
//  YFImageToolInfo.m
//  DrawEllipse
//
//  Created by yolanda yuan on 18/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "YFImageToolInfo.h"
#import "UIImage+Utility.h"

@interface YFImageToolInfo()

@property (nonatomic,strong) NSString *toolName;
@property (nonatomic,strong) NSArray *subtools;

@end

@implementation YFImageToolInfo

- (void)setObject:(id)object forKey:(NSString*)key inDictionary:(NSMutableDictionary*)dictionary {
    if(object){
        dictionary[key] = object;
    }
}

- (NSDictionary*)descriptionDictionary {
    NSMutableArray *array = [NSMutableArray array];
    for(YFImageToolInfo *sub in self.storedSubtools){
        [array addObject:sub.descriptionDictionary];
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [self setObject:self.toolName forKey:@"toolName" inDictionary:dict];
    [self setObject:self.title forKey:@"title" inDictionary:dict];
    [self setObject:((self.available)?@"YES":@"NO") forKey:@"available" inDictionary:dict];
    [self setObject:@(self.dockedNumber) forKey:@"dockedNumber" inDictionary:dict];
    [self setObject:self.iconImagePath forKey:@"iconImagePath" inDictionary:dict];
    [self setObject:array forKey:@"subtools" inDictionary:dict];
    if(self.optionalInfo){
        [self setObject:self.optionalInfo forKey:@"optionalInfo" inDictionary:dict];
    }
    
    return dict;
}

- (NSString*)description {
    return [NSString stringWithFormat:@"%@", self.descriptionDictionary];
}

- (NSString*)toolTreeDescriptionWithSpace:(NSString *)space {
    
    NSString *str = [NSString stringWithFormat:@"%@%@\n", space,self.toolName];
    space = [NSString stringWithFormat:@"    %@", space];
    for (YFImageToolInfo *sub in self.storedSubtools) {
        str = [str stringByAppendingFormat:@"%@", [sub toolTreeDescriptionWithSpace:space]];
    }
    return str;
}

- (NSString*)toolTreeDescription {
    return [NSString stringWithFormat:@"\n%@", [self toolTreeDescriptionWithSpace:@""]];
}

- (UIImage*)iconImage {
    return [UIImage fastImageWithContentsOfFile:self.iconImagePath];
}

- (NSString*)toolName {
    if([_toolName isEqualToString:@"YFImageEditorViewController"]) {
        return @"YFImageEditor";
    }
    return _toolName;
}

- (NSArray*)storedSubtools {
    self.subtools = [self.subtools sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        CGFloat dockedNum1 = [obj1 dockedNumber];
        CGFloat dockedNum2 = [obj2 dockedNumber];
        
        if(dockedNum1 < dockedNum2){return NSOrderedAscending;}
        if(dockedNum1 > dockedNum2){return NSOrderedDescending;}
        return NSOrderedSame;
    }];
    return self.subtools;
}

- (YFImageToolInfo *)subToolInfoWithToolName:(NSString *)toolName recursive:(BOOL)recursive{
    YFImageToolInfo *result = nil;
    for(YFImageToolInfo *sub in self.subtools){
        if([sub.toolName isEqualToString:toolName]){
            result = sub;
            break;
        }
        if(recursive){
            result = [sub subToolInfoWithToolName:toolName recursive:recursive];
            if(result){
                break;
            }
        }
    }
    return result;
}

@end
