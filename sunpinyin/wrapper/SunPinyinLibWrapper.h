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
@interface SunpinyinWrapper:NSObject

@property BOOL an2ang;
@property BOOL in2ing;
@property BOOL en2eng;
@property BOOL z2zh;
@property BOOL c2ch;
@property BOOL s2sh;
@property BOOL f2h;
@property BOOL r2l;
@property BOOL l2n;

@property  BOOL gn2ng;
@property  BOOL mg2ng;
@property  BOOL uen2un;
@property  BOOL iou2iu;
@property  BOOL uei2ui;


/**
 更新模糊音后触发更新
 */
- (void) updateFuzzConfig;

/**
 从 buffer 获取拼音切分串
 
 @param  buffer 连续不带分隔的拼音串
 @return 切分好的拼音数组
 */
- (NSArray<NSString*>*) pyStringFrom:(NSString*)  buffer ;

/**
 懒人模式，直接用拼音换整句，每次都是全新的
 
 @param buffer 连续不带分隔的拼音串
 @return 计算好的中文字符串x1
 */
- (NSString*) candidateWithBuffer: (NSString*) buffer ;

/**
 步进输入一个或多个字符，带缓存,输入新字符串记得先清空
 
 @param buffer 一个或多个字符
 */
- (void) insertWithChar: (NSString*) buffer ;

/**
 获取当前buffer生成的整句，不清空buffer方便后续增减
 
 @return 当前buffer生成的整句
 */
- (NSString*) currentCandidate ;

- (void) clearBuffer ;

- (void) backwardBuffer;


- (void)test;
@end

#endif /* SunPinyinLibWrapper_h */
