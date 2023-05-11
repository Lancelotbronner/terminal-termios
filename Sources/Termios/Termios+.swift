//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2023-05-11.
//

import Darwin.POSIX.termios

#warning("TODO: check which API are macOS only")
#warning("TODO: transfer man pages into documentation articles")

public struct Termios: RawRepresentable {

	/// The raw termios value
	public var rawValue: termios

	/// Wraps an existing `termios` configuration
	@inlinable public init(rawValue: termios) {
		self.rawValue = rawValue
	}

	/// Retrieves the standard input's current configuration
	@inlinable public static var current: Termios {
		get throws {
			Termios(rawValue: try termios(STDIN_FILENO))
		}
	}

	@inlinable public func write(when schedule: UpdateScheduling = .now) throws {
		try rawValue.write(to: STDIN_FILENO, on: schedule)
	}

	//MARK: - Raw Mode

	/// Preset configuration with pure I/O
	@inlinable public static var raw: Termios {
		get throws {
			var configuration = try termios(STDIN_FILENO)
			configuration.raw()
			return Termios(rawValue: configuration)
		}
	}

	/// Executes a block with a specific configuration, then returns to the previous configuration
	@inlinable public func raw(execute block: () -> Void) throws {
		var tmp = rawValue
		tmp.raw()
		try tmp.write(to: STDIN_FILENO, on: .now)
		block()
		try rawValue.write(to: STDIN_FILENO, on: .now)
	}

}
