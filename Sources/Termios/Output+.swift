//
//  File.swift
//  
//
//  Created by Christophe Bronner on 2021-12-25.
//

import Darwin.POSIX.termios

extension Termios {

	/// Wether output is processed or displayed as-is, controls wether any other output processing is enabled
	@inlinable public var isOutputProcessingEnabled: Bool {
		get { rawValue.opost }
		set { rawValue.opost = newValue }
	}

	/// Wether newlines are translated to carriage return, linefeed
	///
	/// This has no effect if ``isOutputPreprocessed`` is `false`.
	@inlinable public var isOutputNewlineConvertedCarriageReturn: Bool {
		get { rawValue.onlcr }
		set { rawValue.onlcr = newValue }
	}

	/// Wether tabs are expanded to 8 spaces
	///
	/// This has no effect if ``isOutputPreprocessed`` is `false`.
	@inlinable public var isOutputTabExpanded: Bool {
		get { rawValue.oxtabs }
		set { rawValue.oxtabs = newValue }
	}

	/// Wether `EOT` should be discarded
	///
	/// This has no effect if ``isOutputPreprocessed`` is `false`.
	@inlinable public var isOutputEndOfTransmissionDiscarded: Bool {
		get { rawValue.onoeot }
		set { rawValue.onoeot = newValue }
	}

	/// Wether carriage returns are translated to linefeeds
	///
	/// This has no effect if ``isOutputPreprocessed`` is `false`.
	@inlinable public var isOutputCarriageReturnConvertedNewline: Bool {
		get { rawValue.ocrnl }
		set { rawValue.ocrnl = newValue }
	}

	/// Wether to discard carriage returns when the cursor is already at column 0
	///
	/// This has no effect if ``isOutputPreprocessed`` is `false`.
	@inlinable public var isOutputCarriageReturnDiscarded: Bool {
		get { rawValue.onocr }
		set { rawValue.onocr = newValue }
	}

	/// Wether to interpret linefeeds as also doing a carriage return
	///
	/// This has no effect if ``isOutputPreprocessed`` is `false`.
	@inlinable public var isNewlineAlsoCarriageReturn: Bool {
		get { rawValue.onlret }
		set { rawValue.onlret = newValue }
	}

}
