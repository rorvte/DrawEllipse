//
//  _YFImageEditorViewController.h
//  DrawEllipse
//
//  Created by yolanda yuan on 14/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "YFImageEditor.h"
#import "UIView+Frame.h"

@interface YFImageEditorViewController : YFImageEditor
<UIScrollViewDelegate, UIBarPositioningDelegate>
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIScrollView *menuView;
@property (nonatomic) UIScrollView *scrollView;

-(IBAction)pushedCloseBtn:(id)sender;
-(IBAction)pushedFinishBtn:(id)sender;

-(id)initWithImage:(UIImage*)image;

@end
