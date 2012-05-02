//
//  SF.m
//  BW900
//
//  Created by Gu David on 11-5-27.
//  Copyright 2011 gsxing. All rights reserved.
//

#import "SF.h"
#import "AppDelegate.h"
#import "ViewController.h"

@implementation SF

+ (AppDelegate *)appdelegate{
	return [[UIApplication sharedApplication] delegate];
}

+ (CGFloat)SWidth{
	return 1024;
}

+ (CGFloat)SHeight{
	return 768;
}

+ (NSMutableDictionary *)Dict{
	return [[self appdelegate] appDict];
}

+ (BOOL) isiPad
{
    BOOL isIpad = NO;
    if(UI_USER_INTERFACE_IDIOM())
        isIpad = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);    
    return  isIpad;
}
+ (CGRect)lsRect
{   
    CGRect _lsRect = CGRectMake(0, 0, 1004, 768);
    return _lsRect;
}
+ (BOOL)showBuy{
	if ([[[SF Dict] objectForKey:@"payed"] boolValue]) {
		return NO;
	}
	int chapter = [[[SF Dict] objectForKey:@"chapter"] intValue];
    NSLog(@"what is the chapter :%d",chapter);
	if ((chapter < 4 && chapter >= 0) || (chapter > 100 && chapter < 104 )) {
		return NO;
	}
//	[[self appdelegate].viewController.view addSubview:[self appdelegate].buyController.view];
//    [[self appdelegate].viewController.view bringSubviewToFront:[self appdelegate].buyController.view];
//	[self appdelegate].buyController.view.center = CGPointMake([self SWidth]/2, [self SHeight]/2); 
    
	return YES;
}


@end



@implementation AF(APP)

@end


@implementation DF(APP)

+ (sqlite3 *)db{
	return [[SF appdelegate] db];
    
    
    
    
    
    
}
@end
