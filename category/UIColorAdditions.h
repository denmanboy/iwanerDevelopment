//
//  UIColorAdditions.h
//  DWiPhone
//
//  Created by yuanbo on 14-3-5.
//  Copyright 2014 yuanbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (Extends)



+ (UIColor *) colorWithHex:(NSString *)hexColor;


+ (UIColor*)colorWithHue:(CGFloat)h saturation:(CGFloat)s value:(CGFloat)v alpha:(CGFloat)a;

- (UIColor*)multiplyHue:(CGFloat)hd saturation:(CGFloat)sd value:(CGFloat)vd;

- (UIColor*)addHue:(CGFloat)hd saturation:(CGFloat)sd value:(CGFloat)vd;

- (UIColor*)copyWithAlpha:(CGFloat)newAlpha;

/**
 * Uses multiplyHue to create a lighter version of the color.
 */
- (UIColor*)highlight;

/**
 * Uses multiplyHue to create a darker version of the color.
 */
- (UIColor*)shadow;

- (CGFloat)hue;

- (CGFloat)saturation;

- (CGFloat)value;
@end
