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


- (NSString*) candidateWithBuffer: (NSString*) buffer;

- (void) clearBuffer ;

- (void) backwardBuffer;


- (void)test;
@end

#endif /* SunPinyinLibWrapper_h */
