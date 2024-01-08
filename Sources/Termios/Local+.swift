//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2021-12-26.
//

import CTermios

extension Termios {

	//MARK: - Properties

	/// Input characters are echoed back to the terminal
	@inlinable public var isEchoEnabled: Bool {
		get { rawValue.echo }
		set { rawValue.echo = newValue }
	}

	/// Wether to always echo newlines regardless of ``isEchoEnabled``'s value
	///
	/// This has no effect if ``isCanonical`` is `false`
	@inlinable public var isAlwaysEchoingNewlines: Bool {
		get { rawValue.echonl }
		set { rawValue.echonl = newValue }
	}

	/// Allows erasing lines with the special character ``erase``
	///
	/// This has no effect if ``isCanonical`` is `false`
	@inlinable public var isLineErasingEnabled: Bool {
		get { rawValue.echoke }
		set { rawValue.echoke = newValue }
	}

	/// Allows erasing the last character of the current line with the special character ``erase``
	///
	/// This has no effect if ``isCanonical`` is `false`
	@inlinable public var isCharacterErasingEnabled: Bool {
		get { rawValue.echoe }
		set { rawValue.echoe = newValue }
	}

	/// Allows discarding lines with the special character ``discard``
	///
	/// Note that **visually**, this is the equivalent of a linefeed. To erase the line from the display, enable ``isLineErasingEnabled`` instead.
	///
	/// This has no effect if ``isCanonical`` is `false`
	@inlinable public var isLineDiscardingEnabled: Bool {
		get { rawValue.echok }
		set { rawValue.echok = newValue }
	}

	/// Processes input line by line, allows manipulating the line before submitting it
	@inlinable public var isCanonical: Bool {
		get { rawValue.icanon }
		set { rawValue.icanon = newValue }
	}

	/// This assumes the output is a printer and will wrap the erased characters with a backslash and forward slash
	@inlinable public var describeErase: Bool {
		get { rawValue.echoprt }
		set { rawValue.echoprt = newValue }
	}

	/// Displays control characters by prepending a caret, such as `^C` for control-C
	@inlinable public var describeControlCharacters: Bool {
		get { rawValue.echoctl  }
		set { rawValue.echoctl = newValue }
	}

	/// Selects which word erasing algorithm to use.
	///
	/// If this is `false`, whitespace is erased, and then the maximal sequence of non-whitespace characters.
	///
	/// If this is `true`, first any preceding whitespace is erased, and then the maximal sequence of alphabetic/underscores or non alphabetic/underscores.
	/// As a special case in this second algorithm, the first previous non-whitespace character is skipped in determining whether the preceding word is a sequence
	/// of alphabetic/undercores. This sounds confusing but turns out to be quite practical.
	@inlinable public var useAlternateWordEraseAlgorithm: Bool {
		get { rawValue.altwerase }
		set { rawValue.altwerase = newValue }
	}

	/// Wether to process interrupts from ``Termios/Termios/ControlCharacters/interrupt``, kills from ``Termios/Termios/ControlCharacters/kill`` and suspensions from ``Termios/Termios/ControlCharacters/suspend``
	@inlinable public var isProcessControlEnabled: Bool {
		get { rawValue.isig }
		set { rawValue.isig = newValue }
	}

	/// Wether to flush the input and output queues before doing process control functions
	///
	/// This has no effect if ``isProcessControlEnabled`` is `false`
	@inlinable public var preventFlushOnProcessControl: Bool {
		get { rawValue.noflsh }
		set { rawValue.noflsh = newValue }
	}

	/// Wether to allow implementation-defined extended functionnality
	@inlinable public var areExtensionsEnabled: Bool {
		get { rawValue.iexten }
		set { rawValue.iexten = newValue }
	}

}
