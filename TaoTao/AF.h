//
//  GPF.h
//  WordList
//
//  Created by Gu David on 11-2-24.
//  Copyright 2011 gsxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AF : NSObject {}

#pragma mark -
#pragma mark should rewrite
+ (NSString *)privateKey;
+ (void)buySuccess;


#pragma mark -
#pragma mark don't rewrite

+ (NSString *) md5:(NSString*)str;
+ (NSString *) hashf:(NSString *)str;
+ (NSString *)cachesDir;
+ (NSString *)payedFile;
+ (BOOL)payedCheck;
+ (void)payedSave;

@end
