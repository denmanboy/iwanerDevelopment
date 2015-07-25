//
//  UIImage+Extend.m
//  MobbyAssistant
//
//  Created by liyuanbo on 5/6/15.
//  Copyright (c) 2015 mobby. All rights reserved.
//

#import "UIImage+Extend.h"
#import <AssetsLibrary/AssetsLibrary.h>


@implementation UIImage (Extend)

+ (UIImage *)getPathImageWithName:(NSString *)imageName
{

    NSData *imageData = nil;
    
    if (SCREEN_HEIGHT > 700) {
        
        NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@@3x",imageName] ofType:@"png"];
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@@3x",imageName] ofType:@"png"]];
            return  [self imageWithData:imageData scale:3.0];
        }else
        {
            NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@@2x",imageName] ofType:@"png"];
            
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@@2x",imageName] ofType:@"png"]];
                return  [self imageWithData:imageData scale:2.0];
            }else
            {
                imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:imageName ofType:@"png"]];
                UIImage *image = [UIImage imageWithData:imageData];
                return image;
            }
        }
        
     
        
    }else
    {
        
        NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@@2x",imageName] ofType:@"png"];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@@2x",imageName] ofType:@"png"]];
            return  [self imageWithData:imageData scale:2.0];
        }else
        {
            imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:imageName ofType:@"png"]];
            UIImage *image = [UIImage imageWithData:imageData];
            return image;
        }
    }

    
    return nil;
}


//从相册取出的图片进行角度调整
+ (UIImage *)fixOrientation:(UIImage *)aImage withImage:(NSString *)imageOrientation {
    
    // No-op if the orientation is already correct
    
    NSInteger orientation = [imageOrientation integerValue];
    //    UIImageOrientationUp,            // default orientation
    //    UIImageOrientationDown,          // 180 deg rotation
    //    UIImageOrientationLeft,          // 90 deg CCW
    //    UIImageOrientationRight,         // 90 deg CW
    //    UIImageOrientationUpMirrored,    // as above but image mirrored along other axis. horizontal flip
    //    UIImageOrientationDownMirrored,  // horizontal flip
    //    UIImageOrientationLeftMirrored,  // vertical flip
    //    UIImageOrientationRightMirrored,
    
    
    if (orientation == 0 || (orientation != 1 && orientation != 2 && orientation != 3)) {
        return aImage;
    }
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (orientation) {
        case 1:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case 2:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case 3:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.width);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.height, aImage.size.width,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    
    
    if (orientation == 1) {
        ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                    CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                    CGImageGetColorSpace(aImage.CGImage),
                                    CGImageGetBitmapInfo(aImage.CGImage));
    }
    
    
    
    
    
    CGContextConcatCTM(ctx, transform);
    switch (orientation) {
            
        case 1:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
        case 2:      //左
        case 3:      //右
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    
    
    return img;
}


//相机拍照后调整角度
+ (UIImage *)correctImageDirectionWithImage:(UIImage *)image
{
    
    UIImageOrientation imageOrientation=image.imageOrientation;
    if(imageOrientation == 3)
    {
        // 原始图片可以根据照相时的角度来显示，但UIImage无法判定，于是出现获取的图片会向左转９０度的现象。
        // 以下为调整图片角度的部分
        UIGraphicsBeginImageContext(image.size);
        [image drawInRect:CGRectMake(0, 0, image.size.width , image.size.height)];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        // 调整图片角度完毕
    }
    return image;
}



//根据缩略图相片在相册中的url 找到相片的大图
+ (UIImage *)getFullImageWithImageUrl:(NSURL *)url callBack:(CallBackPhotosFullImageBlock)block
{
    dispatch_queue_t queqe = dispatch_get_main_queue();
    dispatch_async(queqe, ^{
        ALAssetsLibrary *libray=[[ALAssetsLibrary alloc]init];
        [libray enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            if (group != nil) {
                ALAssetsFilter *filter = [ALAssetsFilter allPhotos];
                [group setAssetsFilter:filter];
                [group enumerateAssetsUsingBlock:^(ALAsset *alSet, NSUInteger index, BOOL *stop) {
                    if (alSet != nil) {
                        if ([url isEqual: [[alSet defaultRepresentation] url]]) {
                            CGImageRef ref = [[alSet defaultRepresentation] fullResolutionImage];
                            NSString * nsALAssetPropertyOrientation = [ alSet valueForProperty:ALAssetPropertyOrientation ] ;
                            UIImage *image = [UIImage imageWithCGImage:ref];
                            
                            image = [UIImage fixOrientation:image withImage:nsALAssetPropertyOrientation];
                            image = [UIImage compressImageWithImage:image];
                            if (block) {
                                block (image);
                            }
                        }
                    }
                }];
            }
        } failureBlock:^(NSError *error) {
        }];
    });
    return nil;
}



+ (UIImage *)compressImageWithImage:(UIImage *)image {
    
    if (image.size.width < 960) {
        return image;
    }
    
    CGSize size = CGSizeMake(960.0, 960.0/image.size.width*image.size.height);
    
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}


//+ (UIImage *)compressImageToThumbnailWithImage:(UIImage *)image {
//    NSData *data = UIImageJPEGRepresentation(image, 0.1);
//    if (data == nil) {
//        data = UIImagePNGRepresentation(image);
//    }
//    if (image.size.width >2500) {
//        image = [UIImage imageWithData:data scale:15];
//    }else if (image.size.width >1500){
//        image = [UIImage imageWithData:data scale:10];
//    }else if (image.size.width >400){
//        image = [UIImage imageWithData:data scale:5];
//    }
//
//    return image;
//}




+ (UIImage*) OriginImage:(UIImage *)image
{
    
    CGSize size = CGSizeMake(210,210);
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}


+ (UIImage *) setImage:(UIImage *)image withAlpha:(CGFloat)alpha{
    // Create a pixel buffer in an easy to use format
    CGImageRef imageRef = [image CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef) ;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    UInt8 * m_PixelBuf = malloc(sizeof(UInt8) * height * width * 4);
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    
    CGContextRef context = CGBitmapContextCreate(m_PixelBuf, width, height,
                                                 bitsPerComponent, bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
    //alter the alpha
    NSInteger length = height * width * 4;
    for (int i=0; i<length; i+=4)
    {
        m_PixelBuf[i+3] = 255*alpha;
    }
    
    //create a new image
    
    CGContextRef ctx = CGBitmapContextCreate(m_PixelBuf, width, height,
                                             bitsPerComponent, bytesPerRow, colorSpace,
                                             kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGImageRef newImgRef = CGBitmapContextCreateImage(ctx);
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(ctx);
    free(m_PixelBuf);
    UIImage *finalImage = [UIImage imageWithCGImage:newImgRef];
    CGImageRelease(newImgRef);
    return finalImage;
}





@end
