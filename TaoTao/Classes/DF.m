//
//  GPF.m
//  WordList
//
//  Created by Gu David on 11-2-24.
//  Copyright 2011 gsxing. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "DF.h"

@implementation DF

#pragma mark -
#pragma mark sqlite3 数据库对象--（必须重写）
+ (sqlite3 *)db{
	return nil;
}


#pragma mark -
#pragma mark - 执行SQL语句 （不建议重写）

+ (NSInteger)version{
	return 200;
}

+ (void)sqlExec:(NSString *)str{
	if (![self db]) {
		return;
	}
	NSLog(@"exec:%@",str); //debug
	const char *sql = [str UTF8String];
	sqlite3_stmt *dbps;
	sqlite3_prepare_v2([self db], sql, -1, &dbps, NULL);
	sqlite3_step(dbps);
	sqlite3_finalize(dbps);
}


#pragma mark -
#pragma mark - 从数据库读取若干数据到数组 （不建议重写）

+ (NSArray *)sel:(NSString *)table fs:(NSArray *)fields wh:(NSString *)where{
	if ([self db] == nil || fields == nil) {
		return nil;
	}
	NSMutableArray *arr = [NSMutableArray array];
	int fn = [fields count];
	NSString *fstr = [fields componentsJoinedByString:@","];
	NSString *kWhere = nil;
	if (where == nil || [@"" isEqualToString:where]) {
		kWhere = @"";
	} else {
		kWhere = @" where ";
	}
	NSString *sqlNS = [NSString stringWithFormat:@"select %@ from %@%@%@",fstr,table,kWhere,where];
	NSLog(@"fetch records: %@",sqlNS); //debug
	const char *selectSql = [sqlNS UTF8String];
	sqlite3_stmt *dbps;
	int dbrc = sqlite3_prepare_v2([self db], selectSql, -1, &dbps, NULL);
	while ((dbrc = sqlite3_step(dbps)) == SQLITE_ROW){
		NSMutableArray *objs = [NSMutableArray array];
		for (int i = 0; i < fn; i++) {
			[objs addObject:[NSString stringWithUTF8String:(char*)sqlite3_column_text(dbps, i)]];
		}
		NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjects:objs forKeys:fields];
		[arr addObject:dict];
	}
	sqlite3_finalize(dbps);
	return (NSArray *)arr;
}


#pragma mark -
#pragma mark - 从数据库读取一条数据 （不建议重写）

+ (NSMutableDictionary *)fetchOne:(NSString *)table fs:(NSArray *)fields wh:(NSString *)where{
	if ([self db] == nil || fields == nil) {
		return nil;
	}
	int fn = [fields count];
	NSString *fstr = [fields componentsJoinedByString:@","];
	NSString *kWhere = nil;
	if (where == nil || [@"" isEqualToString:where]) {
		kWhere = @" limit 1";
	} else {
		kWhere = @" where ";
	}
	NSString *sqlNS = [NSString stringWithFormat:@"select %@ from %@%@%@",fstr,table,kWhere,where];
	NSLog(@"fetch a record: %@",sqlNS); //debug
	const char *selectSql = [sqlNS UTF8String];
	sqlite3_stmt *dbps;
	int dbrc = sqlite3_prepare_v2([self db], selectSql, -1, &dbps, NULL);
	NSMutableDictionary *dict = nil;
	if ((dbrc = sqlite3_step(dbps)) == SQLITE_ROW){
		NSMutableArray *objs = [NSMutableArray array];
		for (int i = 0; i < fn; i++) {
			[objs addObject:[NSString stringWithUTF8String:(char*)sqlite3_column_text(dbps, i)]];
		}		
		dict = [NSMutableDictionary dictionaryWithObjects:objs forKeys:fields];
	}
	sqlite3_finalize(dbps);
	return dict;
}

#pragma mark -
#pragma mark - 插入一条数据

+ (void)insert:(NSString *)table data:(NSDictionary *)dict{
	if ([self db] == nil) {
		NSLog(@"DF：没有打开数据库");
		return;
	}
	if ([dict count] < 1) {
		NSLog(@"DF：插入的数据为空");
		return;
	}
	NSString *keys = [[dict allKeys] componentsJoinedByString:@","];
	NSString *vstr = [[dict allValues] componentsJoinedByString:@"@3KG8i@,@3KG8i@"];
	NSString *vstr2 = [vstr stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
	NSString *values = [vstr2 stringByReplacingOccurrencesOfString:@"@3KG8i@" withString:@"'"];
	NSString *sqlNS = [NSString stringWithFormat:@"insert into %@ (%@) values ('%@')",table,keys,values];
	[self sqlExec:sqlNS];
}

@end
