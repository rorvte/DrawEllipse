//
//  ViewController.m
//  DrawEllipse
//
//  Created by yolanda yuan on 14/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "ViewController.h"
#import "YFImageEditor.h"

@interface ViewController ()
<YFImageEditorDelegate,YFImageEditorTransitionDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mainTabBar setDelegate:self];
}

- (void)pushedNewBtn {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Photo Library", nil];
    [sheet showInView:self.view.window];
    
}

- (void)pushedEditBtn {
//           YFImageEditor *editor = [[YF ImageEditor alloc] initWithImage:_imageView.image delegate:self];
    YFImageEditor *editor = [[YFImageEditor alloc] initWithDelegate:self];
    
    
    NSLog(@"%@", editor.toolInfo);
    NSLog(@"%@", editor.toolInfo.toolTreeDescription);
    
    
//    [self presentViewController:editor animated:YES completion:nil];
    [editor showInViewController:self withImageView:_imageView];
}

- (void)pushedSaveBtn{
    
}


#pragma mark - Tapbar delegate

- (void)deselectTabBarItem:(UITabBar *)tabBar {
    tabBar.selectedItem = nil;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    [self performSelector:@selector(deselectTabBarItem:) withObject:tabBar afterDelay:0.2];
    
    switch (item.tag) {
        case 0:
            [self pushedNewBtn];
            break;
        case 1:
            [self pushedEditBtn];
            break;
        case 2:
            [self pushedSaveBtn];
            break;
        default:
            break;
    }
}

#pragma mark- Actionsheet delegate




@end
