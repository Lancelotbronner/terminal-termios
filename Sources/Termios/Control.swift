//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2021-12-26.
//

import CTermios

extension termios {

	/// See ``Termios/Termios/size``
	@inlinable public var csize: Int32 {
		get { get(mask: CSIZE, from: c_cflag) }
		set { set(mask: CSIZE, to: newValue, in: &c_cflag) }
	}

	/// See ``isTwoStopBitsUsed``
	@inlinable public var cstopb: Bool {
		get { get(flag: CSTOPB, from: c_cflag) }
		set { set(flag: CSTOPB, to: newValue, in: &c_cflag) }
	}

	/// See ``isParityEnabled``
	@inlinable public var parenb: Bool {
		get { get(flag: PARENB, from: c_cflag) }
		set { set(flag: PARENB, to: newValue, in: &c_cflag) }
	}

	/// See ``parity-swift.property``
	@inlinable public var parodd: Bool {
		get { get(flag: PARODD, from: c_cflag) }
		set { set(flag: PARODD, to: newValue, in: &c_cflag) }
	}

	/// See ``isReadEnabled``
	@inlinable public var cread: Bool {
		get { get(flag: CREAD, from: c_cflag) }
		set { set(flag: CREAD, to: newValue, in: &c_cflag) }
	}

	/// See ``isHangUpOnLastCloseEnabled``
	@inlinable public var hupcl: Bool {
		get { get(flag: HUPCL, from: c_cflag) }
		set { set(flag: HUPCL, to: newValue, in: &c_cflag) }
	}

	/// See ``isModemStatusLineMonitoringEnabled``
	@inlinable public var clocal: Bool {
		get { get(flag: CLOCAL, from: c_cflag) }
		set { set(flag: CLOCAL, to: newValue, in: &c_cflag) }
	}

	/// Currently unused, same as ``crtscts``
	@inlinable public var ccts_oflow: Bool {
		get { get(flag: CCTS_OFLOW, from: c_cflag) }
		set { set(flag: CCTS_OFLOW, to: newValue, in: &c_cflag) }
	}

	/// Currently unused, same as ``ccts_oflow``
	@inlinable public var crtscts: Bool {
		get { get(flag: CRTSCTS, from: c_cflag) }
		set { set(flag: CRTSCTS, to: newValue, in: &c_cflag) }
	}

	/// See ``isFlowControlledByCarrier``
	@inlinable public var mdmbuf: Bool {
		get { get(flag: MDMBUF, from: c_cflag) }
		set { set(flag: MDMBUF, to: newValue, in: &c_cflag) }
	}

}
