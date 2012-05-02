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
@interface ViewController ()

@end

@implementation ViewController
@synthesize pageInteger;
@synthesize backButton = _backButton;
@synthesize textLabel = _textLabel;
@synthesize pageNumberLabel =_pageNumberLabel;
@synthesize autoPlayingButton =_autoPlayingButton;
@synthesize currentView = _currentView;

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
    
    
    ///TaoTao
    taotaoButton = [[UIButton alloc]initWithFrame:CGRectMake(580, 560, 190, 250)];
    
    UIImage *taotaoImage = [UIImage imageNamed:@"taotao.png"];
    [taotaoButton setTag:0];
    [taotaoButton setBackgroundImage:taotaoImage forState:UIControlStateNormal];
    
    [taotaoButton addTarget:self action:@selector(animalButtonWasClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    taotaoButton.backgroundColor = [UIColor clearColor];
    [taotaoButton setCenter:CGPointMake(550, 520)]; 
    [taotaoButton removeFromSuperview];
    
    
    
    
    [page1View addSubview:taotaoButton];
    [taotaoButton release];
    
    
    ///elephant
    elephantButton = [[UIButton alloc]initWithFrame:CGRectMake(480, 485, 200, 300)];
    UIImage *elephantImage = [UIImage imageNamed:@"elephant.png"];
    [elephantButton setTag:1];
    [elephantButton setBackgroundImage:elephantImage forState:UIControlStateNormal];
    
    [elephantButton addTarget:self 
                       action:@selector(animalButtonWasClicked:) 
             forControlEvents:UIControlEventTouchUpInside];
    
    elephantButton.backgroundColor = [UIColor clearColor];
    [elephantButton setCenter:CGPointMake(370, 200)];
    [elephantButton removeFromSuperview];
    [page2View addSubview:elephantButton];
    [elephantButton release];
    
    
    ///tiger
    tigerButton = [[UIButton alloc]initWithFrame:CGRectMake(780, 185, 240, 200)];
    UIImage *tigerImage = [UIImage imageNamed:@"tiger.png"];
    [tigerButton setTag:2];
    
    [tigerButton setBackgroundImage:tigerImage forState:UIControlStateNormal];
    [tigerButton addTarget:self 
                    action:@selector(animalButtonWasClicked:) 
          forControlEvents:UIControlEventTouchUpInside];
    
    tigerButton.backgroundColor = [UIColor clearColor];
    [tigerButton setCenter:CGPointMake(700, 100)];
    [tigerButton removeFromSuperview];
    [page3View addSubview:tigerButton];
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
    [page4View addSubview:giraffeButton];
    [giraffeButton release];
    
    
    ///monkey
    monkeyButton = [[UIButton alloc]initWithFrame:CGRectMake(700, 330, 90, 200)];
    UIImage *monkeyImage = [UIImage imageNamed:@"monkey.png"];
    [monkeyButton setTag:4];
    [monkeyButton setBackgroundImage:monkeyImage forState:UIControlStateNormal];
    
    [monkeyButton addTarget:self 
                     action:@selector(animalButtonWasClicked:)
           forControlEvents:UIControlEventTouchUpInside];
    
    monkeyButton.backgroundColor = [UIColor clearColor];
    [monkeyButton setCenter:CGPointMake(710, 300)];  
    [monkeyButton removeFromSuperview];
    [page5View addSubview:monkeyButton];
    [monkeyButton release];
    

    ///monkey
    monkeyButton = [[UIButton alloc]initWithFrame:CGRectMake(700, 330, 90, 200)];
    UIImage *monkeyImage1 = [UIImage imageNamed:@"4.png"];
    [monkeyButton setTag:4];
    [monkeyButton setBackgroundImage:monkeyImage1 forState:UIControlStateNormal];
    
    [monkeyButton addTarget:self 
                     action:@selector(animalButtonWasClicked:)
           forControlEvents:UIControlEventTouchUpInside];
    
    monkeyButton.backgroundColor = [UIColor clearColor];
    [monkeyButton setCenter:CGPointMake(710, 300)];  
    [monkeyButton removeFromSuperview];
    [page6View addSubview:monkeyButton];
    [monkeyButton release];
    
    
    
    
    ///monkey
    monkeyButton = [[UIButton alloc]initWithFrame:CGRectMake(700, 330, 90, 200)];
    UIImage *monkeyImage2 = [UIImage imageNamed:@"tourist2.png"];
    [monkeyButton setTag:4];
    [monkeyButton setBackgroundImage:monkeyImage2 forState:UIControlStateNormal];
    
    [monkeyButton addTarget:self 
                     action:@selector(animalButtonWasClicked:)
           forControlEvents:UIControlEventTouchUpInside];
    
    monkeyButton.backgroundColor = [UIColor clearColor];
    [monkeyButton setCenter:CGPointMake(710, 300)];  
    [monkeyButton removeFromSuperview];
    [page6View addSubview:monkeyButton];
    [monkeyButton release];


    
    const float buttonLen = 110;
    const float buttonHigh = 62;
    const float buttonSepratorX = 6;
    const float buttonSepratorY = 10;
    const int buttonsPerLine = 5;

       NSArray * array  = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20", nil];
//        int leagueNumber = [array count];
        
        int i=0;
        int rowIndex;
        int rankIndex;
        
        
        for (NSString* levels in array){
            
            NSString *title = levels;
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [button setTitle:title forState:UIControlStateNormal];
            [button setTag:i];
            rowIndex = i/buttonsPerLine;
            rankIndex = i%buttonsPerLine;
            
            
            button.frame = CGRectMake(buttonSepratorX+rankIndex*(buttonSepratorX+buttonLen), rowIndex*(buttonHigh+buttonSepratorY), buttonLen, buttonHigh);
            
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            if ([button tag] ==4) {
                
                
                UIImage *image = [UIImage imageNamed:@"tiger.png"];
                [button setTitle:@"fcuk" forState :UIControlStateNormal];
                [button setFrame:CGRectMake(100,200,80,80)];
                [button setImage:image forState :UIControlStateNormal];
                
            }

            [page6View addSubview:button];
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

    [self.view insertSubview:_currentView atIndex :1];
    
    [page1View release];
    [page2View release];
    [page3View release];
    [page4View release];
    [page5View release];
    [page6View release];
    [page7View release];

    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    [self.navigationController.navigationBar setHidden:YES];
    [self addContentsButtons:1];
    [self showPage:1];

    
    [self.view addSubview: [self backButton]];
    [self.view addSubview:[self textLabel]];
    [self.view addSubview: [self pageNumberLabel]];
    [self.view addSubview:[self autoPlayingButton]];


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
        page1 = [NSString stringWithFormat:@"        One  day, a  penguin comes to the zoo. And the tiger, elephant, monkey,and giraffe in the zoo say hello to him one after another .” \r\n Taotao says : “Hello ,guys ,I am Taotao”"];  
        page2 = [NSString stringWithFormat:@"        Because of the arrival of Taotao,the zoo was crammed with people everyday.All the tourists had taken out their cameras and took little snap shots of cute faces of Taotao.But gradually,the enthusiasm of the tourists declined,and the zoo returned to the normal."];
        page3 = [NSString stringWithFormat:@"One night,the gate guard forgot to lock up the door of the zoo,Taotao escaped from the zoo.Outside the zoo were skyscrapers everywhere.The whole city was shining out marvelous light.  Surrounded by the remarkable light,Taotao,didn’t know where to go."];
        page4 = [NSString stringWithFormat:@"The sun rose slowly, and with each passing moment, the number of people and cars around Taotao increased .Taotao walked into the middle of the road,interrupting the traffic. People started honking their car horns at him angrily."];
        page5 = [NSString stringWithFormat:@"Soon Taotao realized he was so hungry. Fortunately, he met a chef and said,”Mr. Chef,will you be kind enough to give me a fish?”The chef took a look at Taotao,who didn’t have a penny in his pocket, and shook his head reluctantly."];
        page6= [NSString stringWithFormat:@"Still hungry, Taotao also realized he was so thirsty. He met a old granny,”Granny,will you be kind enough ]to give me some water?”Granny pumped her reading glasses and said,”Who are you?”"];
        page7 = [NSString stringWithFormat:@"Taotao was so hungry and thirsty that he had to stop.With nowhere else to go, he decided to go back to the zoo. The Tiger, the elephant, the monkey, and the giraffe were all so happy and said,”Taotao,welcome home!“Taotao had travelled the whole city, but realized there was no place like home."];

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
            [self performSegueWithIdentifier:@"PageSegue1" sender:self];
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
    
    
    
//    [_imageView removeFromSuperview];
//    pageInteger = pageNumber;
//    NSString *pageName  = [NSString stringWithFormat:@"%d.png",pageInteger];
//    UIImage *image = [UIImage imageNamed:pageName];
//    UIImageView *imageView;
//    imageView = [[UIImageView alloc]initWithImage:image];
//     self.imageView = imageView;
//    [_imageView  setFrame:CGRectMake(0, 0, 1024, 680)];
//    [self.view insertSubview:_imageView atIndex:0];
//    [imageView release];
    
    JHCustomSegue * myCustomSegue = [[JHCustomSegue alloc]init];
    [myCustomSegue perform]; 
    

    
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


@end
