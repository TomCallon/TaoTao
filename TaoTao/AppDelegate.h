//
//  AppDelegate.h
//  TaoTao
//
//  Created by Tom Callon (Hotmail) on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSMutableDictionary *_appDict;
    sqlite3 *_db;


}

//5327d56756240b93f10a4580

@property (strong, nonatomic) UIWindow *window;
- (NSMutableDictionary *)appDict;
- (sqlite3 *)db;

@end
