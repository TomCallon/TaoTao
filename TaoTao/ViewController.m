//
//  ViewController.m
//  TaoTao
//
//  Created by Tom Callon (Hotmail) on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SF.h"
#import "FirstPageViewController.h"
#import "JHCustomSegue.h"



#define GROW_ANIMATION_DURATION_SECONDS 0.15    // Determines how fast a piece size grows when it is moved.

@interface ViewController ()

@end

@implementation ViewController
@synthesize pageInteger;
@synthesize backButton = _backButton;
@synthesize textLabel = _textLabel;
@synthesize pageNumberLabel =_pageNumberLabel;
@synthesize autoPlayingButton =_autoPlayingButton;
@synthesize currentView = _currentView;
@synthesize imageView = _imageView;

@synthesize firstPageViewController =_firstPageViewController;

@synthesize showEnglish;

@synthesize audioPlayer = _audioPlayer;



-(void)dealloc{
    
    
    [super dealloc];
    
    [_backButton release];
    [_textLabel release];
    [_pageNumberLabel release];
    [_autoPlayingButton release];

    
}

-(void)addContentsButtons :(NSInteger)pageNumbers{
    
    const float buttonLen = 110;
    const float buttonHigh = 62;
    const float buttonSepratorX = 6;
    const float buttonSepratorY = 10;
    const int buttonsPerLine = 5;
    
    CGRect  iPadFrame   = CGRectMake(0, 0, 1024, 680);
    CGRect  iPhoneFrame = CGRectMake(0, 0, 480, 280);
    CGRect  iOSFrame;
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
        iOSFrame = iPadFrame;
    }else {
        iOSFrame = iPhoneFrame;
    };

    CGRect frame = iOSFrame;
    
    
    UIView *page1View = [[UIView alloc]initWithFrame:frame];
    page1View.backgroundColor = [UIColor clearColor];
    
    UIView *page2View = [[UIView alloc]initWithFrame:frame];
    page2View.backgroundColor = [UIColor clearColor];
    
    UIView *page3View = [[UIView alloc]initWithFrame:frame];
    page3View.backgroundColor = [UIColor clearColor];
    
    UIView *page4View = [[UIView alloc]initWithFrame:frame];
    page4View.backgroundColor = [UIColor clearColor];
    
    UIView *page5View = [[UIView alloc]initWithFrame:frame];
    page5View.backgroundColor = [UIColor clearColor];
    
    UIView *page6View = [[UIView alloc]initWithFrame:frame];
    page6View.backgroundColor = [UIColor clearColor];
    
    UIView *page7View = [[UIView alloc]initWithFrame:frame];
    page7View.backgroundColor = [UIColor clearColor];
    
    UIButton *taotaoButton;
    UIButton *elephantButton;
    UIButton *tigerButton;
    UIButton *giraffeButton;
    UIButton *monkeyButton;

    
    
    
       
    NSArray * array1  = [[NSArray alloc]initWithObjects:@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46", nil];
    
    int i=0;
    int rowIndex;
    int rankIndex;

    for (NSString* levels in array1){
        
        NSString *title = levels;
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTag:i];
        rowIndex = i/buttonsPerLine;
        rankIndex = i%buttonsPerLine;
        button.frame = CGRectMake(buttonSepratorX+rankIndex*(buttonSepratorX+buttonLen), rowIndex*(buttonHigh+buttonSepratorY), buttonLen, buttonHigh);
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        NSString *imageNumber = [NSString stringWithFormat:@"%@",[array1 objectAtIndex:i]];
        UIImage *image = [UIImage imageNamed:imageNumber];
        [button setImage:image forState :UIControlStateNormal];
        [button setFrame :CGRectMake(0,0,image.size.width * 0.7,image.size.height * 0.7)];
        
        if ([button tag] ==4) {
            [button setTitle:@"fcuk" forState :UIControlStateNormal];
            [button setFrame:CGRectMake(100,200,80,80)];
            [button setImage:image forState :UIControlStateNormal];
            
        }
        [self addGestureRecognizersToPiece:button];
//        [page1View addSubview :button];
        i++;
    }

    NSArray * array2  = [[NSArray alloc]initWithObjects:@"33",@"34",@"35",@"36",@"32",@"30",@"31",@"28",@"29", nil];
    
     i=0;
     
         
    
    for (NSString* levels in array2){
        
        NSString *title = levels;
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        NSInteger buttonTag  =[title  intValue];
        [button setTag:buttonTag]; 
        rowIndex = i/buttonsPerLine;
        rankIndex = i%buttonsPerLine;
        button.frame = CGRectMake(buttonSepratorX+rankIndex*(buttonSepratorX+buttonLen), rowIndex*(buttonHigh+buttonSepratorY), buttonLen, buttonHigh);
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        NSString *imageNumber = [NSString stringWithFormat:@"%@",levels];
        UIImage *image = [UIImage imageNamed:imageNumber];
        [button setImage:image forState :UIControlStateNormal];
        [button setFrame :CGRectMake(0,0,image.size.width * 0.85,image.size.height * 0.85)];
        [self addGestureRecognizersToPiece:button];
    
        if ([button tag] ==28) {
            [button setCenter:CGPointMake(759.000000 ,196.000000 )];
        }
        if ([button tag] ==29) {
            [button setCenter:CGPointMake(678.000000 ,165.000000 )];
        }
        if ([button tag] ==30) {
            [button setCenter:CGPointMake(817.000000 ,245.000000 )];

        }
        if ([button tag] ==31) {
            [button setCenter:CGPointMake(108.000000 ,262.000000 )];
        } 
        if ([button tag] ==32) {
            [button setCenter:CGPointMake(510.049988 ,385.975006 )];
        }
        
        if ([button tag] ==33) {
            [button setCenter:CGPointMake(454.000000 ,445.000000 )];
        } 
        if ([button tag] ==34) {
            [button setCenter:CGPointMake(523.000000 ,209.000000 )];
        } 
        if ([button tag] ==35) {
            [button setCenter:CGPointMake(878.000000 ,307.000000)];
        }
        if ([button tag] ==36) {
            [button setCenter:CGPointMake(142.200012 ,308.350006 )];
        }
        [page2View addSubview :button];
        i++;
    }
    
    
    NSArray * array3  = [[NSArray alloc]initWithObjects:@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"19", nil];
    
    i=0;

    for (NSString* levels in array3){
        
        NSString *title = levels;
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        NSInteger buttonTag  =[title  intValue];
        [button setTag:buttonTag];    
        rowIndex = i/buttonsPerLine;
        rankIndex = i%buttonsPerLine;
        button.frame = CGRectMake(buttonSepratorX+rankIndex*(buttonSepratorX+buttonLen), rowIndex*(buttonHigh+buttonSepratorY), buttonLen, buttonHigh);
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        NSString *imageNumber = [NSString stringWithFormat:@"%@",levels];
        UIImage *image = [UIImage imageNamed:imageNumber];
        [button setImage:image forState :UIControlStateNormal];
        [button setFrame :CGRectMake(0,0,image.size.width * 0.85,image.size.height * 0.85)];
        [self addGestureRecognizersToPiece:button];
        
        
        if ([button tag] ==19) {
            [button setCenter:CGPointMake(586.000000 ,546.950012 )];
        }
        if ([button tag] ==20) {
            [button setCenter:CGPointMake(126.800003 ,110.425003 )];
        }
        if ([button tag] ==21) {
            [button setCenter:CGPointMake(961.175049 ,336.924988)];
        }
        if ([button tag] ==22) {
            [button setCenter:CGPointMake(895.000000 ,358.149994 )];
            
        }
        if ([button tag] ==23) {
            [button setCenter:CGPointMake(711.724976 ,245.399994)];
        }
        if ([button tag] ==24) {
            [button setCenter:CGPointMake(530.474976 ,309.799988 )];
        } 
        if ([button tag] ==25) {
            [button setCenter:CGPointMake(374.599976 ,280.250000 )];
        } 
        if ([button tag] ==26) {
            [button setCenter:CGPointMake(115.750000 ,341.125000 )];
        } 
        if ([button tag] ==27) {
            [button setCenter:CGPointMake(510.900024 ,457.950012 )];
        }
       
        

        
        
        
        [page3View addSubview :button];
        i++;
    }
    
    NSArray * array4 = [[NSArray alloc]initWithObjects:@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18", nil];
    
    i=0;
    
    for (NSString* levels in array4){
        
        NSString *title = levels;
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        NSInteger buttonTag  =[title  intValue];
        [button setTag:buttonTag];    
        rowIndex = i/buttonsPerLine;
        rankIndex = i%buttonsPerLine;
        button.frame = CGRectMake(buttonSepratorX+rankIndex*(buttonSepratorX+buttonLen), rowIndex*(buttonHigh+buttonSepratorY), buttonLen, buttonHigh);
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        NSString *imageNumber = [NSString stringWithFormat:@"%@",levels];
        UIImage *image = [UIImage imageNamed:imageNumber];
        [button setImage:image forState :UIControlStateNormal];
        [button setFrame :CGRectMake(0,0,image.size.width * 0.85,image.size.height * 0.85)];
        [self addGestureRecognizersToPiece:button];
        if ([button tag] ==9) {
            
            [button setCenter:CGPointMake(524.665039 ,602.512512)];
        }
        if ([button tag] ==10) {
            
            [button setCenter:CGPointMake(866.665039 ,460.512512)];
        } 
        if ([button tag] ==11) {
            
            [button setCenter:CGPointMake(173.832031 ,503.108032)];
        }
        if ([button tag] ==12) {
            
            [button setCenter:CGPointMake(633.125977 ,549.828003 )];
        }
        if ([button tag] ==13) {
            
            [button setCenter:CGPointMake(476.139526 ,537.139526 )];
        }
        if ([button tag] ==14) {
            
            [button setCenter:CGPointMake(764.750000 ,514.474976)];
        }
        if ([button tag] ==15) {
            
            [button setCenter:CGPointMake(327.139526 ,536.139526 )];
        }
        if ([button tag] ==16) {
            
            [button setCenter:CGPointMake(908.549988 ,259.125000 )];
        }
        if ([button tag] ==17) {
            
            [button setCenter:CGPointMake(792.025024 ,366.475006 )];
        } if ([button tag] ==18) {
            
            [button setCenter:CGPointMake(852.500000 ,332.075012 )];
        }
        
        

        [page4View addSubview :button];
        i++;
    }
    
    
    NSArray * array5 = [[NSArray alloc]initWithObjects:@"3",@"4",@"6",@"7",@"8", nil];
    
    i=0;
    
    for (NSString* levels in array5){
        
        NSString *title = levels;
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        NSInteger buttonTag  =[title  intValue];
        [button setTag:buttonTag];
        rowIndex = i/buttonsPerLine;
        rankIndex = i%buttonsPerLine;
        button.frame = CGRectMake(buttonSepratorX+rankIndex*(buttonSepratorX+buttonLen), rowIndex*(buttonHigh+buttonSepratorY), buttonLen, buttonHigh);
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        NSString *imageNumber = [NSString stringWithFormat:@"%@",levels];
        UIImage *image = [UIImage imageNamed:imageNumber];
        [button setImage:image forState :UIControlStateNormal];
        [button setFrame :CGRectMake(0,0,image.size.width * 0.857,image.size.height * 0.857)];
        [self addGestureRecognizersToPiece:button];
        if ([button tag] ==3) {
            
            [button setCenter:CGPointMake(774.665039 ,265.512512 )];
        }
        if ([button tag] ==4) {
            
            [button setCenter:CGPointMake(332.665009 ,340.512512 )];
        } 
        if ([button tag] ==6) {
            
            [button setCenter:CGPointMake(897.832031 ,197.108002)];
        }
        if ([button tag] ==7) {
            
            [button setCenter:CGPointMake(924.125977 ,280.828003 )];
        }if ([button tag] ==8) {
            
            [button setCenter:CGPointMake(928.139526 ,357.139496)];
        }


        [page5View addSubview :button];
        i++;
    }
    
    
    NSArray * array6 = [[NSArray alloc]initWithObjects:@"2",@"3", nil];
    
    i=0;
    
    for (NSString* levels in array6){
        
        NSString *title = levels;
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        NSInteger buttonTag  =[title  intValue];
        [button setTag:buttonTag];      
        rowIndex = i/buttonsPerLine;
        rankIndex = i%buttonsPerLine;
        button.frame = CGRectMake(buttonSepratorX+rankIndex*(buttonSepratorX+buttonLen), rowIndex*(buttonHigh+buttonSepratorY), buttonLen, buttonHigh);
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        NSString *imageNumber = [NSString stringWithFormat:@"%@",levels];
        UIImage *image = [UIImage imageNamed:imageNumber];
        [button setImage:image forState :UIControlStateNormal];
        [button setFrame :CGRectMake(0,0,image.size.width * 0.857,image.size.height * 0.857)];
        [self addGestureRecognizersToPiece:button];
        
        if ([button tag] ==2) {
            
            [button setCenter:CGPointMake(451.126007,444.828003)];
        }
        if ([button tag] ==3) {
            
            [button setCenter:CGPointMake(775.832031 ,474.108002)];
        }
        

        [page6View addSubview :button];
        i++;
    }
    
    
    ///TaoTao
    taotaoButton = [[UIButton alloc]initWithFrame:CGRectMake(580, 560, 190, 250)];
    
    UIImage *taotaoImage = [UIImage imageNamed:@"39.png"];
    [taotaoButton setTag:0];
    [taotaoButton setBackgroundImage:taotaoImage forState:UIControlStateNormal];
    
    [taotaoButton addTarget:self action:@selector(animalButtonWasClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    taotaoButton.backgroundColor = [UIColor clearColor];
    [taotaoButton setCenter:CGPointMake(550, 520)]; 
    [taotaoButton removeFromSuperview];
    [page1View addSubview :taotaoButton];


    ///elephant
    elephantButton = [[UIButton alloc]initWithFrame:CGRectMake(480, 485, 200, 300)];
    UIImage *elephantImage = [UIImage imageNamed:@"45.png"];
    [elephantButton setTag:1];
    [elephantButton setBackgroundImage:elephantImage forState:UIControlStateNormal];
    
    [elephantButton addTarget:self 
                       action:@selector(animalButtonWasClicked:) 
             forControlEvents:UIControlEventTouchUpInside];
    
    elephantButton.backgroundColor = [UIColor clearColor];
    [elephantButton setCenter:CGPointMake(370, 200)];
    [elephantButton removeFromSuperview];
    [page1View addSubview :elephantButton];
    [elephantButton release];
    
    
    ///tiger
    tigerButton = [[UIButton alloc]initWithFrame:CGRectMake(780, 185, 240, 200)];
    UIImage *tigerImage = [UIImage imageNamed:@"44.png"];
    [tigerButton setTag:2];
    
    [tigerButton setBackgroundImage:tigerImage forState:UIControlStateNormal];
    [tigerButton addTarget:self 
                    action:@selector(animalButtonWasClicked:) 
          forControlEvents:UIControlEventTouchUpInside];
    
    tigerButton.backgroundColor = [UIColor clearColor];
    [tigerButton setCenter:CGPointMake(700, 100)];
    [tigerButton removeFromSuperview];
    [page1View addSubview :tigerButton];
    [tigerButton release];
    
    ///giraffe
    giraffeButton = [[UIButton alloc]initWithFrame:CGRectMake(680, 475, 150, 350)];
    UIImage *giraffeImage = [UIImage imageNamed:@"37.png"];
    [giraffeButton setTag:3];
    [giraffeButton setBackgroundImage:giraffeImage forState:UIControlStateNormal];
    
    [giraffeButton addTarget:self 
                      action:@selector(animalButtonWasClicked:) 
            forControlEvents:UIControlEventTouchUpInside];
    
    giraffeButton.backgroundColor = [UIColor clearColor];
    [giraffeButton setCenter:CGPointMake(700, 350)]; 
    [giraffeButton removeFromSuperview];
    [page1View addSubview :giraffeButton];
    [giraffeButton release];
    
    
    ///monkey
    monkeyButton = [[UIButton alloc]initWithFrame:CGRectMake(700, 330, 90, 200)];
    UIImage *monkeyImage = [UIImage imageNamed:@"43.png"];
    [monkeyButton setTag:4];
    [monkeyButton setBackgroundImage:monkeyImage forState:UIControlStateNormal];
    
    [monkeyButton addTarget:self 
                     action:@selector(animalButtonWasClicked:)
           forControlEvents:UIControlEventTouchUpInside];
    
    monkeyButton.backgroundColor = [UIColor clearColor];
    [monkeyButton setCenter:CGPointMake(710, 300)];  
    [monkeyButton removeFromSuperview];
    [page1View addSubview :monkeyButton];
    [monkeyButton release];
    

//    ///monkey
//    monkeyButton = [[UIButton alloc]initWithFrame:CGRectMake(700, 330, 90, 200)];
//    UIImage *monkeyImage1 = [UIImage imageNamed:@"4.png"];
//    [monkeyButton setTag:4];
//    [monkeyButton setBackgroundImage:monkeyImage1 forState:UIControlStateNormal];
//    
//    [monkeyButton addTarget:self 
//                     action:@selector(animalButtonWasClicked:)
//           forControlEvents:UIControlEventTouchUpInside];
//    
//    monkeyButton.backgroundColor = [UIColor clearColor];
//    [monkeyButton setCenter:CGPointMake(710, 300)];  
//    [monkeyButton removeFromSuperview];
//    [page7View addSubview:monkeyButton];
//    [page1View addSubview :monkeyButton];
//    [monkeyButton release];
    
    
    
    
//    ///monkey
//    monkeyButton = [[UIButton alloc]initWithFrame:CGRectMake(700, 330, 90, 200)];
//    UIImage *monkeyImage2 = [UIImage imageNamed:@"44.png"];
//    [monkeyButton setTag:4];
//    [monkeyButton setBackgroundImage:monkeyImage2 forState:UIControlStateNormal];
//    
//    [monkeyButton addTarget:self 
//                     action:@selector(animalButtonWasClicked:)
//           forControlEvents:UIControlEventTouchUpInside];
//    
//    monkeyButton.backgroundColor = [UIColor clearColor];
//    [monkeyButton setCenter:CGPointMake(710, 300)];  
//    [monkeyButton removeFromSuperview];
//    [page7View addSubview:monkeyButton];
////    [page1View addSubview :monkeyButton];
//    [monkeyButton release];


    [self addGestureRecognizersToPiece:taotaoButton];
    [self addGestureRecognizersToPiece:elephantButton];
    [self addGestureRecognizersToPiece:tigerButton];
    [self addGestureRecognizersToPiece:giraffeButton];
    [self addGestureRecognizersToPiece:monkeyButton];

    

       NSArray * array  = [[NSArray alloc]initWithObjects:@"37",@"1",@"43",@"44",@"45",nil];
//        int leagueNumber = [array count];
        
        i=1;
//        int rowIndex;
//        int rankIndex;
        
        
        for (NSString* levels in array){
            
             NSString *title = levels;
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:title forState:UIControlStateNormal];
            NSInteger buttonTag  =[title  intValue];
            [button setTag:buttonTag];
            rowIndex = i/buttonsPerLine;
            rankIndex = i%buttonsPerLine;
            
            
            button.frame = CGRectMake(buttonSepratorX+rankIndex*(buttonSepratorX+buttonLen), rowIndex*(buttonHigh+buttonSepratorY), buttonLen, buttonHigh);
            
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            NSString *imageNumber = [NSString stringWithFormat:@"%@",levels];
            UIImage *image = [UIImage imageNamed:imageNumber];
            [button setImage:image forState :UIControlStateNormal];
            [button setFrame :CGRectMake(0,0,image.size.width * 0.857,image.size.height * 0.857)];

             
            if ([button tag] ==1) {
            
                [button setCenter:CGPointMake(504,261)];
            }
            if ([button tag] ==37) {
                
                [button setCenter:CGPointMake(603,203)];
            }
            if ([button tag] ==43) {
                
                [button setCenter:CGPointMake(942,159)];
            }
            if ([button tag] ==44) {
                
                [button setCenter:CGPointMake(857,281)];
            }
            if ([button tag] ==45) {
                
                [button setCenter:CGPointMake(188,195)];

            }
            
            [self addGestureRecognizersToPiece:button];

            [page7View addSubview :button];
            i++;
        }
    
    [_currentView removeFromSuperview];

    switch (pageNumbers) {
        case 1:
            _currentView =  page1View;
            break;
        case 2:
             _currentView = page2View;
            break;
        case 3:
            _currentView = page3View;
            break;
        case 4:
            _currentView = page4View;
            break;
        case 5:
            _currentView = page5View;
            break;
        case 6:
            _currentView = page6View;
            break;
        case 7:
            _currentView = page7View;
            break;
        default:
            break;
    }
    [self addGestureRecognizersToPiece:_currentView];
    [self.view addSubview:_currentView];
    
    
    [page1View release];
    [page2View release];
    [page3View release];
    [page4View release];
    [page5View release];
    [page6View release];
    [page7View release];

    
    
}


-(void)buttonClicked:(UIButton *)sender{

    UIButton *button = (UIButton *)sender;
    
    
    NSLog(@"The button was clicked by %@",button);
//   [self performSegueWithIdentifier:@"ShowDetailSegue" sender:self];  
//
//   JHCustomSegue * myCustomSegue = [[JHCustomSegue alloc]init];
//   [myCustomSegue perform]; 
//   [myCustomSegue release];

}


-(void)setBottomBackground{

    UIImageView*  bottomBackground = [[UIImageView alloc]initWithFrame :CGRectMake(0,660,1024,88)];
    UIImage *image = [UIImage imageNamed:@"Bottomground.png"];
    
    [bottomBackground setImage :image];
    
    [self.view addSubview:bottomBackground];


}
#pragma mark -
#pragma mark === view life  ===
#pragma mark

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setBottomBackground];
    
    
    [self.navigationController.navigationBar setHidden:YES];
    [self addContentsButtons:1];
    [self showPage:1];

    
    
    [self.view addSubview:[self textLabel]];
    [self.view addSubview: [self pageNumberLabel]];
    
    
