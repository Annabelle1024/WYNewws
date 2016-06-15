//
//  NSString+YJPath.h
//
//  Created by Annabelle on 16/6/10.
//  Copyright © 2016年 annabelle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJPath)

/// 给当前文件追加文档路径
- (NSString *)yj_appendDocumentDir;

/// 给当前文件追加缓存路径
- (NSString *)yj_appendCacheDir;

/// 给当前文件追加临时路径
- (NSString *)yj_appendTempDir;

@end
