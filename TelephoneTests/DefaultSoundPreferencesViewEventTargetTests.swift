//
//  DefaultSoundPreferencesViewEventTargetTests.swift
//  Telephone
//
//  Copyright (c) 2008-2016 Alexey Kuznetsov
//  Copyright (c) 2016 64 Characters
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

import UseCasesTestDoubles
import XCTest

final class DefaultSoundPreferencesViewEventTargetTests: XCTestCase {
    private var factory: UseCaseFactorySpy!
    private var userAgentSoundIOSelection: UseCaseSpy!
    private var ringtoneOutputUpdate: ThrowingUseCaseSpy!
    private var soundPlayback: SoundPlaybackUseCaseSpy!
    private var sut: DefaultSoundPreferencesViewEventTarget!

    override func setUp() {
        super.setUp()
        factory = UseCaseFactorySpy()
        userAgentSoundIOSelection = UseCaseSpy()
        ringtoneOutputUpdate = ThrowingUseCaseSpy()
        soundPlayback = SoundPlaybackUseCaseSpy()
        sut = DefaultSoundPreferencesViewEventTarget(
            useCaseFactory: factory,
            presenterFactory: PresenterFactory(),
            userAgentSoundIOSelection: userAgentSoundIOSelection,
            ringtoneOutputUpdate: ringtoneOutputUpdate,
            ringtoneSoundPlayback: soundPlayback
        )
    }

    func testExecutesUserDefaultsSoundIOLoadUseCaseOnViewDataReload() {
        let useCase = ThrowingUseCaseSpy()
        factory.stubWithUserDefaultsSoundIOLoad(useCase)

        sut.viewShouldReloadData(SoundPreferencesViewSpy())

        XCTAssertTrue(useCase.didCallExecute)
    }

    func testExecutesUserDefaultsSoundIOLoadUseCaseOnSoundIOReload() {
        let useCase = ThrowingUseCaseSpy()
        factory.stubWithUserDefaultsSoundIOLoad(useCase)

        sut.viewShouldReloadSoundIO(SoundPreferencesViewSpy())

        XCTAssertTrue(useCase.didCallExecute)
    }

    func testExecutesUserDefaultsSoundIOSaveUseCaseWithExpectedArgumentsOnSoundIOChange() {
        let useCase = UseCaseSpy()
        factory.stubWithUserDefaultsSoundIOSave(useCase)
        let soundIO = PresentationSoundIO(input: "input", output: "output1", ringtoneOutput: "output2")

        sut.viewDidChangeSoundIO(
            input: soundIO.input, output: soundIO.output, ringtoneOutput: soundIO.ringtoneOutput
        )

        XCTAssertEqual(factory.invokedSoundIO, soundIO)
        XCTAssertTrue(useCase.didCallExecute)
    }

    func testExecutesUserAgentSoundIOSelectionUseCaseOnSoundIOChange() {
        factory.stubWithUserDefaultsSoundIOSave(UseCaseSpy())

        sut.viewDidChangeSoundIO(input: "any-input", output: "any-output", ringtoneOutput: "any-output")

        XCTAssertTrue(userAgentSoundIOSelection.didCallExecute)
    }

    func testExecutesRingtoneOutputUpdateUseCaseOnSoundIOChange() {
        factory.stubWithUserDefaultsSoundIOSave(UseCaseSpy())

        sut.viewDidChangeSoundIO(input: "any-input", output: "any-output", ringtoneOutput: "any-output")

        XCTAssertTrue(ringtoneOutputUpdate.didCallExecute)
    }

    func testExecutesUserDefaultsRingtoneSoundNameSaveUseCaseWithExpectedArgumentsOnRingtoneNameChange() {
        let useCase = UseCaseSpy()
        factory.stubWithUserDefaultsRingtoneSoundNameSave(useCase)

        sut.viewDidChangeRingtoneName("sound-name")

        XCTAssertEqual(factory.invokedRingtoneSoundName, "sound-name")
        XCTAssertTrue(useCase.didCallExecute)
    }

    func testPlaysRingtoneSoundOnRingtoneNameChange() {
        factory.stubWithUserDefaultsRingtoneSoundNameSave(UseCaseSpy())

        sut.viewDidChangeRingtoneName("any-name")

        XCTAssertTrue(soundPlayback.didCallPlay)
    }

    func testStopsPlayingRingtoneSoundOnViewWillDisappear() {
        sut.viewWillDisappear(SoundPreferencesViewSpy())

        XCTAssertTrue(soundPlayback.didCallStop)
    }
}
