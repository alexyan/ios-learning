//
//  IndexViewController.m
//  Start
//
//  Created by 想当当 on 13-10-31.
//  Copyright (c) 2013年 想当当. All rights reserved.
//

#import "IndexViewController.h"
#import "ListViewController.h"
#import "UIColor+Hex.h"
#import "Students.h"

@interface IndexViewController ()

@end

@implementation IndexViewController




/**
 * ViewController的生命周期:
 * loadView -> viewDidLoad
 * ...
 */

- (void)loadView
{
    [super loadView];
    NSLog(@"loadView");
    //创建view
    UIView *contentView = [[UIView alloc]initWithFrame: [[UIScreen mainScreen] applicationFrame]];
    //contentView.backgroundColor = [UIColor lightGrayColor];
    contentView.backgroundColor = [UIColor colorWithHex:0xF3F3F3 alpha:1];
    self.view = contentView;
    

    //创建label控件并作为subview添加到view
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20.0, self.view.frame.size.height-50, self.view.frame.size.width, 25)];
    //UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 370.0, self.view.frame.size.width, 25)];
    label.text = @"Copyright 2004-2013 ALIPAY.COM. All Rights Reserved.";
    label.center = contentView.center;
    label.textColor = [UIColor colorWithHex:0xCCCCCC alpha:1];
    label.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    //label.backgroundColor = [UIColor lightGrayColor];
    //label.textAlignment = UITextAlignmentCenter;
    
    
    /**
     * You can set font size by these properties
     */
    /**
    [label setTextAlignment:NSTextAlignmentLeft];
    
    [label setBackgroundColor:[UIColor clearColor]];
    
    [label setAdjustsFontSizeToFitWidth:YES];
    
    [label setTextColor:[UIColor blackColor]];
    
    [label setUserInteractionEnabled:NO];
    
    [label setFont:[UIFont fontWithName:@"digital-7" size:60]];
    
    [label.layer.shadowColor =[[UIColor whiteColor ]CGColor ];
    
    [label.layer.shadowOffset=(CGSizeMake(0, 0));
    
    [label.layer.shadowOpacity=1;
    
    [label.layer.shadowRadius=3.0;
    
    [label.layer.masksToBounds=NO;
    
    [label.shadowColor=[UIColor darkGrayColor];
    
    [label.shadowOffset=CGSizeMake(0, 2);
    */
    
    [self.view addSubview:label];
    
    
    //创建button控件并作为subview添加到view
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(5.0, 70.0, self.view.frame.size.width-10, 37)];
    [button setTitle:@"UITableView" forState:UIControlStateNormal];
    //事件绑定:buttonPressed
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    //
    CALayer *buttonLayer = [button layer];
    [buttonLayer setBorderWidth:1.0];//设置边框
    [buttonLayer setCornerRadius:4.0];//设置圆角半径
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [buttonLayer setBorderColor:colorref];
    [self.view addSubview:button];
    //
    UIButton *alertViewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [alertViewButton setFrame:CGRectMake(5.0, 117.0, self.view.frame.size.width-10, 37)];
    [alertViewButton setTitle:@"AlertView" forState:UIControlStateNormal];
    //事件绑定:buttonPressed
    [alertViewButton addTarget:self action:@selector(alertViewShow:) forControlEvents:UIControlEventTouchUpInside];
    
    CALayer *alertViewButtonLayer = [alertViewButton layer];
    [alertViewButtonLayer setBorderWidth:1.0];//设置边框
    [alertViewButtonLayer setCornerRadius:4.0];//设置圆角半径
    CGColorSpaceRef alertViewColorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef alertViewColorref = CGColorCreate(alertViewColorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [buttonLayer setBorderColor:alertViewColorref];
    [self.view addSubview:alertViewButton];
    

    
    //Students *student = [Students studentRealName:@"Alex" andLastName:@"Yan"];
    Students *student = [[Students alloc]init];
    NSLog(@"%@",[student studentRealName:@"Alex" andLastName:@"Yan"].realname);
    
    self.navigationItem.title = @"首页";
}

- (void)buttonPressed:(id)sender
{
    ListViewController *listViewController = [[ListViewController alloc]init];
    [self.navigationController pushViewController:listViewController animated:true];
}

- (void)alertViewShow:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ButtonPressed"
                                                   message:@"You have pressed the button"
                                                  delegate:nil
                                         cancelButtonTitle:@"cancel"
                                         otherButtonTitles:nil];
    [alert show];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
	// Do any additional setup after loading the view.
    self.textField = [[UITextField alloc]init];
    [self.textField setFrame:CGRectMake(5.0, 180.0, self.view.frame.size.width-10, 37)];
    [self.textField setBorderStyle:UITextBorderStyleLine];//设置边框
    CALayer *textFieldLayer = [self.textField layer];
    CGColorSpaceRef textFieldColorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef textFieldColorref = CGColorCreate(textFieldColorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [textFieldLayer setBorderColor:textFieldColorref];
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
}

// 触摸背景，关闭键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    UIView *view = (UIView *)[touch view];
    NSLog(@"touch");
    if(view == self.view){
        [self.textField resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning");
    // Dispose of any resources that can be recreated.
}

@end
