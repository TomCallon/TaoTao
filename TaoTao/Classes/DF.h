//
//  GPF.h
//  WordList
//
//  Created by Gu David on 11-2-24.
//  Copyright 2011 gsxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DF : NSObject {}

#pragma mark -
#pragma mark should rewrite
//+ (sqlite3 *)db;

#pragma mark -
#pragma mark don't rewrite

+ (void)sqlExec:(NSString *)sql;
+ (NSArray *)sel:(NSString *)table fs:(NSArray *)fields wh:(NSString *)where;
+ (NSMutableDictionary *)fetchOne:(NSString *)table fs:(NSArray *)fields wh:(NSString *)where;
@end
