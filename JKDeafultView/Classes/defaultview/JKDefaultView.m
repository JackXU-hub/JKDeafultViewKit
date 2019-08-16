//
//  JKDefaultView.m


#import "JKDefaultView.h"
#import "UIColor+Hex.h"
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

- (void)showOnView:(UIView *)view img:(NSString*)img title:(NSString*)title{
    self.imageview.image = [UIImage  imageNamed:img];
    self.lab.text = title;
    [self showOnView:view];
}


- (void)showDownView:(UIView *)view y:(CGFloat)y{
    if (view == nil) {
        return;
    }
    [view addSubview:self];
    self.frame = CGRectMake(0, y, [UIScreen mainScreen].bounds.size.width, view.frame.size.height-y);
}

- (void)showOnView:(UIView *)view img:(NSString*)img title:(NSString*)title y:(CGFloat)y{
    self.imageview.image = [UIImage  imageNamed:img];
    self.lab.text = title;
    [self showDownView:view y:y];
}

- (void)dismiss
{
    [self removeFromSuperview];
}

@end