//    [self.view addSubview: [self backButton]];
//   [self.view bringSubviewToFront:[self backButton]];
    
    
    
    [self.view addSubview:[self autoPlayingButton]];
    [self.view bringSubviewToFront:[self autoPlayingButton]];

    
   


}

-(UIButton *)backButton {
    
    [self.audioPlayer pause];

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
        label.font = [UIFont systemFontOfSize:30];
        label.backgroundColor = [UIColor clearColor];
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
        [label setText:@"        One day, a penguin named Taotao came to live at the zoo.He was welcomed by all the animals.\r\n The tiger, the monkey, the elephant and the giraffe all said hello to him. \r\n “Hello,” he replied. “I am Taotao!"];
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
    
    
    NSString *page0 ;
    NSString *page1 ;
    NSString *page2 ;
    NSString *page3 ;
    NSString *page4 ;
    NSString *page5 ;
    NSString *page6 ;
    NSString *page7 ;
    NSArray *pageTextArray;
    if (showEnglish) {
        page0 = [NSString stringWithFormat:@"TomCallon"];
        page1 = [NSString stringWithFormat:@"        One day, a penguin named Taotao came to live at the zoo.He was welcomed by all the animals.\r\n The tiger, the monkey, the elephant and the giraffe all said hello to him. \r\n “Hello,” he replied. “I am Taotao!"];  
        page2 = [NSString stringWithFormat:@"        Everyone was so happy Taotao was there. All the people visiting the zoo wanted to take his picture!"];
        page3 = [NSString stringWithFormat:@"One night the zookeeper forgot to lock Taotao’s cage door. Taotao wandered out of his cage, out of the zoo, and into the big, bright city. He didn’t know where to go! As Taotao walked and walked, the night became longer and longer. "];
                 
        page4 = [NSString stringWithFormat:@"Soon he lost track of the time - and where he was! The sun began to rise over the tops of the buildings as night turned into morning. People filled the street, and Taotao found himself blocking traffic as cars honked their horns at him!"];
                 
        page5 = [NSString stringWithFormat:@"After a while Taotao became very hungry. He came to a restaurant and asked the chef, “Please sir, can I have some fish?”.\r\nThe chef took one look at Taotao - who didn’t have even one penny in his pocket - and shook his head. Taotao kept walking."];
                 
        page6= [NSString stringWithFormat:@"By this time Taotao was hungry and thirsty. Coming up to an old Granny, he asked, “Please, can I have a drink of water?”She raised her eyeglasses to see him better. Confused she said, “Who are you?”"];
                 
        page7 = [NSString stringWithFormat:@"Taotao had no other choice but to keep walking. His stomach was empty and his throat dry, but he pressed on. Then Taotao heard a noise. Then another. He knew those noises. It was his friends - the elephant, tiger, giraffe and monkey! He was home! Taotao followed the sounds all the way back to the zoo.“Welcome home, Taotao!” his friends said. Taotao had seen the whole city, but now he knew there was no place like home. "];

    }else {
        page0 = [NSString stringWithFormat:@"TomCallon"];
        page1 = [NSString stringWithFormat:@"        今天，动物园来了一只企鹅。动物园里的老虎，大象，猴子，长颈鹿都非常高兴，纷纷跟他打招呼。\r\n大家好，我叫淘淘。”"];  
        page2 = [NSString stringWithFormat:@"        因为淘淘的出现，动物园每天都人山人海。游客们纷纷拿出相机，拍下淘淘可爱的模样。\r\n渐渐地，游客的热情减退，动物园又恢复了平静。"];
        page3 = [NSString stringWithFormat:@" 一天晚上，饲养员忘了关门，淘淘，逃出了动物园。动物园门外，是一层又一层的高楼大夏。\r\n这个城市投射着绚丽的光芒，淘淘被刺眼的灯光照射着，不知道往那里走。"];
        page4 = [NSString stringWithFormat:@"      太阳慢慢地往上爬，行人和车辆越来越多。淘淘走在马路的中央，扰乱了交通，刺耳的汽车鸣笛声不断响起。"];
        page5 = [NSString stringWithFormat:@"        淘淘肚子饿了，他碰到了一位大厨。\r\n“大厨，给我一条鱼好吗？”\r\n 大厨大量了一下身无分文的淘淘，无奈地摇摇头"];
        page6 = [NSString stringWithFormat:@"       淘淘口渴啦。他碰到一位老婆婆。\r\n“老婆婆，给我一点水好吗？”\r\n老婆婆用手托了托老花眼镜，疑惑地说你是谁啊？"];
        page7 = [NSString stringWithFormat:@"       淘淘又饿又渴，停下脚步。原来淘淘已经回到动物园了。\r\n动物园里边的老虎，大象，猴子，长颈鹿都很高兴地和他打招呼：“淘淘，欢饮回家！”"];
    }
    pageTextArray = [NSArray arrayWithObjects:page0,page1,page2,page3,page4,page5,page6,page7,nil] ;

        
    CGRect frame;
    CGRect playButtonframe;
    NSString *pageText;
    
    switch (pageInteger) {
        case 1:
            frame = CGRectMake(110, 470, 320, 150);
            playButtonframe = CGRectMake(400, 550, 70, 70);
            pageText = [pageTextArray objectAtIndex:pageInteger];
            [_textLabel setTextColor:[UIColor brownColor]];
            [_autoPlayingButton setFrame:playButtonframe];
            [self addContentsButtons:pageInteger];
            break;
        case 2:
            frame = CGRectMake(220, 23, 380, 150);
            pageText = [pageTextArray objectAtIndex:pageInteger];
            [_textLabel setTextColor:[UIColor brownColor]];
            playButtonframe = CGRectMake(600, 150, 70, 70);
            [_autoPlayingButton setFrame:playButtonframe];
            [_autoPlayingButton setCenter:CGPointMake(420, 160)];
            break;
        case 3:
            frame = CGRectMake(80, 523, 390, 150);
            pageText = [pageTextArray objectAtIndex:pageInteger];
            [_textLabel setTextColor:[UIColor whiteColor]];
            playButtonframe = CGRectMake(430, 625, 70, 70);
            [_autoPlayingButton setFrame:playButtonframe];
            [_autoPlayingButton setCenter:CGPointMake(400, 660)];
            break;
        case 4:
            frame = CGRectMake(510, 20, 320, 150);
            pageText = [pageTextArray objectAtIndex:pageInteger];
            [_textLabel setTextColor:[UIColor brownColor]];
            playButtonframe = CGRectMake(780, 120, 70, 70);
            [_autoPlayingButton setFrame:playButtonframe];
            [_autoPlayingButton setCenter:CGPointMake(700, 170)];
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
            frame = CGRectMake(350, 420, 320, 240);
            pageText = [pageTextArray objectAtIndex:pageInteger];
            [_textLabel setTextColor:[UIColor brownColor]];
            playButtonframe = CGRectMake(670, 680, 70, 70);
            [_autoPlayingButton setFrame:playButtonframe];
            [_autoPlayingButton setCenter:CGPointMake(670, 665)];
            break;
        default:
            break;
    }
    [_textLabel setFrame:frame];
    [_textLabel setText:pageText];
    
    
    
    [_imageView removeFromSuperview];
    pageInteger = pageNumber;
    NSString *pageName  = [NSString stringWithFormat:@"%da.png",pageInteger];
    UIImage *image = [UIImage imageNamed:pageName];
    UIImageView *imageView;
    imageView = [[UIImageView alloc]initWithImage:image];
     self.imageView = imageView;
    [_imageView  setFrame:CGRectMake(0, 0, 1024, 680)];
    [self.view insertSubview:_imageView atIndex:0];
    [imageView release];
    
    
}

