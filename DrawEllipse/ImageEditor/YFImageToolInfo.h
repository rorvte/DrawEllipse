//
//  YFImageToolInfo.h
//  DrawEllipse
//
//  Created by yolanda yuan on 18/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YFImageToolInfo : NSObject

@property (nonatomic, readonly) NSString *toolName;
@property (nonatomic, strong)   NSString *title;
@property (nonatomic, assign)   BOOL      available;
@property (nonatomic, assign)   CGFloat   dockedNumber;
@property (nonatomic, strong)   NSString *iconImagePath;
@property (nonatomic, readonly) UIImage  *iconImage;
@property (nonatomic, readonly) NSArray  *subtools;
@property (nonatomic, strong) NSMutableDictionary *optionalInfo;

- (NSString*)toolTreeDescription;
- (NSArray*)storedSubtools;

- (YFImageToolInfo *)subToolInfoWithToolName:(NSString *)toolName recursive:(BOOL)recursive;

@end
