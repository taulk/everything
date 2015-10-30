//
//  Singleton.h
//  Everything
//
//  Created by Kai Li on 10/29/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#ifndef Singleton_h
#define Singleton_h

@interface NSObject (Singleton)
/**
 *  do once when singleton first init
 */
- (void)workInsideInit;
/**
 *  do everytime when singleton is called by [XXXX sharedInstance]
 *
 *  @param instance <#instance description#>
 */
+ (void)setupWithInstance:(id)instance;
@end
@implementation NSObject (Singleton)
- (void)workInsideInit{}
+ (void)setupWithInstance:(id)instance{}
@end


#define SYNTHESIZE_SINGLETON_FOR_HEADER(className) \
\
+ (instancetype)sharedInstance;\
+ (instancetype) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));\
- (instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));\
+ (instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));



#define SYNTHESIZE_SINGLETON_FOR_CLASS(className) \
\
+ (instancetype)sharedInstance \
{\
static className *instance = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
instance = [[super alloc] initUniqueInstance]; \
}); \
[self setupWithInstance:instance];\
return instance; \
}\
\
- (instancetype)initUniqueInstance \
{\
self = [super init];\
if (self) {\
[self workInsideInit];\
}\
return self;\
}

#endif /* Singleton_h */