//-(void)addThePageController{
//    
//    FirstPageViewController *firstPageViewController = [[FirstPageViewController alloc]init];
//    [self.view insertSubview:firstPageViewController.view atIndex:0];
//    [firstPageViewController release];
//
//}


-(void)animalButtonWasClicked :(UIButton *)sender{

    UIButton *animalButton = (UIButton *)sender;
    NSInteger ANIMALS ;
    enum ANIMALS {
        TAOTAOBUTTON =0,
        ELEPHANTBUTTON ,
        TIGERBUTTON,
        GIRAFFEBUTTON,
        MONKEYBUTTON
    };
    
    ANIMALS =  [animalButton tag];
    
    switch (ANIMALS) {
        case TAOTAOBUTTON:
            NSLog(@"I AM A ELEPHANT");
            [self  PlayAudio:@"penguin"];
            break;
        case ELEPHANTBUTTON:
            NSLog(@"I AM A ELEPHANT");
            [self  PlayAudio:@"elephant"];
            break;
        case TIGERBUTTON:
            NSLog(@"I AM A TIGER");
            [self PlayAudio: @"tiger"];
            break;
        case GIRAFFEBUTTON:
            NSLog(@"I AM A GIRAFFE");
            [self PlayAudio:@"giraffe"];
            
            break;
        case MONKEYBUTTON:
            NSLog(@"I AM A MONKEY");
            [self PlayAudio :@"monkey"];
            
            break;
        default:
            break;
    }        

}




