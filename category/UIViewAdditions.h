//
//  UIViewAdditions.h
//  DWiPhone
//
//  Created by yuanbo on 14-3-5.
//  Copyright 2014 yuanbo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kActivityTag        9212111
@interface UIView (Extends)

@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat bottom;

@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;

@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;

@property(nonatomic) CGPoint origin;
@property(nonatomic) CGSize size;



/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;


/**
 * The view controller whose view contains this view.
 */
- (UIViewController*)viewController;

- (void)setOriginY:(CGFloat)originY;
- (void)setOriginX:(CGFloat)originx;
- (void)setOriginXAdd:(CGFloat)addX;
- (void)setOriginYAdd:(CGFloat)addY;
- (void)setSizeHeight:(CGFloat)heigth;
- (void)setSizeHeightAdd:(CGFloat)addHeigth;
- (void)setSizeWidth:(CGFloat)width;
- (void)setSizeWidthAdd:(CGFloat)addWidth;

-(void)removeAllSubViews;


// DRAW GRADIENT
+ (void) drawGradientInRect:(CGRect)rect withColors:(NSArray*)colors;
+ (void) drawLinearGradientInRect:(CGRect)rect colors:(CGFloat[])colors;


// DRAW ROUNDED RECTANGLE
+ (void) drawRoundRectangleInRect:(CGRect)rect withRadius:(CGFloat)radius;

// DRAW LINE
+ (void) drawLineInRect:(CGRect)rect red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (void) drawLineInRect:(CGRect)rect colors:(CGFloat[])colors;
+ (void) drawLineInRect:(CGRect)rect colors:(CGFloat[])colors width:(CGFloat)lineWidth cap:(CGLineCap)cap;

// FILL RECT
+ (void)drawRect:(CGRect)rect fill:(const CGFloat*)fillColors radius:(CGFloat)radius;
+ (void)drawRect:(CGRect)rect fillColor:(UIColor *)fillColor radius:(CGFloat)radius;

// STROKE RECT
+ (void)strokeLines:(CGRect)rect stroke:(const CGFloat*)strokeColor ;

- (void)alphaAppearRemoveAnimation;

- (UIActivityIndicatorView *) activityWithOrigin:(CGPoint)pt;
- (UIActivityIndicatorView *) activityAtCenter;
- (UIActivityIndicatorView *) activityAtCenterWithSize:(CGSize)size;

@end
