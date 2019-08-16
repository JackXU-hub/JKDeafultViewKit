//
//  JKDefaultView.m


#import "JKDefaultView.h"
#import "UIColor+Hex.h"
#import "UIImage+JKBundle.h"
#import <Masonry/Masonry.h>
@implementation JKDefaultView

+ (instancetype)defaultView:(NSString *)imageName withTitle:(NSString *)title
{
    return [[self alloc] initWithImage:imageName title:title isShow:NO];
}

+ (instancetype)defaultView:(NSString *)imageName withTitle:(NSString *)title isShowBtn:(BOOL)isShow
{
    return [[self alloc] initWithImage:imageName title:title isShow:isShow];
}

- (instancetype)initWithImage:(NSString *)imageName title:(NSString *)title isShow:(BOOL)isshow
{
    if (self = [super init]) {
        _isShow = isshow;
        self.backgroundColor = [UIColor colorWithHexStr:@"#F4F5F9"];
        [self initUI:imageName title:title];
    }
    return self;
}

- (void)initUI:(NSString *)imageName title:(NSString *)title
{
    self.imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    self.imageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.imageview];
    self.lab = [[UILabel alloc] init];
    self.lab.text = title;
    self.lab.font = [UIFont systemFontOfSize:13];
    self.lab.textColor = [UIColor colorWithHexStr:@"#333333"];
    self.lab.textAlignment = NSTextAlignmentCenter;
    self.lab.numberOfLines = 0;
    [self addSubview:self.lab];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.bounds = CGRectMake(0, 0, 80, 30);
    self.btn.layer.cornerRadius = 15;
    self.btn.layer.masksToBounds = YES;
    self.btn.layer.borderColor = [UIColor colorWithHexStr:@"#35C561"].CGColor;
    self.btn.layer.borderWidth = 1;
    self.btn.backgroundColor = [UIColor colorWithHexStr:@"#F4F5F9"];//ColorGreen_00dc82;
    [self.btn setTitle:@"刷新" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(reload:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.btn setTitleColor:[UIColor colorWithHexStr:@"#35C561"] forState:UIControlStateNormal];
    self.btn.titleLabel.font = [UIFont systemFontOfSize:14];
    self.btn.hidden = !self.isShow;
    [self addSubview:self.btn];
    [self.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-15);
        make.height.equalTo(@135);
        make.width.equalTo(@181);
    }];
    [self.lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageview.mas_bottom).offset(10);
        make.centerX.equalTo(self.imageview.mas_centerX);
        make.left.equalTo(self.mas_left).offset(15);
        make.right.equalTo(self.mas_right).offset(-15);
    }];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lab.mas_bottom).offset(20);
        make.height.equalTo(@30);
        make.width.equalTo(@80);
        make.centerX.equalTo(self.lab.mas_centerX);
    }];
}
    
- (void)reload:(UIButton *)reloadBtn{
    if (self.didReloadAction) {
        self.didReloadAction(reloadBtn);
    }
}


- (void)showOnView:(UIView *)view
{
    if (view == nil) {
        return;
    }
    [view addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (view.mas_top);
        make.left.equalTo(view.mas_left);
        make.width.equalTo(view.mas_width);
        make.height.equalTo(view.mas_height);
    }];
}

-(void)showOnView:(UIView *)view type:(DefeatViewType)type{
    switch (type) {
        case DefeatViewNoData:
        {
            self.imageview.image = [UIImage  jk_imgWithName:@"noData" bundle:@"JKDefaultView" targetClass:[self class]];
            self.lab.text = @"暂无数据";
            [self showOnView:view];
        }
        break;
        
        case DefeatViewNoNetWork:
        {
            self.imageview.image = [UIImage  jk_imgWithName:@"noData" bundle:@"JKDefaultView" targetClass:[self class]];
            self.lab.text = @"暂无网络";
            [self showOnView:view];
        }
        break;
        case DefeatViewNetWorkBusy:
        {
            //defeaultView =  [JKDefaultView defaultView:@"netBusy" withTitle:@"网络繁忙"];
            self.imageview.image =  [UIImage  jk_imgWithName:@"netBusy" bundle:@"JKDefaultView" targetClass:[self class]];
            self.lab.text = @"网络繁忙";
            [self showOnView:view];
        }
        break;
        case DefeatViewNoSearchResult:
        {
            //defeaultView = [JKDefaultView defaultView:@"noData" withTitle:@"暂无搜索结果"];
            self.imageview.image = [UIImage  jk_imgWithName:@"noData" bundle:@"JKDefaultView" targetClass:[self class]];
            self.lab.text = @"暂无搜索结果";
            [self showOnView:view];
        }
        break;
        case DefeatViewNoAuthority:
        {
            //defeaultView = [JKDefaultView defaultView:@"noData" withTitle:@"暂无搜索结果"];
            self.imageview.image = [UIImage  jk_imgWithName:@"noAuthority" bundle:@"JKDefaultView" targetClass:[self class]];
            self.lab.text = @"暂无权限查看";
            [self showOnView:view];
        }

            break;
        default:
        break;
    }
}

- (void)showDownView:(UIView *)view y:(CGFloat)y{
    if (view == nil) {
        return;
    }
    [view addSubview:self];
    self.frame = CGRectMake(0, y, [UIApplication sharedApplication].keyWindow.bounds.size.width, view.frame.size.height-y);
}
    
-(void)showOnView:(UIView *)view type:(DefeatViewType)type y:(CGFloat)y{
    switch (type) {
        case DefeatViewNoData:
        {
            self.imageview.image =[UIImage  jk_imgWithName:@"noData" bundle:@"JKDefaultView" targetClass:[self class]];
            self.lab.text = @"暂无数据";
            [self showDownView:view y:y];
        }
        break;
        
        case DefeatViewNoNetWork:
        {
            self.imageview.image = [UIImage  jk_imgWithName:@"noData" bundle:@"JKDefaultView" targetClass:[self class]];
            self.lab.text = @"暂无网络";
             [self showDownView:view y:y];
        }
        break;
        case DefeatViewNetWorkBusy:
        {
            //defeaultView =  [JKDefaultView defaultView:@"netBusy" withTitle:@"网络繁忙"];
            self.imageview.image = [UIImage  jk_imgWithName:@"netBusy" bundle:@"JKDefaultView" targetClass:[self class]];
            self.lab.text = @"网络繁忙";
             [self showDownView:view y:y];
        }
        break;
        case DefeatViewNoSearchResult:
        {
            //defeaultView = [JKDefaultView defaultView:@"noData" withTitle:@"暂无搜索结果"];
            self.imageview.image = [UIImage  jk_imgWithName:@"noData" bundle:@"JKDefaultView" targetClass:[self class]];
            self.lab.text = @"暂无搜索结果";
            [self showDownView:view y:y];
        }
        break;
        case DefeatViewNotAll:
        {
            //defeaultView = [JKDefaultView defaultView:@"noData" withTitle:@"暂无搜索结果"];
            self.imageview.image = nil;
            self.lab.text = @"";
            [self showDownView:view y:y];
        }
            break;
            
            
        default:
        break;
    }
}
- (void)dismiss
{
    [self removeFromSuperview];
}

@end
