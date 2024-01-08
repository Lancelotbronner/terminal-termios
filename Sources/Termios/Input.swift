//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2021-12-24.
//

import CTermios

extension termios {

	@inlinable public var brkint: Bool {
		get { get(flag: BRKINT, from: c_iflag) }
		set { set(flag: BRKINT, to: newValue, in: &c_iflag) }
	}

	@inlinable public var icrnl: Bool {
		get { get(flag: ICRNL, from: c_iflag) }
		set { set(flag: ICRNL, to: newValue, in: &c_iflag) }
	}

	@inlinable public var ignbrk: Bool {
		get { get(flag: IGNBRK, from: c_iflag) }
		set { set(flag: IGNBRK, to: newValue, in: &c_iflag) }
	}

	@inlinable public var igncr: Bool {
		get { get(flag: IGNCR, from: c_iflag) }
		set { set(flag: IGNCR, to: newValue, in: &c_iflag) }
	}

	@inlinable public var ignpar: Bool {
		get { get(flag: IGNPAR, from: c_iflag) }
		set { set(flag: IGNPAR, to: newValue, in: &c_iflag) }
	}

	@inlinable public var inlcr: Bool {
		get { get(flag: INLCR, from: c_iflag) }
		set { set(flag: INLCR, to: newValue, in: &c_iflag) }
	}

	@inlinable public var inpck: Bool {
		get { get(flag: INPCK, from: c_iflag) }
		set { set(flag: INPCK, to: newValue, in: &c_iflag) }
	}

	@inlinable public var istrip: Bool {
		get { get(flag: ISTRIP, from: c_iflag) }
		set { set(flag: ISTRIP, to: newValue, in: &c_iflag) }
	}

	@inlinable public var ixany: Bool {
		get { get(flag: IXANY, from: c_iflag) }
		set { set(flag: IXANY, to: newValue, in: &c_iflag) }
	}

	@inlinable public var ixoff: Bool {
		get { get(flag: IXOFF, from: c_iflag) }
		set { set(flag: IXOFF, to: newValue, in: &c_iflag) }
	}

	@inlinable public var ixon: Bool {
		get { get(flag: IXON, from: c_iflag) }
		set { set(flag: IXON, to: newValue, in: &c_iflag) }
	}

	@inlinable public var parmrk: Bool {
		get { get(flag: PARMRK, from: c_iflag) }
		set { set(flag: PARMRK, to: newValue, in: &c_iflag) }
	}

	@inlinable public var imaxbel: Bool {
		get { get(flag: IMAXBEL, from: c_iflag) }
		set { set(flag: IMAXBEL, to: newValue, in: &c_iflag) }
	}

}
