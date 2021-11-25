# SwiftLogger

A minimal logger framework for Swift. 

## Usage

```swift
let logger: Logger = SimpleLogger(level: .debug)
...
logger.warning("I got a bad feeling about this...")
```

The `Logger` protocol can be passed around without taking a direct dependency on a given implementation.

## Features

- Mulitple output levels: verbose, debug, info, warning, and error
- Output can be filtered by level
- Outputs formatted messages with timestamp