- (IBAction)pageBackButton:(id)sender {
     
    [self.audioPlayer pause];

    
    NSLog(@" click pageBack Button");
    NSInteger count = 1;
    
    if (pageInteger == 1) {
        pageInteger = 1;
        NSLog(@"已经是第一页");
        return;
    }
    pageInteger =  pageInteger - count;
    [self showPage:pageInteger];
    [self addContentsButtons:pageInteger];
    [self.view bringSubviewToFront:[self autoPlayingButton]];
//    [self.view bringSubviewToFront :[self backButton]];
}



- (IBAction)pageForwardButton:(id)sender {
    [self.audioPlayer pause];

    NSLog(@" click pageForward Button");
    NSInteger count = 1;
    
    if (pageInteger == 7) {
        pageInteger = 7;
        NSLog(@"已经是最后一页");
        return;
    }
    pageInteger = count +pageInteger;
    [self showPage:pageInteger];
    [self addContentsButtons:pageInteger];
    
    [self.view bringSubviewToFront:[self autoPlayingButton]];
//    [self.view bringSubviewToFront :[self backButton]];
}


- (IBAction)backButton:(id)sender
{

    [self TomCallonpopViewController];    
}

- (IBAction)translationButton:(id)sender {
    
    UIButton *translationButton = (UIButton *)sender;
    
    //show English
    if ([translationButton tag] ==5) {
        NSLog(@"show Engish");
        showEnglish = YES;
        [self showPage:pageInteger];
        
    }
    ///show Chinese
    else {
        NSLog(@"show Chinese");
        showEnglish = NO;
        [self showPage:pageInteger];
    }
    
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
    
    
    ////paue current playing music
    [self.audioPlayer pause];
    
    
    NSString *pageNumber;
    NSString *appendingString;
    switch (pageInteger) {
        case 1:
            appendingString = @"1";
            break;
        case 2:
            appendingString =@"2";
            break;
        case 3:
            appendingString = @"3";
            break;
        case 4:
            appendingString =@"4";
            break;
        case 5:
            appendingString =@"5";
            break;
        case 6:
            appendingString =@"6";
            break;
        case 7:
            appendingString =@"7";
            break;
        default:
            break;
    }
    
//    ////播放英文录音
//    if (showEnglish) {
//        pageNumber = [NSString stringWithFormat:@"%@",appendingString]; 
//    }else {
//    ////播放中文录音
//        pageNumber = [NSString stringWithFormat:@"%@",appendingString];
//    }
    pageNumber = [NSString stringWithFormat:@"%@",appendingString];

    [self PlayAudio:pageNumber];
    
    
}


