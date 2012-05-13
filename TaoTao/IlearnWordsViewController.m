//
//  IlearnWordsViewController.m
//  TaoTao
//
//  Created by Tom Callon (Hotmail) on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IlearnWordsViewController.h"

@interface IlearnWordsViewController ()

@end

@implementation IlearnWordsViewController
@synthesize list;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.list count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
    }
    
    
     NSArray *stringArray = [NSArray arrayWithObjects:@"tiger",@"elephant",@"penguin",@"giraffe",@"monkey",@"gate",@"yellow car",@"green car",@"blue car",@"glasses",@"chef",@"blown car",@"green car",@"yellow car",@"moon",@"buldings",@"camera",@"bridge",@"kids",@"clouds",nil];
    
    NSString *string  = [NSString stringWithFormat:@"%@",[stringArray objectAtIndex:indexPath.row]];
    
    cell.textLabel.text = string;
    
    NSArray *imageArray = [NSArray arrayWithObjects:@"44",@"45",@"38",@"37",@"43",@"1",@"10",@"11",@"12",@"2",@"4",@"13",@"14",@"15",@"20",@"21",@"31",@"32",@"34",@"40",nil];
    
    
    NSString *imageName = [NSString stringWithFormat:@"%@.png",[imageArray objectAtIndex:indexPath.row]];
    UIImage *image =[UIImage imageNamed:imageName];
    cell.imageView.image = image;
    return cell;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImage *background = [UIImage imageNamed:@"background.png"];
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:background];
    
    
    CGRect  iPadFrame   = CGRectMake(0, 0, 1024, 768);
    CGRect  iPhoneFrame = CGRectMake(0, 0, 480, 320);
    CGRect  iOSFrame;
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
        iOSFrame = iPadFrame;
    }else {
        iOSFrame = iPhoneFrame;
    };
    
    [backgroundImageView setFrame:iOSFrame];
    [self.view insertSubview:backgroundImageView atIndex:0];
    [backgroundImageView release];
    
    self.list = [NSArray arrayWithObjects:@"44",@"45",@"38",@"37",@"1",@"10",@"11",@"12",@"2",@"4",@"13",@"14",@"15",@"20",@"21",@"31",@"32",@"34",@"40",@"43",nil];    
  //  
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

- (IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
