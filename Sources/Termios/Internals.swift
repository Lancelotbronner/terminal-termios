//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2023-05-11.
//

import CTermios

extension termios {

	//MARK: - Flags

	@usableFromInline func get(flag: tcflag_t, from flags: tcflag_t) -> Bool {
		flags & flag != 0
	}

	@usableFromInline func get(flag: Int32, from flags: tcflag_t) -> Bool {
		get(flag: tcflag_t(flag), from: flags)
	}

	@usableFromInline func get(flag: UInt32, from flags: tcflag_t) -> Bool {
		get(flag: tcflag_t(flag), from: flags)
	}

	@usableFromInline func set(flag: tcflag_t, to newValue: Bool, in flags: inout tcflag_t) {
		if newValue {
			flags |= flag
		} else {
			flags &= ~flag
		}
	}

	@usableFromInline func set(flag: Int32, to newValue: Bool, in flags: inout tcflag_t) {
		set(flag: tcflag_t(flag), to: newValue, in: &flags)
	}

	@usableFromInline func set(flag: UInt32, to newValue: Bool, in flags: inout tcflag_t) {
		set(flag: tcflag_t(flag), to: newValue, in: &flags)
	}

	@usableFromInline func get(mask: tcflag_t, from flags: tcflag_t) -> tcflag_t {
		flags & mask
	}

	@usableFromInline func get(mask: Int32, from flags: tcflag_t) -> Int32 {
		Int32(get(mask: tcflag_t(mask), from: flags))
	}

	@usableFromInline func set(mask: tcflag_t, to newValue: tcflag_t, in flags: inout tcflag_t) {
		flags &= ~mask
		flags |= newValue
	}

	@usableFromInline func set(mask: Int32, to newValue: Int32, in flags: inout tcflag_t) {
		set(mask: tcflag_t(mask), to: tcflag_t(newValue), in: &flags)
	}

	//MARK: - Control Characters

	@usableFromInline func get(character: Int32) -> cc_t {
		withUnsafePointer(to: self) { pointer in
			ctermios_getcc(pointer, character)
		}
	}

	@usableFromInline func get(character: Int32) -> Unicode.Scalar? {
		let rawValue: cc_t = get(character: character)
		return rawValue == CTERMIOS_VDISABLE ? nil : UnicodeScalar(rawValue)
	}

	@usableFromInline mutating func set(character: Int32, to newValue: cc_t) {
		ctermios_setcc(&self, character, newValue)
	}

	@usableFromInline mutating func set(character: Int32, to newValue: Unicode.Scalar?) {
		assert(newValue.map { $0.value < UInt8.max } ?? true, "Character must be ascii (0 to 255), in release mode the value will be truncated")
		let rawValue = newValue.map(\.value).map(cc_t.init(truncatingIfNeeded:)) ?? CTERMIOS_VDISABLE
		ctermios_setcc(&self, character, rawValue)
	}
	
}
