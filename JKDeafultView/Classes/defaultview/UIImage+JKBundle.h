//
//  UIImage+JKBundle.h
//  FBSnapshotTestCase
//
//  Created by admin on 2019/8/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JKBundle)
+ (instancetype)jk_imgWithName:(NSString *)name bundle:(NSString *)bundleName targetClass:(Class)targetClass;
@end

NS_ASSUME_NONNULL_END
