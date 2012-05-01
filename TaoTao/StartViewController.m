//
//  StartViewController.m
//  TaoTao
//
//  Created by Tom Callon (Hotmail) on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.navigationController.navigationBarHidden = YES;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)StartReadingButton:(id)sender {
    
    [self performSegueWithIdentifier:@"startViewSegue" sender:self];
}

- (IBAction)MyVacabulariesButton:(id)sender {
    [self performSegueWithIdentifier:@"ILearnSegue" sender:self];
}

- (IBAction)settingsButton:(id)sender {
    
    [self performSegueWithIdentifier:@"SettingsSegue" sender:self];
}

- (IBAction)aboutUsButton:(id)sender {
    
    [self performSegueWithIdentifier:@"AboutUsSegue" sender:self];
}
@end
