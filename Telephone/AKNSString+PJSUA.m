//
//  AKNSString+PJSUA.m
//  Telephone
//
//  Copyright (c) 2008-2015 Alexei Kuznetsov
//
//  Telephone is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Telephone is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//

#import "AKNSString+PJSUA.h"


@implementation NSString (AKStringPJSUAAdditions)

+ (NSString *)stringWithPJString:(pj_str_t)pjString {
    return [[NSString alloc] initWithBytes:pjString.ptr
                                    length:(NSUInteger)pjString.slen
                                  encoding:NSUTF8StringEncoding];
}

- (pj_str_t)pjString {
    return pj_str((char *)[self cStringUsingEncoding:NSUTF8StringEncoding]);
}

@end
