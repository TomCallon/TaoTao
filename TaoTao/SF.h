//
//  SF.h
//  BW900
//
//  Created by Gu David on 11-5-27.
//  Copyright 2011 gsxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AF.h"
#import "DF.h"

@class AppDelegate;

@interface SF : NSObject{
	
}

+ (AppDelegate *)appdelegate;
+ (CGFloat)SWidth;
+ (CGFloat)SHeight;
+ (NSMutableDictionary *)Dict;
+ (BOOL) isiPad;
+ (CGRect)lsRect;
+ (BOOL)showBuy;
@end


@interface AF(APP)

@end



@interface DF(APP)

@end