- (void )PlayAudio: (NSString *)who{
    
	NSString *musicPath = [[NSBundle mainBundle] pathForResource:who ofType:@"mp3"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:musicPath];
    
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    // 创建播放器
    self.audioPlayer= player; //赋值给自己定义的类变量
    [url release];
    [player release];
    
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer setVolume:9];
    self.audioPlayer.numberOfLoops = 0; //设置音乐播放次数  -1为一直循环
    //    if(mainMusicStatus)
    //    {
    //        [myBackMusic play]; //播放
    //    }
    
    [self.audioPlayer play];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [self setBackButton:nil];
    [self setPageNumberLabel:nil];
    [self setTextLabel:nil];
    [self setAutoPlayingButton:nil];
}



// adds a set of gesture recognizers to one of our piece subviews
- (void)addGestureRecognizersToPiece:(UIView *)piece
{
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotatePiece:)];
    [piece addGestureRecognizer:rotationGesture];
    [rotationGesture release];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scalePiece:)];
    [pinchGesture setDelegate:self];
    [piece addGestureRecognizer:pinchGesture];
    [pinchGesture release];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panPiece:)];
    [panGesture setMaximumNumberOfTouches:2];
    [panGesture setDelegate:self];
    [piece addGestureRecognizer:panGesture];
    [panGesture release];
    
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showResetMenu:)];
    [piece addGestureRecognizer:longPressGesture];
    [longPressGesture release];
    
    
}

