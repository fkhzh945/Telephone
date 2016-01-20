//
//  AKNSString+Scanning.h
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

#import <Foundation/Foundation.h>


// A category for scanning strings.
@interface NSString (AKStringScanningAdditions)

// A Boolean value indicating whether the receiver is a telephone number, e.g. it consists of contiguous digits with
// an optional leading plus character.
@property(nonatomic, readonly, assign) BOOL ak_isTelephoneNumber;

// A Boolean value indicating whether the receiver consists only of a-z or A-Z.
@property(nonatomic, readonly, assign) BOOL ak_hasLetters;

// A Boolean value indicating whether the receiver is an IP address.
@property(nonatomic, readonly, assign) BOOL ak_isIPAddress;

@end
