//
//  AppDelegate.m
//  TaoTao
//
//  Created by Tom Callon (Hotmail) on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "AF.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (NSMutableDictionary *)appDict{
	if (_appDict == nil) {
		_appDict = [[NSMutableDictionary alloc] init];
        NSString *strPayed = [AF payedCheck] ? @"1" : @"0";
        [_appDict setObject:strPayed forKey:@"payed"];
	}
	return _appDict;
}

- (sqlite3 *)db{
	if (!_db) {
		BOOL copiedBackupDb = NO;
		NSString *dbFilePath = [[AF cachesDir] stringByAppendingPathComponent:[AF hashf:@"sc.png"]];
		if ( ![[NSFileManager defaultManager] fileExistsAtPath: dbFilePath]) {
			NSString *backupDbPath = [[NSBundle mainBundle] pathForResource:@"RootViewController" ofType:@"nib"];
			if (backupDbPath == nil){ 
                NSLog(@"The backupDBPath is nil");
                return nil;
            }
			copiedBackupDb = [[NSFileManager defaultManager] copyItemAtPath:backupDbPath toPath:dbFilePath error:nil];
			if (! copiedBackupDb){ 
                NSLog(@"The copiedBackupDb is nil");
                return nil;
            }
		}
		const char* dbFilePathUTF8 = [[NSString stringWithString:dbFilePath] UTF8String];
		sqlite3_open(dbFilePathUTF8, &_db);
	}
	return _db;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
