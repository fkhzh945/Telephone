//
//  TimerSpy.swift
//  Telephone
//
//  Copyright (c) 2008-2016 Alexei Kuznetsov.
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

import UseCases

public class TimerSpy: Timer {
    public let timeInterval: Double = 0
    public let action: () -> Void = {}

    public private(set) var didCallInvalidate = false
    public private(set) var invalidateCallCount = 0

    public init() {}

    public func invalidate() {
        didCallInvalidate = true
        invalidateCallCount += 1
    }
}
