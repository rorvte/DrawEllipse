//
//  _YFImageEditorViewController.m
//  DrawEllipse
//
//  Created by yolanda yuan on 14/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "YFImageEditorViewController.h"

@interface YFImageEditorViewController ()
<UINavigationBarDelegate>
@property (nonatomic, strong) UIImageView *targetImageView;
@end

@implementation YFImageEditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.clipsToBounds = YES;
    [self initNavigationBar];
}


#pragma mark- Custom initialization
- (void)initNavigationBar {
    [self.navigationController setNavigationBarHidden:NO];
    if(self.navigationBar == nil){
        UINavigationItem *navigationItem = [[UINavigationItem alloc]init];
        navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(pushedCloseBtn:)];
        navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pushedFinishBtn:)];
        
        CGFloat dy = MIN([UIApplication sharedApplication].statusBarFrame.size.height, [UIApplication sharedApplication].statusBarFrame.size.width);
        
        UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, dy, self.view.width, 44)];
        [navigationBar pushNavigationItem:navigationItem animated:NO];
        navigationBar.delegate = self;
        
        if(self.navigationController) {
            [self.navigationController.view addSubview:navigationBar];
        }else{
            [self.view addSubview:navigationBar];
        }
        _navigationBar = navigationBar;
    }
    
    //TODO
//    if(self.navigationController!=nil){
}


@end
