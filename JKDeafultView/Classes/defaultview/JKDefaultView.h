//
//  JKDefaultView.h


#import <UIKit/UIKit.h>

typedef void(^DidReloadAction)(id obj);
@interface JKDefaultView : UIView

@property (nonatomic ,assign) BOOL isShow;
@property (nonatomic ,strong) UIButton *btn;
@property (nonatomic ,strong) UIImageView *imageview;
@property(nonatomic, strong)UILabel *lab;
@property(nonatomic, copy)DidReloadAction didReloadAction;
//获取视图实例
+ (instancetype)defaultView:(NSString *)imageName withTitle:(NSString *)title;

+ (instancetype)defaultView:(NSString *)imageName withTitle:(NSString *)title isShowBtn:(BOOL)isShow;

//显示在指定view上，居中显示
- (void)showOnView:(UIView *)view;
    
//显示在指定view上，居中显示
- (void)showOnView:(UIView *)view img:(NSString*)img title:(NSString*)title;

//移除
- (void)dismiss;

//显示在指定view的下方
- (void)showDownView:(UIView *)view y:(CGFloat)y;

- (void)showOnView:(UIView *)view img:(NSString*)img title:(NSString*)title y:(CGFloat)y;

@end
