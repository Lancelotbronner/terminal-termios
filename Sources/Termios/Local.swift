//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2021-12-26.
//

import CTermios

extension termios {

	@inlinable public var echo: Bool {
		get { get(flag: ECHO, from: c_lflag) }
		set { set(flag: ECHO, to: newValue, in: &c_cflag) }
	}

	@inlinable public var echonl: Bool {
		get { get(flag: ECHONL, from: c_lflag) }
		set { set(flag: ECHONL, to: newValue, in: &c_cflag) }
	}

	@inlinable public var echoke: Bool {
		get { get(flag: ECHOKE, from: c_lflag) }
		set { set(flag: ECHOKE, to: newValue, in: &c_cflag) }
	}

	@inlinable public var echoe: Bool {
		get { get(flag: ECHOE, from: c_lflag) }
		set { set(flag: ECHOE, to: newValue, in: &c_cflag) }
	}

	@inlinable public var echok: Bool {
		get { get(flag: ECHOK, from: c_lflag) }
		set { set(flag: ECHOK, to: newValue, in: &c_cflag) }
	}

	@inlinable public var icanon: Bool {
		get { get(flag: ICANON, from: c_lflag) }
		set { set(flag: ICANON, to: newValue, in: &c_cflag) }
	}

	@inlinable public var echoprt: Bool {
		get { get(flag: ECHOPRT, from: c_lflag) }
		set { set(flag: ECHOPRT, to: newValue, in: &c_cflag) }
	}

	@inlinable public var echoctl: Bool {
		get { get(flag: ECHOCTL, from: c_lflag) }
		set { set(flag: ECHOCTL, to: newValue, in: &c_cflag) }
	}

	@inlinable public var altwerase: Bool {
		get { get(flag: ALTWERASE, from: c_lflag) }
		set { set(flag: ALTWERASE, to: newValue, in: &c_cflag) }
	}

	@inlinable public var isig: Bool {
		get { get(flag: ISIG, from: c_lflag) }
		set { set(flag: ISIG, to: newValue, in: &c_lflag) }
	}

	@inlinable public var iexten: Bool {
		get { get(flag: IEXTEN, from: c_lflag) }
		set { set(flag: IEXTEN, to: newValue, in: &c_lflag) }
	}

	@inlinable public var extproc: Bool {
		get { get(flag: EXTPROC, from: c_lflag) }
		set { set(flag: EXTPROC, to: newValue, in: &c_lflag) }
	}

	@inlinable public var tostop: Bool {
		get { get(flag: TOSTOP, from: c_lflag) }
		set { set(flag: TOSTOP, to: newValue, in: &c_lflag) }
	}

	@inlinable public var flusho: Bool {
		get { get(flag: FLUSHO, from: c_lflag) }
		set { set(flag: FLUSHO, to: newValue, in: &c_lflag) }
	}

	@inlinable public var nokerninfo: Bool {
		get { get(flag: NOKERNINFO, from: c_lflag) }
		set { set(flag: NOKERNINFO, to: newValue, in: &c_lflag) }
	}

	@inlinable public var pendin: Bool {
		get { get(flag: PENDIN, from: c_lflag) }
		set { set(flag: PENDIN, to: newValue, in: &c_lflag) }
	}

	@inlinable public var noflsh: Bool {
		get { get(flag: NOFLSH, from: c_lflag) }
		set { set(flag: NOFLSH, to: newValue, in: &c_lflag) }
	}

}
