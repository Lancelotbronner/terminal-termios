//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2021-12-23.
//

import CTermios

extension termios {

	@inlinable public init(_ descriptor: Int32) throws {
		self = termios()
		try read(from: descriptor)
	}

	@inlinable public mutating func raw() {
		withUnsafeMutablePointer(to: &self) { pointer in
			cfmakeraw(pointer)
		}
	}

	@inlinable public mutating func read(from descriptor: Int32) throws {
		let success = withUnsafeMutablePointer(to: &self) { pointer in
			tcgetattr(descriptor, pointer)
		}
		if success != 0 {
			throw TermiosError()
		}
	}

	@inlinable public func write(to descriptor: Int32, on update: UpdateScheduling) throws {
		let success = withUnsafePointer(to: self) { pointer in
			tcsetattr(descriptor, update.rawValue, pointer)
		}
		if success != 0 {
			throw TermiosError()
		}
	}

}
