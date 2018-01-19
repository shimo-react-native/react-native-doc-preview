//
//  RNDocPreviewItem.h
//  RNDocPreview
//
//  Created by Bell Zhong on 2018/1/19.
//  Copyright © 2018年 shimo.im. All rights reserved.
//

#import <React/RCTView.h>
#import "RNDocPreviewItem.h"

@class RCTBridge;

@interface RNDocPreview : RCTView

/**
 file path
 */
@property (nonatomic, strong) NSString * filePath;

- (instancetype)initWithBridge:(RCTBridge *)bridge NS_DESIGNATED_INITIALIZER;

@end
