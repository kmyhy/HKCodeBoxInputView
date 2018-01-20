//
//  ViewController.m
//  HKCodeBoxInputView
//
//  Created by qq on 2018/1/20.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "ViewController.h"
#import "HKCodeBoxInputView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet HKCodeBoxInputView *codeInput;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.codeInput.keyBoardType = UIKeyboardTypeNumberPad;
    
    [self.codeInput addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}
-(void)valueChanged:(UIControl*)sender{
    NSLog(@"^^^^%@",self.codeInput.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
