//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2023-05-11.
//

import CTermios

extension Termios {

	/// Specifies the byte size in bits for both transmission and reception.
	///
	/// This size does not include the parity bit, if any.  If ``isTwoStopBitsUsed`` is set, two stop bits are used, otherwise one stop bit.
	/// For example, at 110 baud, two stop bits are normally used.
	@inlinable public var size: CharacterSize {
		get { CharacterSize(rawValue: rawValue.csize) }
		set { rawValue.csize = newValue.rawValue }
	}

	/// Two stop bits are used instead of one stop bit.
	///
	/// For example, at 110 baud, two stop bits are normally used.
	@inlinable public var isTwoStopBitsUsed: Bool {
		get { rawValue.cstopb }
		set { rawValue.cstopb = newValue }
	}

	/// Wether parity generation and detection are enabled
	///
	/// If parity is enabled, ``parity-swift.property``controls wether even or odd parity is used.
	@inlinable public var isParityEnabled: Bool {
		get { rawValue.parenb }
		set { rawValue.parenb = newValue }
	}

	/// Specifies wether parity is even or odd
	@inlinable public var parity: ParityChecking {
		get { ParityChecking(booleanLiteral: rawValue.parodd) }
		set { rawValue.parodd = newValue.rawValue }
	}

	/// Wether to receive characters.
	///
	/// Not all hardware supports this bit. In fact, this flag is pretty silly and if it were not part of the termios specification it would be omitted.
	@inlinable public var isReadEnabled: Bool {
		get { rawValue.cread }
		set { rawValue.cread = newValue }
	}

	/// Wether to hang up on the last close
	///
	/// The modem control lines for the port are lowered when the last process with the port open closes the port or the process terminates.
	/// The modem connection is broken.
	@inlinable public var willHangUpOnLastClose: Bool {
		get { rawValue.hupcl }
		set { rawValue.hupcl = newValue }
	}

	/// Wether to monitor or ignore modem status lines.
	///
	/// When enabled the connection does not depend on the state of the modem status lines.
	/// When disabled the modem status lines are monitored.
	@inlinable public var isModemStatusLineMonitoringEnabled: Bool {
		get { rawValue.clocal }
		set { rawValue.clocal = newValue }
	}

	/// Wether the output flow control is controlled by the state of Carrier Detect.
	@inlinable public var isFlowControlledByCarrier: Bool {
		get { rawValue.mdmbuf }
		set { rawValue.mdmbuf = newValue }
	}

	/// The total number of bits used per transmission and reception
	@inlinable public var bitsPerCharacter: Int {
		size.bits + (isTwoStopBitsUsed ? 2 : 1) + (isParityEnabled ? 1 : 0)
	}

}
