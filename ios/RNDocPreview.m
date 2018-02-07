//
//  RNDocPreviewItem.h
//  RNDocPreview
//
//  Created by Bell Zhong on 2018/1/19.
//  Copyright © 2018年 shimo.im. All rights reserved.
//

#import "RNDocPreview.h"
#import <React/RCTBridge.h>
#import <React/RCTUIManager.h>
#import <React/UIView+React.h>
#import <QuickLook/QuickLook.h>
#import <QuickLook/QLPreviewController.h>
#import <QuickLook/QLPreviewItem.h>

#if __has_include(<React/RCTUIManagerUtils.h>)
#import <React/RCTUIManagerUtils.h>
#endif

@interface RNDocPreview() <QLPreviewControllerDataSource, RCTInvalidating> {
  __weak RCTBridge *_bridge;
}

@property (nonatomic, strong) QLPreviewController *previewController;

@property (nonatomic, strong) RNDocPreviewItem *previewItem;

@end

@implementation RNDocPreview

- (instancetype)initWithBridge:(RCTBridge *)bridge {
  RCTAssertParam(bridge);
  
  if (self = [super initWithFrame:CGRectZero]) {
    _bridge = bridge;

    _previewController = [[QLPreviewController alloc] init];
    _previewController.dataSource = self;
    
    UIView *view = _previewController.view;
    view.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:view];
  }
  return self;
}

RCT_NOT_IMPLEMENTED(- (instancetype)init)
RCT_NOT_IMPLEMENTED(- (instancetype)initWithCoder:(NSCoder *)decoder)
RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)

#pragma mark - Setter

- (void)setFilePath:(NSString *)filePath {
  RNDocPreviewItem *previewItem = [[RNDocPreviewItem alloc] init];
  if ([filePath hasPrefix:@"file://"] || [filePath hasPrefix:@"/"]) {
    previewItem.previewItemURL = [NSURL fileURLWithPath:filePath];
  } else {
    previewItem.previewItemURL = [NSURL URLWithString:filePath];
  }
  if ([QLPreviewController canPreviewItem:previewItem]) {
    _previewItem = previewItem;
  } else {
    _previewItem = nil;
  }
  [_previewController reloadData];
}

#pragma mark - RCTInvalidating

- (void)invalidate {
  _previewController.dataSource = nil;
  _previewController = nil;
  
  // must add delay, or it will show keyboard window again.
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.02 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    if ([NSStringFromClass(window.class) isEqualToString:@"UIRemoteKeyboardWindow"]) {
      [window setHidden:YES];
    }
  });
}

#pragma mark - QLPreviewControllerDataSource

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
  return _previewItem ? 1 : 0;
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
  return _previewItem;
}

@end