#pragma mark -
#pragma mark === Utility methods  ===
#pragma mark

// scale and rotation transforms are applied relative to the layer's anchor point
// this method moves a gesture recognizer's view's anchor point between the user's fingers
- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
}
// display a menu with a single item to allow the piece's transform to be reset
- (void)showResetMenu:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan) {
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        UIMenuItem *resetMenuItem = [[UIMenuItem alloc] initWithTitle:@"Reset" action:@selector(resetPiece:)];
        CGPoint location = [gestureRecognizer locationInView:[gestureRecognizer view]];
        
        [self.view becomeFirstResponder];
        [menuController setMenuItems:[NSArray arrayWithObject:resetMenuItem]];
        [menuController setTargetRect:CGRectMake(location.x, location.y, 0, 0) inView:[gestureRecognizer view]];
        [menuController setMenuVisible:YES animated:YES];
        
        pieceForReset = [gestureRecognizer view];
        [resetMenuItem release];
    }
}

// animate back to the default anchor point and transform
- (void)resetPiece:(UIMenuController *)controller
{
    CGPoint locationInSuperview = [pieceForReset convertPoint:CGPointMake(CGRectGetMidX(pieceForReset.bounds), CGRectGetMidY(pieceForReset.bounds)) toView:[pieceForReset superview]];
    
    [[pieceForReset layer] setAnchorPoint:CGPointMake(0.5, 0.5)];
    [pieceForReset setCenter:locationInSuperview];
    
    [UIView beginAnimations:nil context:nil];
    [pieceForReset setTransform:CGAffineTransformIdentity];
    [UIView commitAnimations];
}

