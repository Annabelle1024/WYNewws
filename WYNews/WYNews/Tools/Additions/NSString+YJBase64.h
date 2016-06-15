//
//  NSString+CZBase64.h
//
//  Created by Annabelle on 16/6/10.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJBase64)

/// 对当前字符串进行 BASE 64 编码，并且返回结果
- (NSString *)yj_base64Encode;

/// 对当前字符串进行 BASE 64 解码，并且返回结果
- (NSString *)yj_base64Decode;

@end
