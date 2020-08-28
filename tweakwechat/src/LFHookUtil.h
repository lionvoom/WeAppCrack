//
//  LFHookUtil.h
//  jshook
//
//  Created by wulinfeng on 2020/8/17.
//  Copyright © 2020 wulinfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFHookUtil : NSObject

+ (void)writeTxt:(NSString *)msg toFile:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
