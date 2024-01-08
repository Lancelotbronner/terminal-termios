//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2021-12-25.
//

import CTermios

extension termios {

	@inlinable public var opost: Bool {
		get { get(flag: OPOST, from: c_oflag) }
		set { set(flag: OPOST, to: newValue, in: &c_oflag) }
	}

	@inlinable public var onlcr: Bool {
		get { get(flag: ONLCR, from: c_oflag) }
		set { set(flag: ONLCR, to: newValue, in: &c_oflag) }
	}

	@inlinable public var oxtabs: Bool {
		get { get(flag: OXTABS, from: c_oflag) }
		set { set(flag: OXTABS, to: newValue, in: &c_oflag) }
	}

	@inlinable public var onoeot: Bool {
		get { get(flag: ONOEOT, from: c_oflag) }
		set { set(flag: ONOEOT, to: newValue, in: &c_oflag) }
	}

	@inlinable public var ocrnl: Bool {
		get { get(flag: OCRNL, from: c_oflag) }
		set { set(flag: OCRNL, to: newValue, in: &c_oflag) }
	}

	@inlinable public var onocr: Bool {
		get { get(flag: ONOCR, from: c_oflag) }
		set { set(flag: ONOCR, to: newValue, in: &c_oflag) }
	}

	@inlinable public var onlret: Bool {
		get { get(flag: ONLRET, from: c_oflag) }
		set { set(flag: ONLRET, to: newValue, in: &c_oflag) }
	}

}
