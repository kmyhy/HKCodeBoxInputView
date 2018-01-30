//
//  HKLaserLine.h
//  HKCodeBoxInputView
//
//  Created by qq on 2018/1/30.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HKLaserLine : UIView
@property(strong,nonatomic)UIColor* color;// 原来的背景颜色
@property(strong,nonatomic)UIColor* jiggleColor1;// 闪烁颜色1
@property(strong,nonatomic)UIColor* jiggleColor2;// 闪烁颜色2
@property(assign,nonatomic)CGFloat widthScale;// 闪烁时加粗系数
@property(assign,nonatomic)BOOL isJiggleColor;// 当前显示的颜色是否是闪烁色
@property(assign,nonatomic)NSTimer* timer;
@property(assign,nonatomic)BOOL animating;// 是否在动画
@property(assign,nonatomic)CGFloat timeInterval;// 动画周期

-(void)startAnimate;
-(void)stopAnimate;
@end
