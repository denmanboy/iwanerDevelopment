//
//  NSDate-Helper.h
//  ViewImage
//
//  Created by yuanbo on 13-8-13.
//  Copyright 2013 yuanbo. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSDate (Helpers)


+ (BOOL)compareOneTimeIsNew:(NSString *)oneTime nextTime:(NSString *)nextTime;


//返回本周的时间格式
+ (NSDate *)currentDate;

//返回下一周的时间格式
+ (NSDate *)nextWeekFromDate:(NSDate *)date;

//返回上一周的时间格式
+ (NSDate *)previousWeekFromDate:(NSDate *)date;

//根据今天时间将自己的本周时间计算出来（课件是以周六开始）
+ (NSDate *)firstDayOfWeekFromDate:(NSDate *)date;



//该月有几天
- (NSUInteger)getDayNumOfMonth;
//该月跨几周
- (NSInteger )getWeekNumOfMonth;
//该年有几周
- (NSInteger )getWeekOfYear;
//返回day天后的日期
- (NSDate *)dateAfterDay:(NSInteger)day;
- (NSDate *)dateafterMonth:(NSInteger)month;


- (NSUInteger)getDay;
- (NSUInteger)getMonth;
- (NSUInteger)getYear;
- (NSInteger )getHour;
- (NSInteger )getMinute;
- (NSInteger)getSecond;

- (NSUInteger)daysAgo;
- (NSUInteger)daysAgoAgainstMidnight;
- (NSString *)stringDaysAgo;
- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag;
//返回周几。周日是第一天
- (NSUInteger)weekday;

//根据年月日生成日期对象
+ (NSDate *)dateFromYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day;
+ (NSDate *)dateFromString:(NSString *)string;//@"yyyy-MM-dd HH:mm:ss"
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)string;
+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed;

- (NSString *)string;
- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

//返回周日的的开始时间
- (NSDate *)beginningOfWeek; 
- (NSDate *)beginningOfMonth;
- (NSDate *)endOfMonth;
- (NSDate *)beginningOfDay;
- (NSDate *)endOfWeek;

+ (NSString *)dateFormatString;
+ (NSString *)timeFormatString;
+ (NSString *)timestampFormatString;
+ (NSString *)dbFormatString;

- (NSString *)dateStringForYearMonthDay;//@“2012-12-12”
@end