// UIMenuController requires that we can become first responder or it won't display
- (BOOL)canBecomeFirstResponder
{
    return YES;
}


//该方法使得图片变大 触摸开始
-(void)animateFirstTouchAtPoint:(CGPoint)touchPoint forView:(UIView *)theView 
{
	// Pulse the view by scaling up, then move the view to under the finger.
//	[UIView beginAnimations:nil context:nil];
//	[UIView setAnimationDuration:GROW_ANIMATION_DURATION_SECONDS];
//	theView.transform = CGAffineTransformMakeScale(1.1, 1.1);
//   
//    
//    
//	[UIView commitAnimations];
}
//该方法使得图片变大  触摸结束
-(void)animateEndTouchAtPoint:(CGPoint)touchPoint forView:(UIView *)theView 
{
	// Pulse the view by scaling up, then move the view to under the finger.
//	[UIView beginAnimations:nil context:nil];
//	[UIView setAnimationDuration:GROW_ANIMATION_DURATION_SECONDS];
//	theView.transform = CGAffineTransformMakeScale(1.0, 1.0);
//    
//    
//	[UIView commitAnimations];
}


#pragma mark -
#pragma mark === Touch handling  ===
#pragma mark

// shift the piece's center by the pan amount
// reset the gesture recognizer's translation to {0, 0} after applying so the next callback is a delta from the current position
- (void)panPiece:(UIPanGestureRecognizer *)gestureRecognizer
{
    UIView *piece = [gestureRecognizer view];
//    [self currentAlphabet:piece];
    
    /////把当前移动的view 放到最前
    [self.view bringSubviewToFront:piece];
    CGPoint translation;
    //    [self adjustAnchorPointForGestureRecognizer:gestureRecognizer];
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan) {
        translation = [gestureRecognizer translationInView:[piece superview]];
        //        [piece setCenter:CGPointMake([piece center].x + translation.x, [piece center].y + translation.y)];
        //        [gestureRecognizer setTranslation:CGPointZero inView:[piece superview]];
        [self animateFirstTouchAtPoint:translation forView:piece];
    }else if([gestureRecognizer state] ==UIGestureRecognizerStateEnded){       
        translation = [gestureRecognizer translationInView:[piece superview]];
        [piece setCenter:CGPointMake([piece center].x + translation.x, [piece center].y + translation.y)];
        [self animateEndTouchAtPoint:translation forView:piece];
    }else if([gestureRecognizer state] == UIGestureRecognizerStateChanged){
        translation = [gestureRecognizer translationInView:[piece superview]];
        [piece setCenter:CGPointMake([piece center].x + translation.x, [piece center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[piece superview]];
    }
    
    NSLog(@"Current Location is x :%f ,y :%f ",[piece center].x + translation.x,[piece center].y +translation.y);
}

// rotate the piece by the current rotation
// reset the gesture recognizer's rotation to 0 after applying so the next callback is a delta from the current rotation
- (void)rotatePiece:(UIRotationGestureRecognizer *)gestureRecognizer
{
    //    UIView *piece = [gestureRecognizer view];
    //    [self currentAlphabet:piece];
    [self adjustAnchorPointForGestureRecognizer:gestureRecognizer];
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
        [gestureRecognizer view].transform = CGAffineTransformRotate([[gestureRecognizer view] transform], [gestureRecognizer rotation]);
        [gestureRecognizer setRotation:0];
    }
}

