//
//  HKCodeBoxInputView.h
//  HKCodeBoxInputView
//
//  Created by qq on 2018/1/20.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKLaserLine.h"

@interface HKCodeBoxInputView : UIControl<UITextViewDelegate>{
    int maxTextLength;
    NSArray* codeLabels;
    NSArray* lineViews;
}
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *code1;
@property (weak, nonatomic) IBOutlet UILabel *code2;
@property (weak, nonatomic) IBOutlet UILabel *code3;
@property (weak, nonatomic) IBOutlet UILabel *code4;
@property (weak, nonatomic) IBOutlet HKLaserLine *line1;
@property (weak, nonatomic) IBOutlet HKLaserLine *line2;
@property (weak, nonatomic) IBOutlet HKLaserLine *line3;
@property (weak, nonatomic) IBOutlet HKLaserLine *line4;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong,readonly) NSString* text;

@property (strong,nonatomic)IBInspectable UIColor* lineColor;
@property (strong,nonatomic)IBInspectable UIColor* textColor;
@property (nonatomic, assign) UIKeyboardType keyBoardType;

@end
