//
//  pinyin_data.swift
//  test-macOS
//
//  Created by R0uter on 10/25/18.
//  Copyright © 2018 R0uter. All rights reserved.
//

import Foundation
private let pinyin:Set<String> = [
    "kei","zhang","guan","ei","guo","nei","zha","hen","chuang","fen","pao","geng","xin","nang","fang",
    "yao","ran","tong","seng","nao","teng","nie","te","nou","run","dui","die","ne","pu","bai","pen","qu","cun",
    "shen","tie","bo","liao","tun","zhan","cui","zhun","en","mie","zai","rua","cang","shan","kun","bing","lian",
    "bin","sou","tei","di","shai","deng","eng","shuai","pei","wa","shui","li","duan","dai","gen","suo","mei",
    "san","su","pin","zhuang","fan","cong","huo","ru","hou","ku","men","lei","ka","qie","yo","zheng","kong",
    "che","gang","yin","zhui","chun","kui","lia","se","yuan","ting","fo","he","jin","ying","fei","mo","wan","na",
    "nuan","chai","la","sheng","cu","hang","shuo","niao","qiao","jue","shu","si","gou","beng","zhai","me","xu",
    "pa","sun","zhu","lun","gei","xian","xiu","que","niu","kua","can","chong","ti","yong","zhuan","piao","cou",
    "xia","nun","ke","ping","kang","bi","tuan","chua","wei","xiang","nuo","shou","shei","bu","ou","leng","gun",
    "po","lue","yan","duo","yun","mou","xing","xiao","han","lou","cai","nian","qin","tou","dong","lai","liang",
    "ri","guai","nv","dia","lv","tu","tian","qing","rao","pian","shuan","ca","zuan","chuan","le","nue","hu",
    "nong","sang","cuo","ya","wu","ga","zei","shang","ye","zong","jie","dou","ni","yi","zao","dan","quan","rou",
    "yu","chui","er","meng","den","diu","lao","qiu","biao","tao","ao","za","chang","fong","bang","hong","chuo",
    "fou","zeng","rui","mang","hei","an","gui","hao","lie","neng","liu","peng","jia","zun","bian","miu",
    "sei","jiao","chan","ang","cen","kan","mi","kou","ai","ling","zhen","sai","ning","diao","fu","chou","qian",
    "ma","de","zhou","tuo","kuo","min","tai","feng","ze","zhuo","dun","jiang","zhao","zhi","lu","yue","qun",
    "jiu","weng","xiong","kao","luan","huan","zang","long","tui","lan","sen","suan","pang","jian","zhe","zhong",
    "zhe","ding","kai","zhua","nan","lin","keng","sui","zhuai","hun","dian","wai","ming","bie","xue","hua",
    "tiao","qi","ba","chi","huang","cuan","a","zen","fa","ce","sha","cheng","jun","ruo","zan","xun","dei","rong",
    "shun","da","luo","shua","pou","pie","gong","juan","yang","kuang","ruan","nai","zou","you","gai","lang",
    "ha","ren","mao","hai","mu","wang","re","she","zuo","ken","chao","zui","chuai","sa","cao","cha","dao","man",
    "kuan","shi","chu","e","ban","ci","qia","sao","kuai","mai","tan","shuang","pi","ju","nen","hui","gua","ta",
    "miao","gao","qiang","gu","ji","du","guang","pan","fiao","mian","reng","huai","ge","wen","nu","pai","zi",
    "nin","ben","song","gan","bao","xuan","chen","jiong","zu","tang","bei","jing","xi","ceng","rang","niang",
    "shao","wo","xie","qiong","heng","dang","o",
    "b","p","m","f","d","t","n","l","g","k","h","j","q","x","zh","ch","sh","r","w","y","z","c","s"
]
let pydict:[String:UInt] = [
    
    "a":      0x00010 ,
    "ai":     0x00040 ,
    "an":     0x00080 ,
    "ang":    0x000a0 ,
    "ao":     0x00060 ,
    "b":      0x01000 ,
    "ba":     0x01010 ,
    "bai":    0x01040 ,
    "ban":    0x01080 ,
    "bang":   0x010a0 ,
    "bao":    0x01060 ,
    "bei":    0x01050 ,
    "ben":    0x01090 ,
    "beng":   0x010b0 ,
    "bi":     0x010d0 ,
    "bian":   0x01120 ,
    "biao":   0x01100 ,
    "bie":    0x010f0 ,
    "bin":    0x01130 ,
    "bing":   0x01150 ,
    "bo":     0x01020 ,
    "bu":     0x01160 ,
    "c":      0x14000 ,
    "ca":     0x14010 ,
    "cai":    0x14040 ,
    "can":    0x14080 ,
    "cang":   0x140a0 ,
    "cao":    0x14060 ,
    "ce":     0x14030 ,
    "cei":    0x14050 ,
    "cen":    0x14090 ,
    "ceng":   0x140b0 ,
    "ch":     0x10000 ,
    "cha":    0x10010 ,
    "chai":   0x10040 ,
    "chan":   0x10080 ,
    "chang":  0x100a0 ,
    "chao":   0x10060 ,
    "che":    0x10030 ,
    "chen":   0x10090 ,
    "cheng":  0x100b0 ,
    "chi":    0x100d0 ,
    "chong":  0x101e0 ,
    "chou":   0x10070 ,
    "chu":    0x10160 ,
    "chua":   0x10170 ,
    "chuai":  0x10190 ,
    "chuan":  0x101b0 ,
    "chuang": 0x101d0 ,
    "chui":   0x101a0 ,
    "chun":   0x101c0 ,
    "chuo":   0x10180 ,
    "ci":     0x140d0 ,
    "cong":   0x141e0 ,
    "cou":    0x14070 ,
    "cu":     0x14160 ,
    "cuan":   0x141b0 ,
    "cui":    0x141a0 ,
    "cun":    0x141c0 ,
    "cuo":    0x14180 ,
    "d":      0x05000 ,
    "da":     0x05010 ,
    "dai":    0x05040 ,
    "dan":    0x05080 ,
    "dang":   0x050a0 ,
    "dao":    0x05060 ,
    "de":     0x05030 ,
    "dei":    0x05050 ,
    "den":    0x05090 ,
    "deng":   0x050b0 ,
    "di":     0x050d0 ,
    "dia":    0x050e0 ,
    "dian":   0x05120 ,
    "diao":   0x05100 ,
    "die":    0x050f0 ,
    "ding":   0x05150 ,
    "diu":    0x05110 ,
    "dong":   0x051e0 ,
    "dou":    0x05070 ,
    "du":     0x05160 ,
    "duan":   0x051b0 ,
    "dui":    0x051a0 ,
    "dun":    0x051c0 ,
    "duo":    0x05180 ,
    "e":      0x00030 ,
    "ei":     0x00050 ,
    "en":     0x00090 ,
    "eng":    0x000b0 ,
    "er":     0x000c0 ,
    "f":      0x04000 ,
    "fa":     0x04010 ,
    "fan":    0x04080 ,
    "fang":   0x040a0 ,
    "fei":    0x04050 ,
    "fen":    0x04090 ,
    "feng":   0x040b0 ,
    "fiao":   0x04100 ,
    "fo":     0x04020 ,
    "fou":    0x04070 ,
    "fu":     0x04160 ,
    "g":      0x09000 ,
    "ga":     0x09010 ,
    "gai":    0x09040 ,
    "gan":    0x09080 ,
    "gang":   0x090a0 ,
    "gao":    0x09060 ,
    "ge":     0x09030 ,
    "gei":    0x09050 ,
    "gen":    0x09090 ,
    "geng":   0x090b0 ,
    "gong":   0x091e0 ,
    "gou":    0x09070 ,
    "gu":     0x09160 ,
    "gua":    0x09170 ,
    "guai":   0x09190 ,
    "guan":   0x091b0 ,
    "guang":  0x091d0 ,
    "gui":    0x091a0 ,
    "gun":    0x091c0 ,
    "guo":    0x09180 ,
    "h":      0x0b000 ,
    "ha":     0x0b010 ,
    "hai":    0x0b040 ,
    "han":    0x0b080 ,
    "hang":   0x0b0a0 ,
    "hao":    0x0b060 ,
    "he":     0x0b030 ,
    "hei":    0x0b050 ,
    "hen":    0x0b090 ,
    "heng":   0x0b0b0 ,
    "hm":     0x18000 ,
    "hong":   0x0b1e0 ,
    "hou":    0x0b070 ,
    "hu":     0x0b160 ,
    "hua":    0x0b170 ,
    "huai":   0x0b190 ,
    "huan":   0x0b1b0 ,
    "huang":  0x0b1d0 ,
    "hui":    0x0b1a0 ,
    "hun":    0x0b1c0 ,
    "huo":    0x0b180 ,
    "j":      0x0c000 ,
    "ji":     0x0c0d0 ,
    "jia":    0x0c0e0 ,
    "jian":   0x0c120 ,
    "jiang":  0x0c140 ,
    "jiao":   0x0c100 ,
    "jie":    0x0c0f0 ,
    "jin":    0x0c130 ,
    "jing":   0x0c150 ,
    "jiong":  0x0c220 ,
    "jiu":    0x0c110 ,
    "ju":     0x0c160 ,
    "juan":   0x0c1b0 ,
    "jue":    0x0c210 ,
    "jun":    0x0c1c0 ,
    "k":      0x0a000 ,
    "ka":     0x0a010 ,
    "kai":    0x0a040 ,
    "kan":    0x0a080 ,
    "kang":   0x0a0a0 ,
    "kao":    0x0a060 ,
    "ke":     0x0a030 ,
    "kei":    0x0a050 ,
    "ken":    0x0a090 ,
    "keng":   0x0a0b0 ,
    "kong":   0x0a1e0 ,
    "kou":    0x0a070 ,
    "ku":     0x0a160 ,
    "kua":    0x0a170 ,
    "kuai":   0x0a190 ,
    "kuan":   0x0a1b0 ,
    "kuang":  0x0a1d0 ,
    "kui":    0x0a1a0 ,
    "kun":    0x0a1c0 ,
    "kuo":    0x0a180 ,
    "l":      0x08000 ,
    "la":     0x08010 ,
    "lai":    0x08040 ,
    "lan":    0x08080 ,
    "lang":   0x080a0 ,
    "lao":    0x08060 ,
    "le":     0x08030 ,
    "lei":    0x08050 ,
    "leng":   0x080b0 ,
    "li":     0x080d0 ,
    "lia":    0x080e0 ,
    "lian":   0x08120 ,
    "liang":  0x08140 ,
    "liao":   0x08100 ,
    "lie":    0x080f0 ,
    "lin":    0x08130 ,
    "ling":   0x08150 ,
    "liu":    0x08110 ,
    "lo":     0x08020 ,
    "long":   0x081e0 ,
    "lou":    0x08070 ,
    "lu":     0x08160 ,
    "luan":   0x081b0 ,
    "lue":    0x08200 ,
    "lun":    0x081c0 ,
    "luo":    0x08180 ,
    "lv":     0x081f0 ,
    "lve":    0x08201 ,
    "m":      0x03000 ,
    "ma":     0x03010 ,
    "mai":    0x03040 ,
    "man":    0x03080 ,
    "mang":   0x030a0 ,
    "mao":    0x03060 ,
    "me":     0x03030 ,
    "mei":    0x03050 ,
    "men":    0x03090 ,
    "meng":   0x030b0 ,
    "mi":     0x030d0 ,
    "mian":   0x03120 ,
    "miao":   0x03100 ,
    "mie":    0x030f0 ,
    "min":    0x03130 ,
    "ming":   0x03150 ,
    "miu":    0x03110 ,
    "mo":     0x03020 ,
    "mou":    0x03070 ,
    "mu":     0x03160 ,
    "n":      0x07000 ,
    "na":     0x07010 ,
    "nai":    0x07040 ,
    "nan":    0x07080 ,
    "nang":   0x070a0 ,
    "nao":    0x07060 ,
    "ne":     0x07030 ,
    "nei":    0x07050 ,
    "nen":    0x07090 ,
    "neng":   0x070b0 ,
    "ng":     0x00230 ,
    "ni":     0x070d0 ,
    "nian":   0x07120 ,
    "niang":  0x07140 ,
    "niao":   0x07100 ,
    "nie":    0x070f0 ,
    "nin":    0x07130 ,
    "ning":   0x07150 ,
    "niu":    0x07110 ,
    "nong":   0x071e0 ,
    "nou":    0x07070 ,
    "nu":     0x07160 ,
    "nuan":   0x071b0 ,
    "nue":    0x07200 ,
    "nun":    0x071c0 ,
    "nuo":    0x07180 ,
    "nv":     0x071f0 ,
    "nve":    0x07201 ,
    "o":      0x00020 ,
    "ou":     0x00070 ,
    "p":      0x02000 ,
    "pa":     0x02010 ,
    "pai":    0x02040 ,
    "pan":    0x02080 ,
    "pang":   0x020a0 ,
    "pao":    0x02060 ,
    "pei":    0x02050 ,
    "pen":    0x02090 ,
    "peng":   0x020b0 ,
    "pi":     0x020d0 ,
    "pian":   0x02120 ,
    "piao":   0x02100 ,
    "pie":    0x020f0 ,
    "pin":    0x02130 ,
    "ping":   0x02150 ,
    "po":     0x02020 ,
    "pou":    0x02070 ,
    "pu":     0x02160 ,
    "q":      0x0d000 ,
    "qi":     0x0d0d0 ,
    "qia":    0x0d0e0 ,
    "qian":   0x0d120 ,
    "qiang":  0x0d140 ,
    "qiao":   0x0d100 ,
    "qie":    0x0d0f0 ,
    "qin":    0x0d130 ,
    "qing":   0x0d150 ,
    "qiong":  0x0d220 ,
    "qiu":    0x0d110 ,
    "qu":     0x0d160 ,
    "quan":   0x0d1b0 ,
    "que":    0x0d210 ,
    "qun":    0x0d1c0 ,
    "r":      0x12000 ,
    "ran":    0x12080 ,
    "rang":   0x120a0 ,
    "rao":    0x12060 ,
    "re":     0x12030 ,
    "ren":    0x12090 ,
    "reng":   0x120b0 ,
    "ri":     0x120d0 ,
    "rong":   0x121e0 ,
    "rou":    0x12070 ,
    "ru":     0x12160 ,
    "rua":    0x12170 ,
    "ruan":   0x121b0 ,
    "rui":    0x121a0 ,
    "run":    0x121c0 ,
    "ruo":    0x12180 ,
    "s":      0x15000 ,
    "sa":     0x15010 ,
    "sai":    0x15040 ,
    "san":    0x15080 ,
    "sang":   0x150a0 ,
    "sao":    0x15060 ,
    "se":     0x15030 ,
    "sen":    0x15090 ,
    "seng":   0x150b0 ,
    "sh":     0x11000 ,
    "sha":    0x11010 ,
    "shai":   0x11040 ,
    "shan":   0x11080 ,
    "shang":  0x110a0 ,
    "shao":   0x11060 ,
    "she":    0x11030 ,
    "shei":   0x11050 ,
    "shen":   0x11090 ,
    "sheng":  0x110b0 ,
    "shi":    0x110d0 ,
    "shou":   0x11070 ,
    "shu":    0x11160 ,
    "shua":   0x11170 ,
    "shuai":  0x11190 ,
    "shuan":  0x111b0 ,
    "shuang": 0x111d0 ,
    "shui":   0x111a0 ,
    "shun":   0x111c0 ,
    "shuo":   0x11180 ,
    "si":     0x150d0 ,
    "song":   0x151e0 ,
    "sou":    0x15070 ,
    "su":     0x15160 ,
    "suan":   0x151b0 ,
    "sui":    0x151a0 ,
    "sun":    0x151c0 ,
    "suo":    0x15180 ,
    "t":      0x06000 ,
    "ta":     0x06010 ,
    "tai":    0x06040 ,
    "tan":    0x06080 ,
    "tang":   0x060a0 ,
    "tao":    0x06060 ,
    "te":     0x06030 ,
    "tei":    0x06050 ,
    "teng":   0x060b0 ,
    "ti":     0x060d0 ,
    "tian":   0x06120 ,
    "tiao":   0x06100 ,
    "tie":    0x060f0 ,
    "ting":   0x06150 ,
    "tong":   0x061e0 ,
    "tou":    0x06070 ,
    "tu":     0x06160 ,
    "tuan":   0x061b0 ,
    "tui":    0x061a0 ,
    "tun":    0x061c0 ,
    "tuo":    0x06180 ,
    "w":      0x17000 ,
    "wa":     0x17010 ,
    "wai":    0x17040 ,
    "wan":    0x17080 ,
    "wang":   0x170a0 ,
    "wei":    0x17050 ,
    "wen":    0x17090 ,
    "weng":   0x170b0 ,
    "wo":     0x17020 ,
    "wu":     0x17160 ,
    "x":      0x0e000 ,
    "xi":     0x0e0d0 ,
    "xia":    0x0e0e0 ,
    "xian":   0x0e120 ,
    "xiang":  0x0e140 ,
    "xiao":   0x0e100 ,
    "xie":    0x0e0f0 ,
    "xin":    0x0e130 ,
    "xing":   0x0e150 ,
    "xiong":  0x0e220 ,
    "xiu":    0x0e110 ,
    "xu":     0x0e160 ,
    "xuan":   0x0e1b0 ,
    "xue":    0x0e210 ,
    "xun":    0x0e1c0 ,
    "y":      0x16000 ,
    "ya":     0x16010 ,
    "yan":    0x16080 ,
    "yang":   0x160a0 ,
    "yao":    0x16060 ,
    "ye":     0x16030 ,
    "yi":     0x160d0 ,
    "yin":    0x16130 ,
    "ying":   0x16150 ,
    "yo":     0x16020 ,
    "yong":   0x161e0 ,
    "you":    0x16070 ,
    "yu":     0x16160 ,
    "yuan":   0x161b0 ,
    "yue":    0x16210 ,
    "yun":    0x161c0 ,
    "z":      0x13000 ,
    "za":     0x13010 ,
    "zai":    0x13040 ,
    "zan":    0x13080 ,
    "zang":   0x130a0 ,
    "zao":    0x13060 ,
    "ze":     0x13030 ,
    "zei":    0x13050 ,
    "zen":    0x13090 ,
    "zeng":   0x130b0 ,
    "zh":     0x0f000 ,
    "zha":    0x0f010 ,
    "zhai":   0x0f040 ,
    "zhan":   0x0f080 ,
    "zhang":  0x0f0a0 ,
    "zhao":   0x0f060 ,
    "zhe":    0x0f030 ,
    "zhei":   0x0f050 ,
    "zhen":   0x0f090 ,
    "zheng":  0x0f0b0 ,
    "zhi":    0x0f0d0 ,
    "zhong":  0x0f1e0 ,
    "zhou":   0x0f070 ,
    "zhu":    0x0f160 ,
    "zhua":   0x0f170 ,
    "zhuai":  0x0f190 ,
    "zhuan":  0x0f1b0 ,
    "zhuang": 0x0f1d0 ,
    "zhui":   0x0f1a0 ,
    "zhun":   0x0f1c0 ,
    "zhuo":   0x0f180 ,
    "zi":     0x130d0 ,
    "zong":   0x131e0 ,
    "zou":    0x13070 ,
    "zu":     0x13160 ,
    "zuan":   0x131b0 ,
    "zui":    0x131a0 ,
    "zun":    0x131c0 ,
    "zuo":    0x13180 ,
//    "'"     :   0x1,
]
let pydicR:[UInt:String] = [

    0x00010 :    "a" ,
    0x00040 :    "ai" ,
    0x00080 :    "an" ,
    0x000a0 :    "ang" ,
    0x00060 :    "ao" ,
    0x01000 :    "b" ,
    0x01010 :    "ba" ,
    0x01040 :    "bai" ,
    0x01080 :    "ban" ,
    0x010a0 :    "bang" ,
    0x01060 :    "bao" ,
    0x01050 :    "bei" ,
    0x01090 :    "ben" ,
    0x010b0 :    "beng" ,
    0x010d0 :    "bi" ,
    0x01120 :    "bian" ,
    0x01100 :    "biao" ,
    0x010f0 :    "bie" ,
    0x01130 :    "bin" ,
    0x01150 :    "bing" ,
    0x01020 :    "bo" ,
    0x01160 :    "bu" ,
    0x14000 :    "c" ,
    0x14010 :    "ca" ,
    0x14040 :    "cai" ,
    0x14080 :    "can" ,
    0x140a0 :    "cang" ,
    0x14060 :    "cao" ,
    0x14030 :    "ce" ,
    0x14050 :    "cei" ,
    0x14090 :    "cen" ,
    0x140b0 :    "ceng" ,
    0x10000 :    "ch" ,
    0x10010 :    "cha" ,
    0x10040 :    "chai" ,
    0x10080 :    "chan" ,
    0x100a0 :    "chang" ,
    0x10060 :    "chao" ,
    0x10030 :    "che" ,
    0x10090 :    "chen" ,
    0x100b0 :    "cheng" ,
    0x100d0 :    "chi" ,
    0x101e0 :    "chong" ,
    0x10070 :    "chou" ,
    0x10160 :    "chu" ,
    0x10170 :    "chua" ,
    0x10190 :    "chuai" ,
    0x101b0 :    "chuan" ,
    0x101d0 :    "chuang" ,
    0x101a0 :    "chui" ,
    0x101c0 :    "chun" ,
    0x10180 :    "chuo" ,
    0x140d0 :    "ci" ,
    0x141e0 :    "cong" ,
    0x14070 :    "cou" ,
    0x14160 :    "cu" ,
    0x141b0 :    "cuan" ,
    0x141a0 :    "cui" ,
    0x141c0 :    "cun" ,
    0x14180 :    "cuo" ,
    0x05000 :    "d" ,
    0x05010 :    "da" ,
    0x05040 :    "dai" ,
    0x05080 :    "dan" ,
    0x050a0 :    "dang" ,
    0x05060 :    "dao" ,
    0x05030 :    "de" ,
    0x05050 :    "dei" ,
    0x05090 :    "den" ,
    0x050b0 :    "deng" ,
    0x050d0 :    "di" ,
    0x050e0 :    "dia" ,
    0x05120 :    "dian" ,
    0x05100 :    "diao" ,
    0x050f0 :    "die" ,
    0x05150 :    "ding" ,
    0x05110 :    "diu" ,
    0x051e0 :    "dong" ,
    0x05070 :    "dou" ,
    0x05160 :    "du" ,
    0x051b0 :    "duan" ,
    0x051a0 :    "dui" ,
    0x051c0 :    "dun" ,
    0x05180 :    "duo" ,
    0x00030 :    "e" ,
    0x00050 :    "ei" ,
    0x00090 :    "en" ,
    0x000b0 :    "eng" ,
    0x000c0 :    "er" ,
    0x04000 :    "f" ,
    0x04010 :    "fa" ,
    0x04080 :    "fan" ,
    0x040a0 :    "fang" ,
    0x04050 :    "fei" ,
    0x04090 :    "fen" ,
    0x040b0 :    "feng" ,
    0x04100 :    "fiao" ,
    0x04020 :    "fo" ,
    0x04070 :    "fou" ,
    0x04160 :    "fu" ,
    0x09000 :    "g" ,
    0x09010 :    "ga" ,
    0x09040 :    "gai" ,
    0x09080 :    "gan" ,
    0x090a0 :    "gang" ,
    0x09060 :    "gao" ,
    0x09030 :    "ge" ,
    0x09050 :    "gei" ,
    0x09090 :    "gen" ,
    0x090b0 :    "geng" ,
    0x091e0 :    "gong" ,
    0x09070 :    "gou" ,
    0x09160 :    "gu" ,
    0x09170 :    "gua" ,
    0x09190 :    "guai" ,
    0x091b0 :    "guan" ,
    0x091d0 :    "guang" ,
    0x091a0 :    "gui" ,
    0x091c0 :    "gun" ,
    0x09180 :    "guo" ,
    0x0b000 :    "h" ,
    0x0b010 :    "ha" ,
    0x0b040 :    "hai" ,
    0x0b080 :    "han" ,
    0x0b0a0 :    "hang" ,
    0x0b060 :    "hao" ,
    0x0b030 :    "he" ,
    0x0b050 :    "hei" ,
    0x0b090 :    "hen" ,
    0x0b0b0 :    "heng" ,
    0x18000 :    "hm" ,
    0x0b1e0 :    "hong" ,
    0x0b070 :    "hou" ,
    0x0b160 :    "hu" ,
    0x0b170 :    "hua" ,
    0x0b190 :    "huai" ,
    0x0b1b0 :    "huan" ,
    0x0b1d0 :    "huang" ,
    0x0b1a0 :    "hui" ,
    0x0b1c0 :    "hun" ,
    0x0b180 :    "huo" ,
    0x0c000 :    "j" ,
    0x0c0d0 :    "ji" ,
    0x0c0e0 :    "jia" ,
    0x0c120 :    "jian" ,
    0x0c140 :    "jiang" ,
    0x0c100 :    "jiao" ,
    0x0c0f0 :    "jie" ,
    0x0c130 :    "jin" ,
    0x0c150 :    "jing" ,
    0x0c220 :    "jiong" ,
    0x0c110 :    "jiu" ,
    0x0c160 :    "ju" ,
    0x0c1b0 :    "juan" ,
    0x0c210 :    "jue" ,
    0x0c1c0 :    "jun" ,
    0x0a000 :    "k" ,
    0x0a010 :    "ka" ,
    0x0a040 :    "kai" ,
    0x0a080 :    "kan" ,
    0x0a0a0 :    "kang" ,
    0x0a060 :    "kao" ,
    0x0a030 :    "ke" ,
    0x0a050 :    "kei" ,
    0x0a090 :    "ken" ,
    0x0a0b0 :    "keng" ,
    0x0a1e0 :    "kong" ,
    0x0a070 :    "kou" ,
    0x0a160 :    "ku" ,
    0x0a170 :    "kua" ,
    0x0a190 :    "kuai" ,
    0x0a1b0 :    "kuan" ,
    0x0a1d0 :    "kuang" ,
    0x0a1a0 :    "kui" ,
    0x0a1c0 :    "kun" ,
    0x0a180 :    "kuo" ,
    0x08000 :    "l" ,
    0x08010 :    "la" ,
    0x08040 :    "lai" ,
    0x08080 :    "lan" ,
    0x080a0 :    "lang" ,
    0x08060 :    "lao" ,
    0x08030 :    "le" ,
    0x08050 :    "lei" ,
    0x080b0 :    "leng" ,
    0x080d0 :    "li" ,
    0x080e0 :    "lia" ,
    0x08120 :    "lian" ,
    0x08140 :    "liang" ,
    0x08100 :    "liao" ,
    0x080f0 :    "lie" ,
    0x08130 :    "lin" ,
    0x08150 :    "ling" ,
    0x08110 :    "liu" ,
    0x08020 :    "lo" ,
    0x081e0 :    "long" ,
    0x08070 :    "lou" ,
    0x08160 :    "lu" ,
    0x081b0 :    "luan" ,
    0x08200 :    "lue" ,
    0x081c0 :    "lun" ,
    0x08180 :    "luo" ,
    0x081f0 :    "lv" ,
    0x08201 :    "lve" ,
    0x03000 :    "m" ,
    0x03010 :    "ma" ,
    0x03040 :    "mai" ,
    0x03080 :    "man" ,
    0x030a0 :    "mang" ,
    0x03060 :    "mao" ,
    0x03030 :    "me" ,
    0x03050 :    "mei" ,
    0x03090 :    "men" ,
    0x030b0 :    "meng" ,
    0x030d0 :    "mi" ,
    0x03120 :    "mian" ,
    0x03100 :    "miao" ,
    0x030f0 :    "mie" ,
    0x03130 :    "min" ,
    0x03150 :    "ming" ,
    0x03110 :    "miu" ,
    0x03020 :    "mo" ,
    0x03070 :    "mou" ,
    0x03160 :    "mu" ,
    0x07000 :    "n" ,
    0x07010 :    "na" ,
    0x07040 :    "nai" ,
    0x07080 :    "nan" ,
    0x070a0 :    "nang" ,
    0x07060 :    "nao" ,
    0x07030 :    "ne" ,
    0x07050 :    "nei" ,
    0x07090 :    "nen" ,
    0x070b0 :    "neng" ,
    0x00230 :    "ng" ,
    0x070d0 :    "ni" ,
    0x07120 :    "nian" ,
    0x07140 :    "niang" ,
    0x07100 :    "niao" ,
    0x070f0 :    "nie" ,
    0x07130 :    "nin" ,
    0x07150 :    "ning" ,
    0x07110 :    "niu" ,
    0x071e0 :    "nong" ,
    0x07070 :    "nou" ,
    0x07160 :    "nu" ,
    0x071b0 :    "nuan" ,
    0x07200 :    "nue" ,
    0x071c0 :    "nun" ,
    0x07180 :    "nuo" ,
    0x071f0 :    "nv" ,
    0x07201 :    "nve" ,
    0x00020 :    "o" ,
    0x00070 :    "ou" ,
    0x02000 :    "p" ,
    0x02010 :    "pa" ,
    0x02040 :    "pai" ,
    0x02080 :    "pan" ,
    0x020a0 :    "pang" ,
    0x02060 :    "pao" ,
    0x02050 :    "pei" ,
    0x02090 :    "pen" ,
    0x020b0 :    "peng" ,
    0x020d0 :    "pi" ,
    0x02120 :    "pian" ,
    0x02100 :    "piao" ,
    0x020f0 :    "pie" ,
    0x02130 :    "pin" ,
    0x02150 :    "ping" ,
    0x02020 :    "po" ,
    0x02070 :    "pou" ,
    0x02160 :    "pu" ,
    0x0d000 :    "q" ,
    0x0d0d0 :    "qi" ,
    0x0d0e0 :    "qia" ,
    0x0d120 :    "qian" ,
    0x0d140 :    "qiang" ,
    0x0d100 :    "qiao" ,
    0x0d0f0 :    "qie" ,
    0x0d130 :    "qin" ,
    0x0d150 :    "qing" ,
    0x0d220 :    "qiong" ,
    0x0d110 :    "qiu" ,
    0x0d160 :    "qu" ,
    0x0d1b0 :    "quan" ,
    0x0d210 :    "que" ,
    0x0d1c0 :    "qun" ,
    0x12000 :    "r" ,
    0x12080 :    "ran" ,
    0x120a0 :    "rang" ,
    0x12060 :    "rao" ,
    0x12030 :    "re" ,
    0x12090 :    "ren" ,
    0x120b0 :    "reng" ,
    0x120d0 :    "ri" ,
    0x121e0 :    "rong" ,
    0x12070 :    "rou" ,
    0x12160 :    "ru" ,
    0x12170 :    "rua" ,
    0x121b0 :    "ruan" ,
    0x121a0 :    "rui" ,
    0x121c0 :    "run" ,
    0x12180 :    "ruo" ,
    0x15000 :    "s" ,
    0x15010 :    "sa" ,
    0x15040 :    "sai" ,
    0x15080 :    "san" ,
    0x150a0 :    "sang" ,
    0x15060 :    "sao" ,
    0x15030 :    "se" ,
    0x15090 :    "sen" ,
    0x150b0 :    "seng" ,
    0x11000 :    "sh" ,
    0x11010 :    "sha" ,
    0x11040 :    "shai" ,
    0x11080 :    "shan" ,
    0x110a0 :    "shang" ,
    0x11060 :    "shao" ,
    0x11030 :    "she" ,
    0x11050 :    "shei" ,
    0x11090 :    "shen" ,
    0x110b0 :    "sheng" ,
    0x110d0 :    "shi" ,
    0x11070 :    "shou" ,
    0x11160 :    "shu" ,
    0x11170 :    "shua" ,
    0x11190 :    "shuai" ,
    0x111b0 :    "shuan" ,
    0x111d0 :    "shuang" ,
    0x111a0 :    "shui" ,
    0x111c0 :    "shun" ,
    0x11180 :    "shuo" ,
    0x150d0 :    "si" ,
    0x151e0 :    "song" ,
    0x15070 :    "sou" ,
    0x15160 :    "su" ,
    0x151b0 :    "suan" ,
    0x151a0 :    "sui" ,
    0x151c0 :    "sun" ,
    0x15180 :    "suo" ,
    0x06000 :    "t" ,
    0x06010 :    "ta" ,
    0x06040 :    "tai" ,
    0x06080 :    "tan" ,
    0x060a0 :    "tang" ,
    0x06060 :    "tao" ,
    0x06030 :    "te" ,
    0x06050 :    "tei" ,
    0x060b0 :    "teng" ,
    0x060d0 :    "ti" ,
    0x06120 :    "tian" ,
    0x06100 :    "tiao" ,
    0x060f0 :    "tie" ,
    0x06150 :    "ting" ,
    0x061e0 :    "tong" ,
    0x06070 :    "tou" ,
    0x06160 :    "tu" ,
    0x061b0 :    "tuan" ,
    0x061a0 :    "tui" ,
    0x061c0 :    "tun" ,
    0x06180 :    "tuo" ,
    0x17000 :    "w" ,
    0x17010 :    "wa" ,
    0x17040 :    "wai" ,
    0x17080 :    "wan" ,
    0x170a0 :    "wang" ,
    0x17050 :    "wei" ,
    0x17090 :    "wen" ,
    0x170b0 :    "weng" ,
    0x17020 :    "wo" ,
    0x17160 :    "wu" ,
    0x0e000 :    "x" ,
    0x0e0d0 :    "xi" ,
    0x0e0e0 :    "xia" ,
    0x0e120 :    "xian" ,
    0x0e140 :    "xiang" ,
    0x0e100 :    "xiao" ,
    0x0e0f0 :    "xie" ,
    0x0e130 :    "xin" ,
    0x0e150 :    "xing" ,
    0x0e220 :    "xiong" ,
    0x0e110 :    "xiu" ,
    0x0e160 :    "xu" ,
    0x0e1b0 :    "xuan" ,
    0x0e210 :    "xue" ,
    0x0e1c0 :    "xun" ,
    0x16000 :    "y" ,
    0x16010 :    "ya" ,
    0x16080 :    "yan" ,
    0x160a0 :    "yang" ,
    0x16060 :    "yao" ,
    0x16030 :    "ye" ,
    0x160d0 :    "yi" ,
    0x16130 :    "yin" ,
    0x16150 :    "ying" ,
    0x16020 :    "yo" ,
    0x161e0 :    "yong" ,
    0x16070 :    "you" ,
    0x16160 :    "yu" ,
    0x161b0 :    "yuan" ,
    0x16210 :    "yue" ,
    0x161c0 :    "yun" ,
    0x13000 :    "z" ,
    0x13010 :    "za" ,
    0x13040 :    "zai" ,
    0x13080 :    "zan" ,
    0x130a0 :    "zang" ,
    0x13060 :    "zao" ,
    0x13030 :    "ze" ,
    0x13050 :    "zei" ,
    0x13090 :    "zen" ,
    0x130b0 :    "zeng" ,
    0x0f000 :    "zh" ,
    0x0f010 :    "zha" ,
    0x0f040 :    "zhai" ,
    0x0f080 :    "zhan" ,
    0x0f0a0 :    "zhang" ,
    0x0f060 :    "zhao" ,
    0x0f030 :    "zhe" ,
    0x0f050 :    "zhei" ,
    0x0f090 :    "zhen" ,
    0x0f0b0 :    "zheng" ,
    0x0f0d0 :    "zhi" ,
    0x0f1e0 :    "zhong" ,
    0x0f070 :    "zhou" ,
    0x0f160 :    "zhu" ,
    0x0f170 :    "zhua" ,
    0x0f190 :    "zhuai" ,
    0x0f1b0 :    "zhuan" ,
    0x0f1d0 :    "zhuang" ,
    0x0f1a0 :    "zhui" ,
    0x0f1c0 :    "zhun" ,
    0x0f180 :    "zhuo" ,
    0x130d0 :    "zi" ,
    0x131e0 :    "zong" ,
    0x13070 :    "zou" ,
    0x13160 :    "zu" ,
    0x131b0 :    "zuan" ,
    0x131a0 :    "zui" ,
    0x131c0 :    "zun" ,
    0x13180 :    "zuo" ,
//    0x1     :     "'" ,

]
func segpy(str:String) ->[String] {
    var start = 0
    var lArray:[UInt] = []
    var rArray:[UInt] = []
    let max_py_length = 7
    while start < str.count {
        for i in (1...max_py_length).reversed() {
            
            var end = i+start
            if end > str.count {
                end = str.count
            }
            let sub = str.subString(from: start, to: end)
            guard let index = pydict[sub] else {
                if !sub.isEmpty, sub.count == 1 {start += 1;break}
                continue
            }
            start = end
            lArray.append(index)
            break
        }
    }
//    while start > 0 {
//        for i in (1...max_py_length).reversed() {
//
//            var end = start-i
//            if end < 0 {
//                end = 0
//            }
//            let sub = str.subString(from: end, to: start)
//            guard let index = pydict[sub] else {
//                if !sub.isEmpty, sub.count == 1 {start -= 1;break}
//                continue
//            }
//            start = end
//            rArray.insert(index, at: 0)
//            break
//        }
//    }
    var result :[String] = []
//    if rArray.count != lArray.count {lArray.removeAll()}
    
    for i in 0..<lArray.count {
        let char = lArray[i]
        result.append(pydicR[char]!)
//        if !lArray.isEmpty, rArray[i] != lArray[i] {
//            result[i].append(pydicR[lArray[i]]!)
//        }
    }
    return result
}


extension String {
    /// 用数字切字符串 [0,count)
    ///
    /// - Parameters:
    ///   - from: 开始位置，最小为0
    ///   - to: 结束位置，最大为字符串长度
    /// - Returns: 返回新的字符串
    func subString(from:Int,to:Int) -> String {
        guard from < to && to <= self.count else {return ""}
        let startIndex = self.index(self.startIndex, offsetBy: from)
        let endIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[startIndex ..< endIndex])
    }
}