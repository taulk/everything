//
//  Logger.h
//  Everything
//
//  Created by Kai Li on 12/6/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG

#define NSLog(args...) _DebugLog(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);

#else

#define NSLog(args...);

#endif

void _DebugLog(const char *file, int lineNumber, const char *funcName, NSString *format,...);
