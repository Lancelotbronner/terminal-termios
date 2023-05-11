//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2021-12-26.
//

import Darwin.POSIX.termios

/// The NL and CR characters cannot be changed.  The values for all the remaining characters can be set and are
/// described later in the document under Special Control Characters.
///
/// Special character functions associated with changeable special control characters can be disabled individually by
/// setting their value to {_POSIX_VDISABLE}; see Special Control Characters.
///
/// If two or more special characters have the same value, the function performed when that character is received is
/// undefined.
extension termios {

	/// End of file, defaults to `^D`
	///
	/// Special character on input and is recognized if the ICANON flag is set.  When received, all the bytes
	/// waiting to be read are immediately passed to the process, without waiting for a newline, and the EOF is
	/// discarded.  Thus, if there are no bytes waiting (that is, the EOF occurred at the beginning of a line), a
	/// byte count of zero is returned from the read(), representing an end-of-file indication.  If ICANON is
	/// set, the EOF character is discarded when processed.  NL Special character on input and is recognized if
	/// the ICANON flag is set.  It is the line delimiter ‘\n’.
	@inlinable public var veof: cc_t {
		get { get(character: VEOF) }
		set { set(character: VEOF, to: newValue) }
	}

	/// End of line. Disabled by default.
	///
	/// Special character on input and is recognized if the ICANON flag is set.  Is an additional line delimiter,
	/// like NL.
	@inlinable public var veol: cc_t {
		get { get(character: VEOL) }
		set { set(character: VEOL, to: newValue) }
	}

	/// Erase, defaults to `^?` `\177`
	///
	/// Special character on input and is recognized if the ICANON flag is set.  Erases the last character in the
	/// current line; see Canonical Mode Input Processing.  It does not erase beyond the start of a line, as
	/// delimited by an NL, EOF, or EOL character.  If ICANON is set, the ERASE character is discarded when
	/// processed.
	@inlinable public var verase: cc_t {
		get { get(character: VERASE) }
		set { set(character: VERASE, to: newValue) }
	}

	/// Kill, defaults to `^U`
	///
	/// Special character on input and is recognized if the ICANON flag is set.  Deletes the entire line, as
	/// delimited by a NL, EOF, or EOL character.  If ICANON is set, the KILL character is discarded when
	/// processed.
	@inlinable public var vkill: cc_t {
		get { get(character: VKILL) }
		set { set(character: VKILL, to: newValue) }
	}

	/// Interrupt, defaults to `^C`
	///
	/// Special character on input and is recognized if the ISIG flag (see the Local Modes section) is enabled.
	/// Generates a SIGINT signal which is sent to all processes in the foreground process group for which the
	/// terminal is the controlling terminal.  If ISIG is set, the INTR character is discarded when processed.
	@inlinable public var vintr: cc_t {
		get { get(character: VINTR) }
		set { set(character: VINTR, to: newValue) }
	}

	/// Quit, defaults to `^\` `\34`
	///
	/// Special character on input and is recognized if the ISIG flag is enabled.  Generates a SIGQUIT signal
	/// which is sent to all processes in the foreground process group for which the terminal is the controlling
	/// terminal.  If ISIG is set, the QUIT character is discarded when processed.
	@inlinable public var vquit: cc_t {
		get { get(character: VQUIT) }
		set { set(character: VQUIT, to: newValue) }
	}

	/// Suspend, defaults to `^Z`
	///
	/// If the ISIG flag is enabled, receipt of the SUSP character causes a SIGTSTP signal to be sent to all
	/// processes in the foreground process group for which the terminal is the controlling terminal, and the
	/// SUSP character is discarded when processed.
	@inlinable public var vsusp: cc_t {
		get { get(character: VSUSP) }
		set { set(character: VSUSP, to: newValue) }
	}

	/// Start, defaults to `^Q`
	///
	/// Special character on both input and output and is recognized if the IXON (output control) or IXOFF (input
	/// control) flag is set.  Can be used to resume output that has been suspended by a STOP character.  If IXON
	/// is set, the START character is discarded when processed.  CR Special character on input and is recognized
	/// if the ICANON flag is set; it is the ‘\r’, as denoted in the C Standard {2}.  When ICANON and ICRNL are
	/// set and IGNCR is not set, this character is translated into a NL, and has the same effect as a NL
	/// character.
	@inlinable public var vstart: cc_t {
		get { get(character: VSTART) }
		set { set(character: VSTART, to: newValue) }
	}

	/// Suspend, defaults to `^S`
	///
	/// Special character on both input and output and is recognized if the IXON (output control) or IXOFF (input
	/// control) flag is set.  Can be used to temporarily suspend output.  It is useful with fast terminals to
	/// prevent output from disappearing before it can be read.  If IXON is set, the STOP character is discarded
	/// when processed.
	@inlinable public var vstop: cc_t {
		get { get(character: VSTOP) }
		set { set(character: VSTOP, to: newValue) }
	}

