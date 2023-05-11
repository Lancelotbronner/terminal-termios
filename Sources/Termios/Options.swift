//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2023-05-11.
//

import Darwin.POSIX.termios

extension CharacterSize {

	/// 5 bits per character
	public static let bit5 = CharacterSize(rawValue: CS5)

	/// 6 bits per character
	public static let bit6 = CharacterSize(rawValue: CS6)

	/// 7 bits per character
	public static let bit7 = CharacterSize(rawValue: CS7)

	/// 8 bits per character
	public static let bit8 = CharacterSize(rawValue: CS8)

}

extension ParityChecking {

	public static let even = ParityChecking(rawValue: false)

	public static let odd = ParityChecking(rawValue: true)
	
}

extension UpdateScheduling {

	/// The change should take place immediately.
	public static let now = UpdateScheduling(rawValue: TCSANOW)

	/// The change should take place after all output written has been read by the master pseudoterminal. Use this value when changing terminal attributes that affect output.
	public static let drain = UpdateScheduling(rawValue: TCSADRAIN)

	/// The change should take place after all output written has been sent; in addition, all input that has been received but not read should be discarded (flushed) before the change is made.
	public static let flush = UpdateScheduling(rawValue: TCSAFLUSH)

	#if os(macOS)

	public static let soft = UpdateScheduling(rawValue: TCSASOFT)

	#endif

}
