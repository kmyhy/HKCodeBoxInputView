//
//  HKLaserLine.m
//  HKCodeBoxInputView
//
//  Created by qq on 2018/1/30.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "HKLaserLine.h"
#import "UIColor+Hex.h"

@implementation HKLaserLine

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self awakeFromNib];
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor colorWithHex:0x666666];
    self.color = self.backgroundColor;
    self.jiggleColor1 = [UIColor colorWithHex:0x84C86B alpha:1];
    self.jiggleColor2 = [UIColor colorWithHex:0x0FF6441 alpha:0.8];
    self.animating = NO;
    self.timeInterval = 0.1;
    self.widthScale = 4.0;
}

-(void)startAnimate{
    if(_animating==NO){
        _animating= YES;
        
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, self.widthScale);
        __weak typeof(self) weakSelf = self;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval repeats:YES block:^(NSTimer * _Nonnull timer) {
            if(weakSelf.isJiggleColor){
                weakSelf.backgroundColor = weakSelf.jiggleColor1;
                weakSelf.isJiggleColor = NO;
            }else{
                weakSelf.backgroundColor = weakSelf.jiggleColor2;
                weakSelf.isJiggleColor = YES;
            }
        }];
    }
}
-(void)stopAnimate{
    if(_animating && self.timer){
        [self.timer invalidate];
        self.backgroundColor = self.color;
        _animating = NO;
        self.transform = CGAffineTransformIdentity;

    }
}
-(void)dealloc{
    [self stopAnimate];
}
@end
