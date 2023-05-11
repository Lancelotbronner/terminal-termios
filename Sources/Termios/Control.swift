//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2021-12-26.
//

import Darwin.POSIX.termios

extension termios {

	@inlinable public var csize: Int32 {
		get { get(mask: CSIZE, from: c_cflag) }
		set { set(mask: CSIZE, to: newValue, in: &c_cflag) }
	}

	@inlinable public var cstopb: Bool {
		get { get(flag: CSTOPB, from: c_cflag) }
		set { set(flag: CSTOPB, to: newValue, in: &c_cflag) }
	}

	@inlinable public var cread: Bool {
		get { get(flag: CREAD, from: c_cflag) }
		set { set(flag: CREAD, to: newValue, in: &c_cflag) }
	}

	@inlinable public var parenb: Bool {
		get { get(flag: PARENB, from: c_cflag) }
		set { set(flag: PARENB, to: newValue, in: &c_cflag) }
	}

	@inlinable public var parodd: Bool {
		get { get(flag: PARODD, from: c_cflag) }
		set { set(flag: PARODD, to: newValue, in: &c_cflag) }
	}

	@inlinable public var hupcl: Bool {
		get { get(flag: HUPCL, from: c_cflag) }
		set { set(flag: HUPCL, to: newValue, in: &c_cflag) }
	}

	@inlinable public var clocal: Bool {
		get { get(flag: CLOCAL, from: c_cflag) }
		set { set(flag: CLOCAL, to: newValue, in: &c_cflag) }
	}

	@inlinable public var crtscts: Bool {
		get { get(flag: CRTSCTS, from: c_cflag) }
		set { set(flag: CRTSCTS, to: newValue, in: &c_cflag) }
	}

	@inlinable public var mdmbuf: Bool {
		get { get(flag: MDMBUF, from: c_cflag) }
		set { set(flag: MDMBUF, to: newValue, in: &c_cflag) }
	}

}
