//
//  JHCustomSegue.m
//  TomCallonCustomSegue
//
//  Created by Tom Callon (Hotmail) on 12/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "JHCustomSegue.h"
#import <QuartzCore/QuartzCore.h>


@implementation JHCustomSegue






-(void)perform


{
       
    
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    
    
        //[dst.view removeFromSuperview ] ;
    
    
    
        [src.view addSubview:dst.view];
        CGRect frame = CGRectMake(0, 200, 320, 152);
        [dst.view setFrame:frame];
        [dst.view.layer  setOpacity:0.0 ];
        [UIView beginAnimations:@"" context:nil];
        [UIView setAnimationDuration:3];
        frame.origin.x -= 100 ;
        [dst.view setFrame:frame];
        [dst.view.layer  setOpacity:1.0 ];

        [UIView commitAnimations];
    

    
   
    
        
           
    
    
   
    
   
    
}
@end
