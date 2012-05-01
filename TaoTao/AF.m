//
//  GPF.m
//  WordList
//
//  Created by Gu David on 11-2-24.
//  Copyright 2011 gsxing. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "AF.h"

@implementation AF

#pragma mark -
#pragma mark 以下方法需要根据不同的程序进行重写
+ (NSString *)privateKey{return nil;}
+ (void)buySuccess{}


#pragma mark -
#pragma mark 以下方法不建议进行重写



//自定义md5加密,与公认的md5不同
+ (NSString *) md5:(NSString*)str{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
			@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
			result[15], result[1], result[2], result[3], result[4], result[13], result[6], result[7],
			result[8], result[9], result[10], result[11],result[12], result[5], result[14], result[0],
			result[9],result[3],result[11],result[8]
			];
}

//加密字符串2,采用md5算法
+ (NSString *) hashf:(NSString*)str{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
			@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
			result[15], result[1], result[2], result[3],result[4], result[13], result[6], result[0],
			result[5], result[9], result[8], result[7],result[14], result[12], result[11],result[10]
			];
}

/***
 *
 * 用来存放数据的Cache文件夹路径
 *
 */

+ (NSString *)cachesDir{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
}


/***
 *
 * 注册信息存放路径及文件名称
 *
 */

+ (NSString *)payedFile{
	NSString *fileName = [self hashf:@"email:tomcallon2010@gmail.com"];
	return [NSString stringWithFormat:@"%@/%@",[self cachesDir],fileName];
}

/***
 ** 支付验证
 **
 **/

+ (BOOL)payedCheck{
	BOOL Payed = NO;
	NSString *privateKeyString = [self privateKey];
	if (privateKeyString == nil || [@"" isEqualToString:privateKeyString]) {
		return Payed;
	}
	NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[self payedFile]];
	NSString *sn = [dict objectForKey:@"sn"]; //随机编号
	NSString *m32 = [dict objectForKey:@"m32"]; //加密字串(用于验证)
    
    
    CFStringRef ref = CFUUIDCreateString(kCFAllocatorDefault,
                                         CFUUIDCreate(kCFAllocatorDefault));
    NSString *uuid = (NSString *)ref;
    NSLog(@"uuid:%@", uuid);
    //将uuid保存
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:uuid forKey:@"udid"];
    [defaults synchronize];
    CFRelease(ref);

	NSString *udid = uuid; //UDID
	NSString *str = [NSString stringWithFormat:@"%@%@%@",sn,privateKeyString,udid]; 
	NSString *hash = [self md5:[self md5:str]];
	if ([hash isEqualToString:m32]){
		Payed = YES;
	}
	return Payed;
}

/***
 * 保存注册信息
 *
 */

+ (void)payedSave{
	NSString *privateKeyString = [self privateKey];
	if (privateKeyString == nil || [@"" isEqualToString:privateKeyString]) {
		return;
	}
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSString *udid = [defaults objectForKey:@"udid"]; //UDID
    
    
    
	NSString *sn = [self md5:[NSString stringWithFormat:@"%d",udid]]; //随机数加密串
	NSString *str = [NSString stringWithFormat:@"%@%@%@", sn, privateKeyString, udid];
	NSString *m32 = [self md5:[self md5:str]];
	NSArray *objs = [NSArray arrayWithObjects:sn,m32,nil];
	NSArray *keys = [NSArray arrayWithObjects:@"sn",@"m32",nil];
	NSDictionary *dict = [NSDictionary dictionaryWithObjects:objs forKeys:keys];
	[dict writeToFile:[self payedFile] atomically:NO];	
}


@end
