//
//  _YFImageEditorViewController.m
//  DrawEllipse
//
//  Created by yolanda yuan on 14/4/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

#import "YFImageEditorViewController.h"
#import "YFToolbarMenuItem.h"
#import "YFImageToolBase.h"
#import "UIImage+Utility.h"


@interface YFImageEditorViewController ()
<UINavigationBarDelegate>
@property (nonatomic, strong, readwrite) YFImageToolInfo *toolInfo;
@property (nonatomic,strong) YFImageToolBase *currentTool;
@property (nonatomic, strong) UIImageView *targetImageView;
@end

@implementation YFImageEditorViewController
{
    UIImage *_originalImage;
    UIView *_bgView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.clipsToBounds = YES;
    self.navigationController.view.backgroundColor = self.view.backgroundColor;
    
    if([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]){
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [self initNavigationBar];
    [self initMenuScrollView];
    [self refreshToolSettings];
    
    if(_imageView==nil){
        _imageView = [UIImageView new];
        [_scrollView addSubview:_imageView];
//        [self refreshImageView];
    }
}

- (id)init{
    self = [self initWithNibName:nil bundle:nil];
    return self;
}

- (id)initWithImage:(UIImage *)image{
    return [self initWithImage:image delegate:nil];
}

- (id)initWithImage:(UIImage*)image delegate:(id<YFImageEditorDelegate>)delegate{
    self = [self init];
    if (self){
        _originalImage = [image deepCopy];
        self.delegate = delegate;
    }
    return self;
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
    
    if(self.navigationController!=nil){
        self.navigationBar.frame = self.navigationController.navigationBar.frame;
        self.navigationBar.hidden = YES;
    }else {
        _navigationBar.topItem.title = self.title;
    }
        
}

- (void)initMenuScrollView {
    if(self.menuView==nil){
        UIScrollView *menuScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 80)];
        menuScroll.top = self.view.height - menuScroll.height;
        menuScroll.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        menuScroll.showsHorizontalScrollIndicator = NO;
        menuScroll.showsVerticalScrollIndicator = NO;
        
        [self.view addSubview:menuScroll];
        self.menuView = menuScroll;
    }
    self.menuView.backgroundColor = [UIColor blueColor];
}

#pragma mark- ImageTool setting

+ (NSString*)defaultIconImagePath{
    return nil;
}

+ (CGFloat)defaultDockedNumber{
    return 0;
}

+ (NSString*)defaultTitle{
    
    //NEED Change
    return nil;
}

+ (BOOL)isAvailable{
    return YES;
}

+ (NSArray*)subtools{
    return [YFImageToolInfo toolsWithToolClass:[YFImageToolBase class]];
}

+ (NSDictionary*)optionalInfo{
    return nil;
}

#pragma mark-
- (void)refreshToolSettings {
    for (UIView* subs in _menuView.subviews){[subs removeFromSuperview];}
    
    CGFloat X = 0;
    CGFloat W = 70;
    CGFloat H = _menuView.height;
    
    int toolCount = 0;
    CGFloat padding = 0;
    
    for(YFImageToolInfo *info in self.toolInfo.storedSubTools) {
        if(info.available) {toolCount++;}
    }
    
    CGFloat diff = _menuView.frame.size.width - toolCount * W;
    if (0<diff && diff<2*W) {
        padding = diff/(toolCount+1);
    }
    
    for(YFImageToolInfo *info in self.toolInfo.storedSubTools) {
        if(!info.available) {
            continue;
        }
        YFToolbarMenuItem *view = [[YFToolbarMenuItem alloc]initWithFrame:CGRectMake(X+padding, 0, W, H) target:self action:@selector(tappedMenuView:) toolInfo:info];
        [_menuView addSubview:view];
        X += W+padding;
    }
    _menuView.contentSize = CGSizeMake(MAX(X, _menuView.frame.size.width+1), 0);
}

#pragma mark Menu actions

- (IBAction)pushedDoneBtn:(id)sender{

}

- (void)pushedFinishBtn:(id)sender{
    
}

- (void)tappedMenuView:(UITapGestureRecognizer*)sender{
    UIView *view = sender.view;
    
    view.alpha = 0.2;
    [UIView animateWithDuration:0.3
                     animations:^{
                         view.alpha = 1;
                     }
     ];
    
    [self setupToolWithToolInfo:view.toolInfo];
}

- (void)setupToolWithToolInfo:(YFImageToolInfo*)info {
    if(self.currentTool){ return; }
    
    Class toolClass = NSClassFromString(info.toolName);
    
    if(toolClass){
        id instance = [toolClass alloc];
        if(instance!=nil && [instance isKindOfClass:[YFImageToolBase class]]){
            instance = [instance initWithImageEditor:self withToolInfo:info];
            self.currentTool = instance;
        }
    }
}

@end
