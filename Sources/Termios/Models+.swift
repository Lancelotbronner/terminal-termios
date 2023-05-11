//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2023-05-11.
//

import Darwin.POSIX.termios

extension CharacterSize {

	/// The number of bits used by characters with this configuration
	@inlinable public var bits: Int {
		switch rawValue {
		case CS5: return 5
		case CS6: return 6
		case CS7: return 7
		case CS8: return 8
		default:
			assertionFailure("Invalid CS \(rawValue), valid values are \(CS5), \(CS6), \(CS7) and \(CS8)")
			return 0
		}
	}

}
