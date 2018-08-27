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
{
    @private
    CIMIContext *_context;
    IPySegmentor *_pySegmentor;
//    std::vector<std::pair<int, wstring> > m_sentences;
//    std::vector<std::pair<wstring, CCandidates> > m_tails;
//    CCandidates candidates;
}

- (void)dealloc
{
    _pySegmentor->clear();
    delete _pySegmentor;
    
    _context->clear();
    delete _context;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initContext];
    }
    return self;
}


- (void)initContext
{
    CIMIData *data = new CIMIData();
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    NSString *lmPath = [bundle pathForResource:@"lm_sc" ofType:@"t3g"];
    NSString *pytriePath = [bundle pathForResource:@"pydict_sc" ofType:@"bin"];

    data->loadResource(lmPath.fileSystemRepresentation, pytriePath.fileSystemRepresentation);
    CSimplifiedChinesePolicy&  p =  ASimplifiedChinesePolicy::instance();
    CQuanpinSchemePolicy& quanpin_policy = AQuanpinSchemePolicy::instance();
    [self updateFuzzConfig];
    [self updateAutoCorrection];
    
    _context = p.createContext();
    _context->setCoreData(data);
    
    _pySegmentor = quanpin_policy.createPySegmentor();
}

- (void)updateFuzzConfig
{
    CQuanpinSchemePolicy& quanpin_policy = AQuanpinSchemePolicy::instance();
    string_pairs fuzzy_pairs;
    bool needFuzzy = _an2ang || _in2ing || _en2eng || _z2zh || _c2ch || _s2sh || _f2h || _r2l || _l2n;
    quanpin_policy.setFuzzyForwarding(needFuzzy, false);
    if (!needFuzzy) {
        quanpin_policy.clearFuzzyPinyinPairs();
        return;
    }
    
    if (_an2ang) {
        fuzzy_pairs.push_back(std::make_pair("an",  "ang"));
        fuzzy_pairs.push_back(std::make_pair("ian", "iang"));
        fuzzy_pairs.push_back(std::make_pair("uan", "uang"));
    }
    if (_in2ing) fuzzy_pairs.push_back(std::make_pair("in",  "ing"));
    if (_en2eng)  fuzzy_pairs.push_back(std::make_pair("en",  "eng"));
    if (_z2zh)  fuzzy_pairs.push_back(std::make_pair("zh",  "z"));
    if (_c2ch)  fuzzy_pairs.push_back(std::make_pair("ch",  "c"));
    if (_s2sh)  fuzzy_pairs.push_back(std::make_pair("sh",  "s"));
    if (_f2h)  fuzzy_pairs.push_back(std::make_pair("f",   "h"));
    if (_r2l)  fuzzy_pairs.push_back(std::make_pair("l",   "r"));
    if (_l2n)  fuzzy_pairs.push_back(std::make_pair("n",   "l"));
    quanpin_policy.setFuzzyPinyinPairs(fuzzy_pairs);
}

- (void)updateAutoCorrection {
    CQuanpinSchemePolicy& quanpin_policy = AQuanpinSchemePolicy::instance();
    string_pairs correcting_pairs;
    BOOL needCorrection = _gn2ng || _mg2ng || _uen2un || _iou2iu || _uei2ui;
    quanpin_policy.setAutoCorrecting(needCorrection);
    if (!needCorrection) return;

    if (_gn2ng) correcting_pairs.push_back(std::make_pair("gn",  "ng"));
    if (_mg2ng) {
       correcting_pairs.push_back(std::make_pair("img",  "ing"));
        correcting_pairs.push_back(std::make_pair("omg",  "ong"));
        correcting_pairs.push_back(std::make_pair("emg",  "eng"));
        correcting_pairs.push_back(std::make_pair("amg",  "ang"));
    }
    if (_uen2un)  correcting_pairs.push_back(std::make_pair("uen",  "un"));
    if (_iou2iu)  correcting_pairs.push_back(std::make_pair("iou",  "iu"));
    if (_uei2ui)  correcting_pairs.push_back(std::make_pair("uei",  "ui"));
 //nr -> ne ?
    quanpin_policy.setAutoCorrectionPairs(correcting_pairs);
}


/**
 从 buffer 获取拼音切分串

 @param  buffer 连续不带分隔的拼音串
 @return 切分好的拼音数组
 */
- (NSArray<NSString *> *)pyStringFrom:(NSString *) buffer {
    NSMutableArray *list = NSMutableArray.array;
    IPySegmentor::TSegmentVec v = _pySegmentor->getSegments();
    for (int i = 0; i < v.size(); i++) {
        std::string s = CPinyinData::decodeSyllable(v[i].m_syllables[0]);
        [list addObject:@(s.c_str())];
    }
    return list;
}

/**
 懒人模式，直接用拼音换整句，每次都是全新的

 @param buffer 连续不带分隔的拼音串
 @return 计算好的中文字符串x1
 */
- (NSString *)candidateWithBuffer:(NSString *)buffer {
    //将buffer输入给 segmentor
    [self clearBuffer];
    std::string s = [buffer cStringUsingEncoding:NSASCIIStringEncoding];
    for (int i = (int)s.length(); i >= 0; i--) {
        _pySegmentor->insertAt(0, s[i-1]);
    }

    NSString *string = [self currentCandidate];
    return string;
}



/**
 步进输入一个或多个字符，带缓存,输入新字符串记得先清空

 @param buffer 一个或多个字符
 */
- (void)insertWithChar:(NSString *)buffer {
    std::string s = [buffer cStringUsingEncoding:NSASCIIStringEncoding];
    std::string::const_iterator it = s.begin();
    for (; it != s.end(); ++it) {
        _pySegmentor->push(*it & 0x7f);
        _context->buildLattice(_pySegmentor,true);
    }
}


/**
 获取当前buffer生成的整句，不清空buffer方便后续增减

 @return 当前buffer生成的整句
 */
- (NSString *)currentCandidate {
    //根据切分好的拼音段来查询模型
    _context->buildLattice(_pySegmentor,true);
    //获取最佳候选
    wstring result;
    _context->getBestSentence(result, 0,0);
    //转换成字符串返回
    size_t len = result.length() * sizeof(TWCHAR);
    NSString *string = [[NSString alloc] initWithBytes:result.c_str() length:len encoding:UTF32Encoding];
    return string;
}


/**
 获取引擎内部当前buffer

 @return 引擎内部当前buffer
 */
- (NSString *)currentBuffer {
    wstring result = _pySegmentor->getInputBuffer();
    size_t len = result.length() * sizeof(TWCHAR);
    NSString *string = [[NSString alloc] initWithBytes:result.c_str() length:len encoding:UTF32Encoding];
    return string;
}

- (void)clearBuffer {
    _pySegmentor->clear();
    _context->clear();
}

- (void)backwardBuffer {
    _pySegmentor->pop();
    _context->buildLattice(_pySegmentor,true);
}

@end


