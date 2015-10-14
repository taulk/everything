//
//  FeatureMeta.h
//  Everything
//
//  Created by Kai Li on 10/14/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeatureMeta : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;

@property (nonatomic, strong) NSString *controllerClassName;
@property (nonatomic, strong) NSString *controllerSBID;

@end
