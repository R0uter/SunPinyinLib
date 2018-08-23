//
//  SunPinyinLibWrapper.m
//  SunPinyinLib
//
//  Created by R0uter on 8/22/18.
//  Copyright © 2018 R0uter. All rights reserved.
//
#import "SunPinyinLibWrapper.h"
#import <iostream>

#import "../ime-core/imi_context.h"
#import "../pinyin/segmentor.h"
#import "../ime-core/imi_options.h"
#ifdef WORDS_BIGENDIAN
#define UTF32Encoding NSUTF32BigEndianStringEncoding
#else
#define UTF32Encoding NSUTF32LittleEndianStringEncoding
#endif

@implementation SunpinyinWrapper

@synthesize  an2ang;
@synthesize  in2ing;
@synthesize  en2eng;
@synthesize  z2zh;
@synthesize  c2ch;
@synthesize  s2sh;
@synthesize  f2h;
@synthesize  r2l;
@synthesize  l2n;

@synthesize  gn2ng;
@synthesize  mg2ng;
@synthesize  uen2un;
@synthesize  iou2iu;
@synthesize  uei2ui;



- (id)init {
    self = [super init];
      an2ang = NO;
      in2ing = NO;
      en2eng = NO;
      z2zh = NO;
      c2ch = NO;
      s2sh = NO;
      f2h = NO;
      r2l = NO;
      l2n = NO;
    
      gn2ng = NO;
      mg2ng = NO;
      uen2un = NO;
      iou2iu = NO;
      uei2ui = NO;
    
    [self initContext];
    return self;
}

CIMIContext * _context;
IPySegmentor * _pySegmentor;
std::vector<std::pair<int, wstring> > m_sentences;
std::vector<std::pair<wstring, CCandidates> > m_tails;
CCandidates candidates;

- (void) initContext {
    CIMIData * data = new CIMIData();
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    NSString * lmPath = [bundle pathForResource:@"lm_sc" ofType:@"t3g"];
    NSString * pytriePath = [bundle pathForResource:@"pydict_sc" ofType:@"bin"];

    data->loadResource([lmPath cStringUsingEncoding:NSASCIIStringEncoding], [pytriePath cStringUsingEncoding:NSASCIIStringEncoding]);
    CSimplifiedChinesePolicy&  p =  ASimplifiedChinesePolicy::instance();
    CQuanpinSchemePolicy& quanpin_policy = AQuanpinSchemePolicy::instance();
    [self updateFuzzConfig];
    [self updateAutoCorrection];
    
    _context = p.createContext();
    _context->setCoreData(data);
    
    _pySegmentor = quanpin_policy.createPySegmentor();

}

- (void) updateFuzzConfig {
    CQuanpinSchemePolicy& quanpin_policy = AQuanpinSchemePolicy::instance();
    string_pairs fuzzy_pairs;
    BOOL needFuzzy = an2ang || in2ing || en2eng || z2zh || c2ch || s2sh || f2h || r2l || l2n ;
    quanpin_policy.setFuzzyForwarding(needFuzzy,false);
    if (!needFuzzy) {
        quanpin_policy.clearFuzzyPinyinPairs();
        return;
    }
    
    if (an2ang) {
        fuzzy_pairs.push_back(std::make_pair("an",  "ang"));
        fuzzy_pairs.push_back(std::make_pair("ian", "iang"));
        fuzzy_pairs.push_back(std::make_pair("uan", "uang"));
    }
    if (in2ing) fuzzy_pairs.push_back(std::make_pair("in",  "ing"));
    if (en2eng)  fuzzy_pairs.push_back(std::make_pair("en",  "eng"));
    if (z2zh)  fuzzy_pairs.push_back(std::make_pair("zh",  "z"));
    if (c2ch)  fuzzy_pairs.push_back(std::make_pair("ch",  "c"));
    if (s2sh)  fuzzy_pairs.push_back(std::make_pair("sh",  "s"));
    if (f2h)  fuzzy_pairs.push_back(std::make_pair("f",   "h"));
    if (r2l)  fuzzy_pairs.push_back(std::make_pair("l",   "r"));
    if (l2n)  fuzzy_pairs.push_back(std::make_pair("n",   "l"));
    quanpin_policy.setFuzzyPinyinPairs   (fuzzy_pairs);
}

- (void) updateAutoCorrection {
    CQuanpinSchemePolicy& quanpin_policy = AQuanpinSchemePolicy::instance();
    string_pairs correcting_pairs;
    BOOL needCorrection = gn2ng || mg2ng || uen2un || iou2iu || uei2ui  ;
    quanpin_policy.setAutoCorrecting(needCorrection);
    if (!needCorrection) return;

    if (gn2ng) correcting_pairs.push_back(std::make_pair("gn",  "ng"));
    if (mg2ng) {
       correcting_pairs.push_back(std::make_pair("img",  "ing"));
        correcting_pairs.push_back(std::make_pair("omg",  "ong"));
        correcting_pairs.push_back(std::make_pair("emg",  "eng"));
        correcting_pairs.push_back(std::make_pair("amg",  "ang"));
    }
    if (uen2un)  correcting_pairs.push_back(std::make_pair("uen",  "un"));
    if (iou2iu)  correcting_pairs.push_back(std::make_pair("iou",  "iu"));
    if (uei2ui)  correcting_pairs.push_back(std::make_pair("uei",  "ui"));
 //nr -> ne ?
    quanpin_policy.setAutoCorrectionPairs(correcting_pairs);
}
//- (void) insertBuffer:(NSString*)str {
////    for (int i = 0; i < [str lengthOfBytesUsingEncoding:NSASCIIStringEncoding]; i++) {
////        char c = [str cStringUsingEncoding:NSASCIIStringEncoding][i];
////        _pySegmentor->push(c);
////    }
//    std::string s = [str cStringUsingEncoding:NSASCIIStringEncoding];
//    std::string::const_iterator it = s.begin();
//    for (; it != s.end(); ++it) {
//        _pySegmentor->push(*it & 0x7f);
//    }
////    IPySegmentor::TSegmentVec v = _pySegmentor->getSegments();
////    for (int i = 0; i < v.size(); i++) {
////        std::cout << CPinyinData::decodeSyllable(v[i].m_syllables[0]) << "'";
////    }
////    std::cout << "\n";
//
//
//}
- (NSString*) candidateWithBuffer: (NSString*) buffer {
    //将buffer输入给 segmentor
    std::string s = [buffer cStringUsingEncoding:NSASCIIStringEncoding];
    std::string::const_iterator it = s.begin();
    for (; it != s.end(); ++it) {
        _pySegmentor->push(*it & 0x7f);
    }
    //根据切分好的拼音段来查询模型
    _context->buildLattice(_pySegmentor,true);
    //获取最佳候选
    wstring result;
    _context->getBestSentence(result, 0,0);
    //转换成字符串返回
    size_t len = result.length() * sizeof(TWCHAR);
    NSString *string = [[NSString alloc] initWithBytes:result.c_str() length:len encoding:UTF32Encoding];
    _context->clear();
    return string;

}
- (void) clearBuffer {
    _pySegmentor->clear();
}

- (void) backwardBuffer {
    _pySegmentor->pop();
}

- (void) test {
    NSLog(@"abcdefg");
}

@end