// scale the piece by the current scale
// reset the gesture recognizer's rotation to 0 after applying so the next callback is a delta from the current scale
- (void)scalePiece:(UIPinchGestureRecognizer *)gestureRecognizer
{   
    
    //    UIView *piece = [gestureRecognizer view];
    //    [self currentAlphabet:piece];
    [self adjustAnchorPointForGestureRecognizer:gestureRecognizer];
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
        [gestureRecognizer view].transform = CGAffineTransformScale([[gestureRecognizer view] transform], [gestureRecognizer scale], [gestureRecognizer scale]);
        [gestureRecognizer setScale:1];
    }
}

// ensure that the pinch, pan and rotate gesture recognizers on a particular view can all recognize simultaneously
// prevent other gesture recognizers from recognizing simultaneously
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    //    // if the gesture recognizers's view isn't one of our pieces, don't allow simultaneous recognition
    
    //    if (gestureRecognizer.view != firstPieceView && gestureRecognizer.view != secondPieceView && gestureRecognizer.view != thirdPieceView)
    //        return NO;
    
    

    int i = 0;
    for (UIView *subview in [self.view subviews]){
        
        if (gestureRecognizer.view != [[self.view subviews] objectAtIndex:i]) {
            return NO;
        } 
        i++;
    }
    
    
//    if (   gestureRecognizer.view != [[self.view subviews] objectAtIndex:0] 
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:1] 
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:2]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:3]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:4]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:5]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:6]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:7]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:8]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:9]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:10]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:11]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:12]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:13]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:14]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:15]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:16]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:17]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:18]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:19]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:20]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:21]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:22]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:23]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:24]
//        && gestureRecognizer.view != [[self.view subviews] objectAtIndex:25]
//        )
        
    
    // if the gesture recognizers are on different views, don't allow simultaneous recognition
    if (gestureRecognizer.view != otherGestureRecognizer.view)
        return NO;
    
    // if either of the gesture recognizers is the long press, don't allow simultaneous recognition
    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]] || [otherGestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]])
        return NO;
    
    return YES;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        return (UIInterfaceOrientationLandscapeLeft == interfaceOrientation ||
                UIInterfaceOrientationLandscapeRight == interfaceOrientation);
    } else {
        return (UIInterfaceOrientationLandscapeLeft == interfaceOrientation ||
                UIInterfaceOrientationLandscapeRight == interfaceOrientation);
    }
}


@end
