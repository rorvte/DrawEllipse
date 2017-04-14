//
//  ViewController.m
//  DrawEllipse
//
//  Created by yolanda yuan on 14/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (void)pushedEditBtn
{
    if(_imageView.image){
        NSLog(@"image");
    }
    else{
        [self pushedNewBtn];
    }
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
