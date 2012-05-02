//
//  FirstPageViewController.m
//  TaoTao
//
//  Created by Tom Callon (Hotmail) on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstPageViewController.h"

@interface FirstPageViewController ()

@end

@implementation FirstPageViewController
@synthesize imageView =_imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view.
//}


-(void)dealloc{
    
    
    [super dealloc];
    [_imageView release];
    
    
}

-(void)loadView{
    
         
        NSInteger pageInteger  =5;
        NSString *pageName  = [NSString stringWithFormat:@"%d.png",pageInteger];
        UIImage *image = [UIImage imageNamed:pageName];
        UIImageView *imageView;
        imageView = [[UIImageView alloc]initWithImage:image];
         self.imageView = imageView;
        [_imageView  setFrame:CGRectMake(0, 0, 1024, 680)];
    
//        [self.view insertSubview:_imageView atIndex:0];
//        [imageView release];
    
    
        UIView * view = [[UIView alloc]init];
        [view setFrame:CGRectMake(0,0,1024,680)];
        [view addSubview:_imageView];
        [imageView release];
        self.view =view;
    


}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
