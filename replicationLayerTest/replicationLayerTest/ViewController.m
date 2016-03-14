//
//  ViewController.m
//  replicationLayerTest
//
//  Created by Elaine on 16--14.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self moveAnimationTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 创建一个类似音乐震动的动画
- (void)testVoiceShakeLayer
{
    CAReplicatorLayer *layer = [[CAReplicatorLayer alloc] init];
    
    layer.bounds = CGRectMake(0, 0, 60, 60);
    layer.position = self.view.center;
    layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    CALayer *layer1 = [[CALayer alloc] init];
    layer1.bounds = CGRectMake(0, 0, 8, 40);
    layer1.position = CGPointMake(10, 75);
    layer1.cornerRadius = 2.0;
    layer1.backgroundColor = [UIColor redColor].CGColor;
    [layer addSublayer:layer1];
    
    //  Basic动画
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:@"position.y"];
    move.toValue = @(layer1.position.y - 35.0);
    move.duration = 0.5;
    move.autoreverses = YES;
    move.repeatCount = MAXFLOAT;
    [layer1 addAnimation:move forKey:nil];
    
    //  动画复制的个数
    layer.instanceCount = 5;
    
    //  改变每个复制的位置，防止重叠
    layer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0);
    
    //  每个动效的延迟时间
    layer.instanceDelay = 0.33;
    
    //  让超出部分剪裁
    layer.masksToBounds = YES;
}

//  活动指示灯
- (void)activityAnimationTest
{
    CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc] init];
    replicatorLayer.bounds = CGRectMake(0, 0, 200, 200);
    replicatorLayer.cornerRadius = 10.0f;
    replicatorLayer.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.75].CGColor;
    replicatorLayer.position = self.view.center;
    [self.view.layer addSublayer:replicatorLayer];
  
    CALayer *layer = [[CALayer alloc] init];
    layer.bounds = CGRectMake(0, 0, 14, 14);
    layer.position = CGPointMake(100, 40);
    layer.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    layer.borderWidth = 1.0f;
    layer.cornerRadius = 2.0f;
    layer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
    [replicatorLayer addSublayer:layer];
    
    //  复制15个点
    NSInteger dotCounts = 15;
    replicatorLayer.instanceCount = dotCounts;
    //  间距
    CGFloat angle = (2 * M_PI) / 15.0;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(angle, 0, 0);
    replicatorLayer.instanceDelay = 1.5 / 15.0;
    
    
    //  增加动画
    CABasicAnimation *basicAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basicAni.fromValue = @(1.0);
    basicAni.toValue = @(0.1);
    basicAni.duration = 1.5;
    basicAni.repeatCount = MAXFLOAT;
    [layer addAnimation:basicAni forKey:nil];
}

//  跟随动画
- (void)moveAnimationTest
{
    CAReplicatorLayer *replicatorLayer = [[CAReplicatorLayer alloc] init];
    replicatorLayer.bounds = CGRectMake(0, 0, 200, 200);
    replicatorLayer.position = self.view.center;
    replicatorLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    replicatorLayer.cornerRadius = 5.0f;
    [self.view.layer addSublayer:replicatorLayer];
    
    CALayer *layer = [[CALayer alloc] init];
    layer.bounds = CGRectMake(0, 0, 30, 30);
    layer.position = CGPointMake(20, 85);
    layer.cornerRadius = 15.0f;
    layer.backgroundColor = [UIColor redColor].CGColor;
    [replicatorLayer addSublayer:layer];
    
    replicatorLayer.instanceCount = 5;
    replicatorLayer.instanceDelay = 0.1;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);
    
    CABasicAnimation *basicAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basicAni.fromValue = @(0);
    basicAni.toValue = @(0.8);
    basicAni.duration = 0.5;
    basicAni.repeatCount = MAXFLOAT;
    basicAni.autoreverses = YES;
    [layer addAnimation:basicAni forKey:nil];
}

@end
