//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2022-01-04.
//

import Darwin.POSIX.termios

public struct CharacterSize: RawRepresentable {

	public let rawValue: Int32

	@inlinable public init(rawValue: Int32) {
		self.rawValue = rawValue
	}

}

public struct ParityChecking: RawRepresentable, ExpressibleByBooleanLiteral {

	public let rawValue: Bool

	@inlinable public init(rawValue: Bool) {
		self.rawValue = rawValue
	}

	@inlinable public init(booleanLiteral value: Bool) {
		self.init(rawValue: value)
	}

}

public struct UpdateScheduling: RawRepresentable {

	public let rawValue: Int32

	@inlinable public init(rawValue: Int32) {
		self.rawValue = rawValue
	}

}
