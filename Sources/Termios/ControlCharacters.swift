//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2021-12-26.
//

import Darwin.POSIX.termios

extension termios {

	@inlinable public var veof: cc_t {
		get { get(character: VEOF) }
		set { set(character: VEOF, to: newValue) }
	}

	@inlinable public var veol: cc_t {
		get { get(character: VEOL) }
		set { set(character: VEOL, to: newValue) }
	}

	@inlinable public var verase: cc_t {
		get { get(character: VERASE) }
		set { set(character: VERASE, to: newValue) }
	}

	@inlinable public var vkill: cc_t {
		get { get(character: VKILL) }
		set { set(character: VKILL, to: newValue) }
	}

	@inlinable public var vintr: cc_t {
		get { get(character: VINTR) }
		set { set(character: VINTR, to: newValue) }
	}

	@inlinable public var vquit: cc_t {
		get { get(character: VQUIT) }
		set { set(character: VQUIT, to: newValue) }
	}

	@inlinable public var vsusp: cc_t {
		get { get(character: VSUSP) }
		set { set(character: VSUSP, to: newValue) }
	}

	@inlinable public var vstart: cc_t {
		get { get(character: VSTART) }
		set { set(character: VSTART, to: newValue) }
	}

	@inlinable public var vstop: cc_t {
		get { get(character: VSTOP) }
		set { set(character: VSTOP, to: newValue) }
	}

	@inlinable public var vmin: cc_t {
		get { get(character: VMIN) }
		set { set(character: VMIN, to: newValue) }
	}

	@inlinable public var vtime: cc_t {
		get { get(character: VTIME) }
		set { set(character: VTIME, to: newValue) }
	}

	//MARK: - macOS

#if os(macOS)

	@inlinable public var veol2: cc_t {
		get { get(character: VEOL2) }
		set { set(character: VEOL2, to: newValue) }
	}

	@inlinable public var vwerase: cc_t {
		get { get(character: VWERASE) }
		set { set(character: VWERASE, to: newValue) }
	}

	@inlinable public var vreprint: cc_t {
		get { get(character: VREPRINT) }
		set { set(character: VREPRINT, to: newValue) }
	}

	@inlinable public var vdusp: cc_t {
		get { get(character: VDSUSP) }
		set { set(character: VDSUSP, to: newValue) }
	}

	@inlinable public var vlnext: cc_t {
		get { get(character: VLNEXT) }
		set { set(character: VLNEXT, to: newValue) }
	}

	@inlinable public var vstatus: cc_t {
		get { get(character: VSTATUS) }
		set { set(character: VSTATUS, to: newValue) }
	}

	@inlinable public var vdiscard: cc_t {
		get { get(character: VDISCARD) }
		set { set(character: VDISCARD, to: newValue) }
	}

#endif

}
