//
//  Logger.m
//  Everything
//
//  Created by Kai Li on 12/6/15.
//  Copyright © 2015 Tau. All rights reserved.
//

#import "Logger.h"
#import "pthread.h"

void _DebugLog(const char *file, int lineNumber, const char *funcName, NSString *format,...)
{
    va_list ap;

    va_start (ap, format);

    if (![format hasSuffix: @"\n"]) {
        format = [format stringByAppendingString: @"\n"];
    }

    NSString *body = [[NSString alloc] initWithFormat: format arguments: ap];

    va_end (ap);

    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];

    mach_port_t machThreadID = pthread_mach_thread_np(pthread_self());
    char threadIdString[9];
    snprintf(threadIdString, 9, "%x", machThreadID);

    char *mainThread = [[NSThread currentThread] isMainThread] ? "(main)" : "";

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];

    fprintf(stderr,"%s [%s:%d] (%s) [thread:%s%s] %s", [dateString UTF8String], [fileName UTF8String],lineNumber,funcName, threadIdString, mainThread, [body UTF8String]);
}