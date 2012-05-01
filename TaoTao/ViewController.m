//
//  ViewController.m
//  TaoTao
//
//  Created by Tom Callon (Hotmail) on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SF.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize pageInteger;
@synthesize backButton = _backButton;
@synthesize textLabel = _textLabel;
@synthesize pageNumberLabel =_pageNumberLabel;
@synthesize autoPlayingButton =_autoPlayingButton;
@synthesize imageView =_imageView;
-(void)dealloc{
    
    
    [super dealloc];
//    [_backButton release];
//    [_textLabel release];
//    [_pageNumberLabel release];
//    [_autoPlayingButton release];
//    [_imageView release];

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    [self showPage:1];
    [self addContentsButtons:1];

    [self.navigationController.navigationBar setHidden:YES];
    
    
    [self.view addSubview: [self backButton]];
    [self.view addSubview:[self textLabel]];
    [self.view addSubview: [self pageNumberLabel]];
    [self.view addSubview:[self autoPlayingButton]];



}

-(UIButton *)backButton {
    UIButton *backButt;
    if (_backButton == nil) {
    backButt = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 70, 50)];

    }
    [backButt addTarget:self action:@selector(TomCallonpopViewController) forControlEvents:UIControlEventTouchUpInside];
    self.backButton  = backButt;
    UIImage *image = [UIImage imageNamed:@"back_pressed@2x.png"];
    [backButt setBackgroundImage:image forState:UIControlStateNormal];
    [backButt release];
    return _backButton;
}
-(UILabel *)pageNumberLabel{
  
    UILabel *label;
    CGRect frame = CGRectMake(960, 620, 50, 50);
    if (_pageNumberLabel ==nil) {
        label = [[UILabel alloc]initWithFrame:frame];
        [label setTextAlignment:UITextAlignmentCenter];
        [label setText:@"1"];
        [label setTextColor:[UIColor redColor]];
    }
    self.pageNumberLabel = label;
    [label release];
    return _pageNumberLabel;

}

-(UILabel *)textLabel{

    UILabel *label;
    CGRect frame = CGRectMake(110, 470, 320, 150);
    if (_textLabel == nil) {
        label = [[UILabel alloc]initWithFrame:frame];
        label.backgroundColor = [UIColor clearColor];
        [label setText:@"        One  day, a  penguin comes to the zoo. And the tiger, elephant, monkey,and giraffe in the zoo say hello to him one after another .” \r\n Taotao says : “Hello ,guys ,I am Taotao”"];
        label.numberOfLines = 0;
    }
    [_textLabel setTextColor:[UIColor brownColor]];
    self.textLabel = label;
    [label release];
    return _textLabel;
}


