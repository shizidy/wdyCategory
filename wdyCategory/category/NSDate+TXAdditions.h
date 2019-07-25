//
//  NSDate+Estension.h
//  新浪微博
//
//  Created by xc on 15/3/11.
//  Copyright (c) 2015年 xc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TXAdditions)
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为前天
 */
- (BOOL)isBeforeYesterday;
/**
 *  是否为3天前
 */
- (BOOL)isBeforeYesterdayBefore;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;

+ (NSDate *)dateWithString:(NSString *)string dateFormat:(NSString *)dateFormat;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;

+ (NSDateComponents *)componentsFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

- (NSString *)getYYMMDD;

+ (NSString *)todayDate;

+ (NSString *)yesterdayDate;

+ (NSArray *)lastWeekDate;

+ (NSString *)dateFromTodayWithDays:(NSInteger)days;

@end
