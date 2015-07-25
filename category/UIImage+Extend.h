//
//  UIImage+Extend.h
//  MobbyAssistant
//
//  Created by liyuanbo on 5/6/15.
//  Copyright (c) 2015 mobby. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CallBackPhotosFullImageBlock) (UIImage *image);


@interface UIImage (Extend)

+ (UIImage *)getPathImageWithName:(NSString *)imageName;


//矫正图片方向
+ (UIImage *)correctImageDirectionWithImage:(UIImage *)image;

//知道image的在相册中的url 从相册中获取大图
+ (UIImage *)getFullImageWithImageUrl:(NSURL *)url callBack:(CallBackPhotosFullImageBlock )block;

//压缩图片  并改变其大小
+ (UIImage *)compressImageWithImage:(UIImage *)image;

////压缩图片成缩略图
//+ (UIImage *)compressImageToThumbnailWithImage:(UIImage *)image;

+ (UIImage*) OriginImage:(UIImage *)image;

+ (UIImage *) setImage:(UIImage *)image withAlpha:(CGFloat)alpha;

@end
