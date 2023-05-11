# ``Termios``

Cross-platform wrapper around the `termios` struct.

## Overview

You can access these options with either their raw flag, such as ``Termios/Termios/csize`` or using a comprehensive property like ``Termios/Termios/size``.

## Topics

### Control

- ``Termios/Termios/size``
- ``Termios/Termios/isTwoStopBitsUsed``
- ``Termios/Termios/isParityEnabled``
- ``Termios/Termios/parity-swift.property``
- ``Termios/Termios/isReadEnabled``
- ``Termios/Termios/willHangUpOnLastClose``
- ``Termios/Termios/isModemStatusLineMonitoringEnabled``
- ``Termios/Termios/isFlowControlledByCarrier``

### Input

- ``Termios/Termios/isGeneratingInterruptOnIncomingBreaks``
- ``Termios/Termios/isConvertingIncomingCarriageReturnsToNewline``
- ``Termios/Termios/isIgnoringIncomingBreaks``
- ``Termios/Termios/isIgnoringIncomingCarriageReturn``
- ``Termios/Termios/isIgnoringInputParityErrors``
- ``Termios/Termios/isConvertingIncomingNewlinesToCarriageReturns``
- ``Termios/Termios/isInputParityChecked``
- ``Termios/Termios/isInputStripped``
- ``Termios/Termios/isResumeOnAnyCharacterEnabled``
- ``Termios/Termios/isInputControlEnabled``
- ``Termios/Termios/isOutputControlEnabled``
- ``Termios/Termios/isParityErrorMarked``
- ``Termios/Termios/isBellRingOnFullInputQueueEnabled``

### Local

- ``Termios/Termios/isEchoEnabled``
- ``Termios/Termios/isAlwaysEchoingNewlines``
- ``Termios/Termios/isLineErasingEnabled``
- ``Termios/Termios/isCharacterErasingEnabled``
- ``Termios/Termios/isLineDiscardingEnabled``

### Utilities

Additional properties provided for convenience.

- ``Termios/Termios/bitsPerCharacter``
