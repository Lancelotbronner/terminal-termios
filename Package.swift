// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Termios",
	products: [
		.library(
			name: "Termios",
			targets: ["Termios"]
		),
	],
	targets: [
		.target(name: "CTermios"),
		.target(name: "Termios", dependencies: ["CTermios"]),
		
		.testTarget(name: "TermiosTests", dependencies: ["Termios"]),
	]
)
