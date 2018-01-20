//
//  HKCodeBoxInputView.m
//  HKCodeBoxInputView
//
//  Created by qq on 2018/1/20.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "HKCodeBoxInputView.h"
#import "UIColor+Hex.h"

@implementation HKCodeBoxInputView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    
    maxTextLength = 4;// 校验码长度 4
    
    // IB 不会自动添加 xib 中的根 view（即 contentView），因此需要手动添加
    self.contentView = [[[NSBundle mainBundle]loadNibNamed:@"HKCodeBoxInputView" owner:self options:nil]lastObject];
    self.contentView.frame = self.bounds;
    [self addSubview:self.contentView];
    
    _textView.tintColor = [UIColor clearColor];
    _textView.backgroundColor = [UIColor clearColor];
    _textView.textColor = [UIColor clearColor];
    _textView.delegate = self;
    _textView.keyboardType = UIKeyboardTypeDefault;
    
    codeLabels = @[_code1,_code2,_code3,_code4];
}
// MARK: - Setter
-(void)setKeyBoardType:(UIKeyboardType)type{
    self.textView.keyboardType = type;
}
-(void)setLineColor:(UIColor *)lineColor{
    _line1.backgroundColor = _line2.backgroundColor = _line3.backgroundColor = _line4.backgroundColor = lineColor;
}
-(void)setTextColor:(UIColor *)textColor{
    _code1.textColor= _code2.textColor = _code3.textColor = _code4.textColor = textColor;
}
// MARK: - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    _textView.text = @"";
    _code4.backgroundColor = _code3.backgroundColor = _code2.backgroundColor= _code1.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    _code4.backgroundColor = _code3.backgroundColor = _code2.backgroundColor= _code1.backgroundColor = [UIColor clearColor];

}
- (void)textViewDidChange:(UITextView *)textView{
    
    NSString *text = textView.text;
    // 去掉空格
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (text.length >= maxTextLength) {
        text = [text substringToIndex:maxTextLength];
        [self endEditing:YES];
    }
    textView.text = _text = text;
    
    for (int i= 0; i < codeLabels.count; i++) {
        
        UILabel * label = codeLabels[i];
        if(i<text.length){
            NSString* num = [text substringWithRange:NSMakeRange(i, 1)];
            label.text = num;
        }else{
            label.text = nil;
        }
    }
}
@end