-(void)showPage :(NSInteger)pageNumber {
    
    

    NSString *pageN = [NSString stringWithFormat:@"%d",pageNumber];
    [_pageNumberLabel setText:pageN];
    
    NSString *page0 = [NSString stringWithFormat:@"TomCallon"];
    NSString *page1 = [NSString stringWithFormat:@"        One  day, a  penguin comes to the zoo. And the tiger, elephant, monkey,and giraffe in the zoo say hello to him one after another .” \r\n Taotao says : “Hello ,guys ,I am Taotao”"];  
    NSString *page2 = [NSString stringWithFormat:@"        Because of the arrival of Taotao,the zoo was crammed with people everyday.All the tourists had taken out their cameras and took little snap shots of cute faces of Taotao.But gradually,the enthusiasm of the tourists declined,and the zoo returned to the normal."];
    NSString *page3 = [NSString stringWithFormat:@"One night,the gate guard forgot to lock up the door of the zoo,Taotao escaped from the zoo.Outside the zoo were skyscrapers everywhere.The whole city was shining out marvelous light.  Surrounded by the remarkable light,Taotao,didn’t know where to go."];
    NSString *page4 = [NSString stringWithFormat:@"The sun rose slowly, and with each passing moment, the number of people and cars around Taotao increased .Taotao walked into the middle of the road,interrupting the traffic. People started honking their car horns at him angrily."];
    NSString *page5 = [NSString stringWithFormat:@"Soon Taotao realized he was so hungry. Fortunately, he met a chef and said,”Mr. Chef,will you be kind enough to give me a fish?”The chef took a look at Taotao,who didn’t have a penny in his pocket, and shook his head reluctantly."];
    NSString *page6= [NSString stringWithFormat:@"Still hungry, Taotao also realized he was so thirsty. He met a old granny,”Granny,will you be kind enough to give me some water?”Granny pumped her reading glasses and said,”Who are you?”"];
    NSString *page7 = [NSString stringWithFormat:@"Taotao was so hungry and thirsty that he had to stop.With nowhere else to go, he decided to go back to the zoo. The Tiger, the elephant, the monkey, and the giraffe were all so happy and said,”Taotao,welcome home!“Taotao had travelled the whole city, but realized there was no place like home."];
    NSArray *pageTextArray = [NSArray arrayWithObjects:page0,page1,page2,page3,page4,page5,page6,page7,nil] ;
    
    CGRect frame;
    CGRect playButtonframe;

    NSString *pageText;
    switch (pageInteger) {
        case 1:
            frame = CGRectMake(110, 470, 320, 150);
            playButtonframe = CGRectMake(450, 650, 70, 70);

            pageText = [pageTextArray objectAtIndex:pageInteger];
            [_textLabel setTextColor:[UIColor brownColor]];
            [_autoPlayingButton setFrame:playButtonframe];

            
            ///TaoTao
            UIButton *taotaoButton = [[UIButton alloc]initWithFrame:CGRectMake(580, 560, 190, 250)];
            
            UIImage *taotaoImage = [UIImage imageNamed:@"taotao.png"];
            [taotaoButton setBackgroundImage:taotaoImage forState:UIControlStateNormal];
            taotaoButton.backgroundColor = [UIColor clearColor];
            [taotaoButton setCenter:CGPointMake(550, 520)];   
            [self.view addSubview:taotaoButton];
            
            ///elephant
            UIButton *elephantButton = [[UIButton alloc]initWithFrame:CGRectMake(480, 485, 200, 300)];
            UIImage *elephantImage = [UIImage imageNamed:@"elephant.png"];
            [elephantButton setBackgroundImage:elephantImage forState:UIControlStateNormal];
            elephantButton.backgroundColor = [UIColor clearColor];
            [elephantButton setCenter:CGPointMake(500, 200)];
            [self.view addSubview:elephantButton];
            
                       
            
            ///tiger
            UIButton *tigerButton = [[UIButton alloc]initWithFrame:CGRectMake(780, 185, 240, 230)];
            UIImage *tigerImage = [UIImage imageNamed:@"tiger.png"];
            [tigerButton setBackgroundImage:tigerImage forState:UIControlStateNormal];
            tigerButton.backgroundColor = [UIColor clearColor];
            [tigerButton setCenter:CGPointMake(680, 100)];   
            [self.view addSubview:tigerButton];
            
            ///giraffe
            UIButton *giraffeButton = [[UIButton alloc]initWithFrame:CGRectMake(680, 475, 170, 360)];
            UIImage *giraffeImage = [UIImage imageNamed:@"giraffe.png"];
            [giraffeButton setBackgroundImage:giraffeImage forState:UIControlStateNormal];
            giraffeButton.backgroundColor = [UIColor clearColor];
            [giraffeButton setCenter:CGPointMake(700, 330)];   
            [self.view addSubview:giraffeButton];
            
            ///monkey
            UIButton *monkeyButton = [[UIButton alloc]initWithFrame:CGRectMake(700, 330, 90, 200)];
            UIImage *monkeyImage = [UIImage imageNamed:@"monkey.png"];
            [monkeyButton setBackgroundImage:monkeyImage forState:UIControlStateNormal];
            monkeyButton.backgroundColor = [UIColor clearColor];
            [monkeyButton setCenter:CGPointMake(700, 250)];   
            [self.view addSubview:monkeyButton];


            
            
            

            
            
            break;
        case 2:
            frame = CGRectMake(220, 40, 380, 150);
            pageText = [pageTextArray objectAtIndex:pageInteger];
            [_textLabel setTextColor:[UIColor brownColor]];
            playButtonframe = CGRectMake(600, 150, 70, 70);
            [_autoPlayingButton setFrame:playButtonframe];
            [_autoPlayingButton setCenter:CGPointMake(600, 190)];


            break;
        case 3:
            frame = CGRectMake(80, 523, 390, 150);
            pageText = [pageTextArray objectAtIndex:pageInteger];
            [_textLabel setTextColor:[UIColor whiteColor]];
            playButtonframe = CGRectMake(430, 625, 70, 70);
            [_autoPlayingButton setFrame:playButtonframe];
            [_autoPlayingButton setCenter:CGPointMake(470, 670)];

            break;
        case 4:
            frame = CGRectMake(510, 20, 320, 150);
            pageText = [pageTextArray objectAtIndex:pageInteger];
            [_textLabel setTextColor:[UIColor brownColor]];
            playButtonframe = CGRectMake(780, 120, 70, 70);
            [_autoPlayingButton setFrame:playButtonframe];
            [_autoPlayingButton setCenter:CGPointMake(830, 170)];


            break;
        case 5:
            frame = CGRectMake(650, 470, 320, 150);
            pageText = [pageTextArray objectAtIndex:pageInteger];
            [_textLabel setTextColor:[UIColor brownColor]];
            playButtonframe = CGRectMake(930, 570, 70, 70);
            [_autoPlayingButton setFrame:playButtonframe];
            [_autoPlayingButton setCenter:CGPointMake(970, 620)];

            break;
        case 6:
            frame = CGRectMake(610, 43, 350, 150);
            pageText = [pageTextArray objectAtIndex:pageInteger];
            [_textLabel setTextColor:[UIColor brownColor]];
            playButtonframe = CGRectMake(960, 200, 70, 70);
            [_autoPlayingButton setFrame:playButtonframe];
            [_autoPlayingButton setCenter:CGPointMake(960, 190)];


            break;
        case 7:
            frame = CGRectMake(350, 500, 320, 180);
            pageText = [pageTextArray objectAtIndex:pageInteger];
            [_textLabel setTextColor:[UIColor brownColor]];
            playButtonframe = CGRectMake(670, 680, 70, 70);
            [_autoPlayingButton setFrame:playButtonframe];
            [_autoPlayingButton setCenter:CGPointMake(670, 680)];

            break;
        default:
            break;
    }
    [_textLabel setFrame:frame];
    [_textLabel setText:pageText];
    
    
    
    [_imageView removeFromSuperview];
    pageInteger = pageNumber;
    NSString *pageName  = [NSString stringWithFormat:@"%d.png",pageInteger];
    UIImage *image = [UIImage imageNamed:pageName];
    UIImageView *imageView;
    imageView = [[UIImageView alloc]initWithImage:image];
     _imageView = imageView;
    [_imageView  setFrame:CGRectMake(0, 0, 1024, 680)];
    [self.view insertSubview:_imageView atIndex:0];
    [imageView release];
    

    
}


