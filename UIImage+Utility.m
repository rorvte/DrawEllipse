//
//  UIImage+Utility.m
//  DrawEllipse
//
//  Created by Yolanda Yuan on 16/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "UIImage+Utility.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (Utility)

+ (UIImage*)decode:(UIImage*)image
{
    if(image==nil){  return nil; }
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    {
        [image drawAtPoint:CGPointMake(0, 0)];
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark- Copy

- (UIImage*)deepCopy
{
    return [UIImage decode:self];
}

@end
