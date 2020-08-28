//
//  LFHookUtil.m
//  jshook
//
//  Created by wulinfeng on 2020/8/17.
//  Copyright © 2020 wulinfeng. All rights reserved.
//

#import "LFHookUtil.h"

@implementation LFHookUtil

+ (void)writeTxt:(NSString *)msg toFile:(NSString *)fileName {
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *dirPath = [docPath stringByAppendingPathComponent:@"jshook"];
    NSString *filePath = [dirPath stringByAppendingPathComponent:fileName];
    if (![NSFileManager.defaultManager fileExistsAtPath:filePath.stringByDeletingLastPathComponent]) {
        [NSFileManager.defaultManager createDirectoryAtPath:filePath.stringByDeletingLastPathComponent withIntermediateDirectories:YES attributes:nil error:nil];
    }
    if (![NSFileManager.defaultManager fileExistsAtPath:filePath]) {
        [@"" writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    NSFileHandle *handle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    if(handle) {
      [handle seekToEndOfFile];
      NSData *data2 = [msg dataUsingEncoding:NSUTF8StringEncoding];
      [handle writeData:data2];
    }
}

@end
