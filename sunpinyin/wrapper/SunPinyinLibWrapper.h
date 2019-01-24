//
//  SunPinyinLibWrapper.h
//  SunPinyinLib
//
//  Created by R0uter on 8/22/18.
//  Copyright © 2018 R0uter. All rights reserved.
//

#ifndef SunPinyinLibWrapper_h
#define SunPinyinLibWrapper_h

#import <Foundation/Foundation.h>

@interface SunpinyinWrapper : NSObject

@property (nonatomic, assign) BOOL an2ang;
@property (nonatomic, assign) BOOL in2ing;
@property (nonatomic, assign) BOOL en2eng;
@property (nonatomic, assign) BOOL z2zh;
@property (nonatomic, assign) BOOL c2ch;
@property (nonatomic, assign) BOOL s2sh;
@property (nonatomic, assign) BOOL f2h;
@property (nonatomic, assign) BOOL r2l;
@property (nonatomic, assign) BOOL l2n;

@property (nonatomic, assign) BOOL gn2ng;
@property (nonatomic, assign) BOOL mg2ng;
@property (nonatomic, assign) BOOL uen2un;
@property (nonatomic, assign) BOOL iou2iu;
@property (nonatomic, assign) BOOL uei2ui;


/**
 更新模糊音后触发更新
 */
- (void)updateFuzzConfig;

/**
 更新全拼纠错后触发更新
 */
- (void)updateAutoCorrection;
/**
 全拼字符串切分，快速方便。
 
 @param buffer 全拼字符串
 @return 切分开的拼音
 */
- (NSArray<NSString *> *)pyStringFrom: (NSString *)buffer;

/**
 从 buffer 获取拼音切分串
 
 @return 切分好的拼音数组
 */
- (NSArray<NSString *> *)pyStringFromCurrentBuffer;

/**
 懒人模式，直接用拼音换整句，每次都是全新的，支持模糊音但无法支持纠错
 
 @param buffer 连续不带分隔的拼音串
 @return 计算好的中文字符串x1
 */
- (NSString *)candidateWithBuffer:(NSString *)buffer;

/**
 步进输入一个或多个字符，带缓存,输入新字符串记得先清空
 
 @param buffer 一个或多个字符
 */
- (NSString *)insertWithChar:(NSString *)buffer;

/**
 获取当前buffer生成的整句，不清空buffer方便后续增减
 
 @return 当前buffer生成的整句
 */
- (NSString *)currentCandidate;

/**
 获取引擎内部当前buffer
 
 @return 引擎内部当前buffer
 */
- (NSString *)currentBuffer;

- (void)clearBuffer;

- (void)backwardBuffer;


@end

#endif /* SunPinyinLibWrapper_h */
