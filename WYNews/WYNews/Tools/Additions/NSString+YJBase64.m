//
//  NSString+YJBase64.m
//
//  Created by Annabelle on 16/6/10.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import "NSString+YJBase64.h"

@implementation NSString (YJBase64)

- (NSString *)yj_base64Encode {
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)yj_base64Decode {
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
