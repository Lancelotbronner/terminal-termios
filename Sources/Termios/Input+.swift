//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2021-12-24.
//

import Darwin.POSIX.termios

extension Termios {

	/// Indicates that an interrupt should be generated if the user types a `BREAK`
	///
	/// This has no effect if ``isIgnoringIncomingBreaks`` is `true`.
	///
	/// if this is true, then a `BREAK` will flush all input and output queues. In addition, if the terminal is the controlling terminal of a foreground process
	/// group, the `BREAK` condition generates a single `SIGINT` signal for that foreground process group, which usually kills the process group.
	///
	/// If this is `false`, a `BREAK` condition is taken as input depending on ``markParityErrors``: a single input character `NULL` if it's `false`
	/// or three input characters `\377`, `NULL`, `NULL` if it's `true`.
	@inlinable public var isGeneratingInterruptOnIncomingBreaks: Bool {
		get { rawValue.brkint }
		set { rawValue.brkint = newValue }
	}

	/// Automatically converts input carriage returns to newline (line-feed) characters before they are passed to the application that reads the input
	///
	/// This has no effect if ``isIgnoringIncomingCarriageReturn`` is `true`.
	@inlinable public var isConvertingIncomingCarriageReturnsToNewline: Bool {
		get { rawValue.icrnl }
		set { rawValue.icrnl = newValue }
	}

	/// Ignores `BREAK` conditions
	@inlinable public var isIgnoringIncomingBreaks: Bool {
		get { rawValue.ignbrk }
		set { rawValue.ignbrk = newValue }
	}

	/// Ignores input carriage returns
	@inlinable public var isIgnoringIncomingCarriageReturn: Bool {
		get { rawValue.igncr }
		set { rawValue.igncr = newValue }
	}

	/// Ignores input characters (other than `BREAK`) that have parity errors
	@inlinable public var isIgnoringInputParityErrors: Bool {
		get { rawValue.ignpar }
		set { rawValue.ignpar = newValue }
	}

	/// Automatically converts input newline (line-feed) characters to carriage returns before they are passed to the application that reads the input.
	@inlinable public var isConvertingIncomingNewlinesToCarriageReturns: Bool {
		get { rawValue.inlcr }
		set { rawValue.inlcr = newValue }
	}

	/// Enables input parity checking
	///
	/// If this is `false`, it allows output parity generation without input parity errors. The enabling of input parity checking is independent of the enabling
	/// of parity checking in the control modes field. (See ``Termios/Control-swift.struct``)
	///
	/// While the control modes may dictate that the hardware recognizes the parity bit, the terminal special file does not check whether this bit is set correctly.
	@inlinable public var isInputParityChecked: Bool {
		get { rawValue.inpck }
		set { rawValue.inpck = newValue }
	}

	/// Strips valid input bytes to 7 bits, if this is `false` the complete byte is processed
	///
	///  - Warning: Do not enable this for pseudoterminals, since it will make the terminal unusable. If you strip the first bit off of EBCDIC characters,
	///  you destroy all printable EBCDIC characters.
	@inlinable public var isInputStripped: Bool {
		get { rawValue.istrip }
		set { rawValue.istrip = newValue }
	}

	/// Enables any character to restart output
	///
	/// This requires ``isInputControlEnabled`` to be `true`.
	///
	/// If a previous `STOP` character has been received, then receipt of any input character will cause the `STOP` condition to be removed. For pseudoterminals, data
	/// in the output queue is passed to the application during master `read()` processing, and slave pseudoterminal writes are allowed to proceed. The character which
	/// caused the output to restart is also processed normally as well (unless it is a `STOP` character).
	@inlinable public var isResumeOnAnyCharacterEnabled: Bool {
		get { rawValue.ixany }
		set { rawValue.ixany = newValue }
	}

	/// Enables start/stop input control
	///
	/// If this is `true`, the system attempts to prevent the number of bytes in the input queue from exceeding the ``MAX_INPUT`` value.
	/// It sends one or more `STOP` characters to the terminal device when the input queue is in danger of filling up. The system transmits
	/// one or more START characters when it appears that there is space in the input queues for more input.
	///
	/// - LINK TO SYMBOLS:
	/// The character used as the `STOP` character is dictated by the `c_cc` member of the termios structure. It is intended to tell the terminal
	/// to stop sending input for a while.  Again, the character used as the START character is dictated by the `c_cc` member. It is intended to
	/// tell the terminal that it can resume transmission of input.
	@inlinable public var isInputControlEnabled: Bool {
		get { rawValue.ixoff }
		set { rawValue.ixoff = newValue }
	}

	/// Enables start/stop output control
	///
	/// If the system receives a `STOP` character as input, it will suspend output on the associated terminal until a `START` character is received.
	/// An application reading input from the terminal does not see `STOP` or `START` characters; they are intercepted by the system, which does
	/// all the necessary processing.
	///
	/// If this is `false`, any `STOP` or `START` characters read are passed on as input to an application reading from the terminal.
	@inlinable public var isOutputControlEnabled: Bool {
		get { rawValue.ixon }
		set { rawValue.ixon = newValue }
	}
	/// Marks characters with parity errors
	///
	/// This has no effect if ``isIgnoringInputParityErrors`` is `true`.
	///
	/// If this is `true`, then a byte with a framing or parity error is sent to the application as the characters `\377` and `NULL`, followed by the data part of
	/// the byte that had the parity error. If `ISTRIP` is `false`, a valid input character of `\377` is sent as a pair of characters `\377`, `\377` to avoid ambiguity.
	///
	/// If this is `false`, a character with a framing or parity error is sent to the application as `NULL`.
	@inlinable public var isParityErrorMarked: Bool {
		get { rawValue.parmrk }
		set { rawValue.parmrk = newValue }
	}

	/// Rings the terminal bell when the input queue is full
	///
	/// When the input queue is full, any subsequent input will ring the bell.
	@inlinable public var shouldRingBellOnFullInputQueue: Bool {
		get { rawValue.imaxbel }
		set { rawValue.imaxbel = newValue }
	}

}
