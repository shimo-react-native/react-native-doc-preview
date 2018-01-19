//
//  RNDocPreviewItem.h
//  RNDocPreview
//
//  Created by Bell Zhong on 2018/1/19.
//  Copyright © 2018年 shimo.im. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuickLook/QuickLook.h>

@interface RNDocPreviewItem : NSObject <QLPreviewItem>

@property(nullable, nonatomic, strong) NSURL * previewItemURL;
@property(nullable, nonatomic, strong) NSString * previewItemTitle;

@end
