//
//  GeneralPreferencesViewController.m
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

#import "GeneralPreferencesViewController.h"


@implementation GeneralPreferencesViewController

- (instancetype)init {
    self = [super initWithNibName:@"GeneralPreferencesView" bundle:nil];
    if (self != nil) {
        [self setTitle:NSLocalizedString(@"General", @"General preferences window title.")];
    }
    
    return self;
}

@end