	/// The minimum number of bytes that should be received when the read function successfully returns.
	///
	/// See also <doc:NonCanonicalInputProcessing>
	@inlinable public var vmin: cc_t {
		get { get(character: VMIN) }
		set {
			#if DEBUG
			if newValue <= MAX_INPUT {
				print("Termios.min \(newValue) is higher than MAX_INPUT \(MAX_INPUT), behaviour is undefined")
			}
			#endif
			set(character: VMIN, to: newValue)
		}
	}

	/// A timer of 0.1 second granularity that is used to time out bursty and short term data transmissions.
	///
	/// See also <doc:NonCanonicalInputProcessing>
	@inlinable public var vtime: cc_t {
		get { get(character: VTIME) }
		set { set(character: VTIME, to: newValue) }
	}

	//MARK: - macOS

#if os(macOS)

	/// Secondary end of line character, same function as ``eol``. Disabled by default
	@inlinable public var veol2: cc_t {
		get { get(character: VEOL2) }
		set { set(character: VEOL2, to: newValue) }
	}

	/// Word erase, defaults to `^W`
	///
	/// Special character on input and is recognized if the ICANON flag is set.  Erases the last word in the
	/// current line according to one of two algorithms.  If the ALTWERASE flag is not set, first any preceding
	/// whitespace is erased, and then the maximal sequence of non-whitespace characters.  If ALTWERASE is set,
	/// first any preceding whitespace is erased, and then the maximal sequence of alphabetic/underscores or non
	/// alphabetic/underscores.  As a special case in this second algorithm, the first previous non-whitespace
	/// character is skipped in determining whether the preceding word is a sequence of alphabetic/undercores.
	/// This sounds confusing but turns out to be quite practical.
	@inlinable public var vwerase: cc_t {
		get { get(character: VWERASE) }
		set { set(character: VWERASE, to: newValue) }
	}

	/// Reprint, defaults to `^R`
	///
	///  Special character on input and is recognized if the ICANON flag is set.  Causes the current input edit
	/// line to be retyped.
	@inlinable public var vreprint: cc_t {
		get { get(character: VREPRINT) }
		set { set(character: VREPRINT, to: newValue) }
	}

	/// Suspend, defaults to `^Y`
	///
	/// Has similar actions to the SUSP character, except that the SIGTSTP signal is delivered when one of the
	/// processes in the foreground process group issues a read() to the controlling terminal.
	@inlinable public var vdusp: cc_t {
		get { get(character: VDSUSP) }
		set { set(character: VDSUSP, to: newValue) }
	}

	/// Escape character, defaults to `^V`
	///
	/// Special character on input and is recognized if the IEXTEN flag is set.  Receipt of this character causes
	/// the next character to be taken literally.
	@inlinable public var vlnext: cc_t {
		get { get(character: VLNEXT) }
		set { set(character: VLNEXT, to: newValue) }
	}

	/// Status, defaults to `^T`
	///
	/// Special character on input and is recognized if the ICANON flag is set.  Receipt of this character causes
	/// a SIGINFO signal to be sent to the foreground process group of the terminal.  Also, if the NOKERNINFO
	/// flag is not set, it causes the kernel to write a status message to the terminal that displays the current
	/// load average, the name of the command in the foreground, its process ID, the symbolic wait channel, the
	/// number of user and system seconds used, the percentage of cpu the process is getting, and the resident
	/// set size of the process.
	@inlinable public var vstatus: cc_t {
		get { get(character: VSTATUS) }
		set { set(character: VSTATUS, to: newValue) }
	}

	/// Discard, defaults to `^O`
	///
	/// Special character on input and is recognized if the IEXTEN flag is set.  Receipt of this character
	/// toggles the flushing of terminal output.
	@inlinable public var vdiscard: cc_t {
		get { get(character: VDISCARD) }
		set { set(character: VDISCARD, to: newValue) }
	}

#endif

}

/*
 Special Control Characters
 The special control characters values are defined by the array c_cc.  This table lists the array index, the corresponding special character, and the system default value.  For an accurate list of the system
 defaults, consult the header file ⟨ttydefaults.h⟩.
 
 Index Name    Special Character    Default Value
 VEOF          EOF                  ^D
 VEOL          EOL                  _POSIX_VDISABLE
 VEOL2         EOL2                 _POSIX_VDISABLE
 VERASE        ERASE                ^? ‘\177’
 VWERASE       WERASE               ^W
 VKILL         KILL                 ^U
 VREPRINT      REPRINT              ^R
 VINTR         INTR                 ^C
 VQUIT         QUIT                 ^\\ ‘\34’
 VSUSP         SUSP                 ^Z
 VDSUSP        DSUSP                ^Y
 VSTART        START                ^Q
 VSTOP         STOP                 ^S
 VLNEXT        LNEXT                ^V
 VDISCARD      DISCARD              ^O
 VMIN          ---                  1
 VTIME         ---                  0
 VSTATUS       STATUS               ^T
 
 If the value of one of the changeable special control characters (see Special Characters) is {_POSIX_VDISABLE}, that function is disabled; that is, no input data is recognized as the disabled special character.  If
 ICANON is not set, the value of {_POSIX_VDISABLE} has no special meaning for the VMIN and VTIME entries of the c_cc array.
 
 The initial values of the flags and control characters after open() is set according to the values in the header ⟨sys/ttydefaults.h⟩.
 */
