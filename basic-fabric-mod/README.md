# Basic Fabric Mod

A very basic Minecraft mod created using Fabric Loom.

## Description

This is a minimal example of a Minecraft mod using the Fabric modding framework. It demonstrates the basic structure and setup required for Fabric mod development.

## Features

- Basic mod initialization
- Logging to console when the mod loads
- Minimal dependencies (Fabric API)

## Requirements

- Minecraft 1.20.1
- Fabric Loader 0.14.21 or higher
- Fabric API
- Java 17 or higher
- Internet access to `maven.fabricmc.net` for building

## Building

**Note:** Building this mod requires access to the Fabric Maven repository at `https://maven.fabricmc.net/`. If you're in an environment where this domain is not accessible, the build will fail with a "Could not resolve host" error.

To build the mod, run:

```bash
./gradlew build
```

The compiled mod JAR will be located in `build/libs/`.

## Installation

1. Make sure you have Fabric Loader installed in your Minecraft launcher
2. Copy the built JAR file from `build/libs/` to your `.minecraft/mods/` folder
3. Launch Minecraft with the Fabric profile

## Project Structure

```
basic-fabric-mod/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/example/basicmod/
│       │       └── BasicMod.java          # Main mod class
│       └── resources/
│           └── fabric.mod.json            # Mod metadata
├── build.gradle                           # Build configuration
├── gradle.properties                      # Project properties
├── settings.gradle                        # Gradle settings
└── README.md                              # This file
```

## Development

This mod uses:
- Fabric Loom for mod development
- Gradle for build automation
- Fabric API for core mod functionality

## License

This mod is available under the MIT License.

