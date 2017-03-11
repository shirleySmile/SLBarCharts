//
//  ShowStepView.h
//  downBigImage
//
//  Created by shaolei on 17/2/20.
//  Copyright © 2017年 sl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLShowStepView : UIView

- (instancetype)initWithFrame:(CGRect)frame currentStep:(NSInteger)step;

@property(nonatomic,assign)NSInteger averageStepNum;

@end
