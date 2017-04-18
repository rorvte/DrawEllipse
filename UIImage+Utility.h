//
//  UIImage+Utility.h
//  DrawEllipse
//
//  Created by Yolanda Yuan on 16/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utility)

+ (UIImage*)fastImageWithContentsOfFile:(NSString*)path;
- (UIImage*)deepCopy;

@end