-(void)addContentsButtons :(NSInteger)buttonNumbers{

    
    
    
}

- (IBAction)pageBackButton:(id)sender {
     
    
    
    NSLog(@" click pageBack Button");
    NSInteger count = 1;
    
    if (pageInteger == 1) {
        pageInteger = 1;
        NSLog(@"已经是第一页");
        return;
    }
    pageInteger =  pageInteger - count;
    [self showPage:pageInteger];
   

}



- (IBAction)pageForwardButton:(id)sender {
    
    NSLog(@" click pageForward Button");
    NSInteger count = 1;
    
    if (pageInteger == 7) {
        pageInteger = 7;
        NSLog(@"已经是最后一页");
        return;
    }
    pageInteger = count +pageInteger;
    [self showPage:pageInteger];
}


- (IBAction)backButton:(id)sender
{

    [self TomCallonpopViewController];    
}


-(void)TomCallonpopViewController {
    
    [self.navigationController popViewControllerAnimated:YES];

}


- (UIImage *)autoPlayingImage{
	if ([[[SF Dict] objectForKey:@"autoPlaying"] boolValue]) {
		return [UIImage imageNamed:@"stop.png"];
	} else {
		return [UIImage imageNamed:@"play.png"];
	}
}

- (UIButton *)autoPlayingButton{
	if (_autoPlayingButton == nil) {
		_autoPlayingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CGRect frame = CGRectMake(400, 550, 70, 70);
		_autoPlayingButton.frame = frame;
		[_autoPlayingButton setImage:[self autoPlayingImage] forState:UIControlStateNormal];
		[_autoPlayingButton addTarget:self action:@selector(autoclick:) forControlEvents:UIControlEventTouchUpInside];
		[_autoPlayingButton retain];
	}
	return _autoPlayingButton;
}

- (void)autoclick:(UIButton *)sender{
    
   	BOOL state = ![[[SF Dict] objectForKey:@"autoPlaying"] boolValue];
	NSString *str = state ? @"1" : @"0";
	[[SF Dict] setObject:str forKey:@"autoPlaying"];
    [sender setImage:[self autoPlayingImage] forState:UIControlStateNormal];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [self setBackButton:nil];
    [self setPageNumberLabel:nil];
    [self setTextLabel:nil];
    [self setAutoPlayingButton:nil];
    [self setImageView:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


@end
