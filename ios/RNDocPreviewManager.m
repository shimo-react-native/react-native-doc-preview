//
//  RNDocPreviewManager.m
//  RNDocPreview
//
//  Created by Bell Zhong on 2018/1/19.
//  Copyright © 2018年 shimo.im. All rights reserved.
//

#import "RNDocPreviewManager.h"
#import "RNDocPreview.h"

@implementation RNDocPreviewManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(filePath, NSString)

- (UIView *)view {
  return [[RNDocPreview alloc] initWithBridge:self.bridge];
}

@end
