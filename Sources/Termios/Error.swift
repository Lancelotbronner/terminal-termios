//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2023-05-11.
//

import Darwin.POSIX.termios

public struct TermiosError: RawRepresentable, Error {

	public var rawValue: errno_t

	@inlinable public init(rawValue: errno_t) {
		self.rawValue = rawValue
	}

	@usableFromInline init() {
		self.init(rawValue: errno)
	}

}

extension TermiosError {

	/// Argument is not a valid open file descriptor.
	public static let ebadf = TermiosError(rawValue: EBADF)

	/// The file is not a terminal.
	public static let enotty = TermiosError(rawValue: ENOTTY)

	/// Interrupted by a signal
	public static let eintr = TermiosError(rawValue: EINTR)

	/// There is an unrecognized parameter, or some entry in the supplied termios structure had an incorrect value.
	public static let einval = TermiosError(rawValue: EINVAL)

	/// The process group of the process issuing the function is an orphaned, background process group, and the process issuing the function is not ignoring or blocking SIGTTOU.
	public static let eio = TermiosError(rawValue: EIO)

}
