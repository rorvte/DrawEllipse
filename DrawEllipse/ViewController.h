//
//  ViewController.h
//  DrawEllipse
//
//  Created by yolanda yuan on 14/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITabBarDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITabBar *mainTabBar;
@property (weak, nonatomic) IBOutlet UITabBarItem *mainTabBarItem;

@end
