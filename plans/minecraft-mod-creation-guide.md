# Minecraft Mod Creation Guide

## Overview
This guide provides a comprehensive plan for creating a Minecraft mod, including installation instructions for Windows and the complete development process.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Windows Installation](#windows-installation)
3. [Development Environment Setup](#development-environment-setup)
4. [Mod Project Structure](#mod-project-structure)
5. [Development Process](#development-process)
6. [Testing Your Mod](#testing-your-mod)
7. [Building and Distribution](#building-and-distribution)

## Prerequisites

### Required Software
- **Java Development Kit (JDK)** - Version 17 or higher
- **Minecraft Java Edition** - Latest version or target version
- **IDE** - IntelliJ IDEA (recommended) or Eclipse
- **Minecraft Forge or Fabric** - Mod loader framework

### Recommended Knowledge
- Java programming fundamentals
- Object-oriented programming concepts
- Basic understanding of Minecraft game mechanics

## Windows Installation

### Step 1: Install Java Development Kit (JDK)

1. **Download JDK 17 or higher:**
   - Visit [Oracle JDK](https://www.oracle.com/java/technologies/downloads/) or [Adoptium](https://adoptium.net/)
   - Download the Windows x64 installer (.msi or .exe)

2. **Install JDK:**
   - Run the installer
   - Follow the installation wizard
   - Note the installation path (typically `C:\Program Files\Java\jdk-17`)

3. **Set Environment Variables:**
   - Open System Properties (Win + Pause/Break or search "Environment Variables")
   - Click "Environment Variables"
   - Under "System Variables", click "New":
     - Variable name: `JAVA_HOME`
     - Variable value: `C:\Program Files\Java\jdk-17` (your JDK path)
   - Find the `Path` variable, click "Edit", and add:
     - `%JAVA_HOME%\bin`
   - Click OK to save

4. **Verify Installation:**
   ```cmd
   java -version
   javac -version
   ```

### Step 2: Install IntelliJ IDEA

1. **Download IntelliJ IDEA:**
   - Visit [JetBrains IntelliJ IDEA](https://www.jetbrains.com/idea/download/#section=windows)
   - Download Community Edition (free) or Ultimate Edition

2. **Install IntelliJ:**
   - Run the installer
   - Follow the installation wizard
   - Select options:
     - Create Desktop Shortcut
     - Add "bin" folder to PATH
     - Add "Open Folder as Project"
     - Associate .java files

3. **Configure IntelliJ:**
   - Launch IntelliJ IDEA
   - Set the JDK: File → Project Structure → SDKs
   - Add your installed JDK

### Step 3: Install Minecraft Java Edition

1. Download and install the [Minecraft Launcher](https://www.minecraft.net/en-us/download)
2. Log in with your Microsoft account
3. Run Minecraft at least once to ensure it works properly

### Step 4: Choose and Setup Mod Loader

#### Option A: Minecraft Forge

1. **Download Forge:**
   - Visit [Minecraft Forge](https://files.minecraftforge.net/)
   - Select your Minecraft version
   - Download the "MDK" (Mod Development Kit)

2. **Extract Forge MDK:**
   - Create a new folder for your mod project (e.g., `C:\MinecraftMods\MyMod`)
   - Extract the Forge MDK zip file to this folder

3. **Setup Forge Project:**
   ```cmd
   cd C:\MinecraftMods\MyMod
   gradlew.bat genIntellijRuns
   ```

4. **Open in IntelliJ:**
   - Open IntelliJ IDEA
   - File → Open
   - Select the project folder
   - Wait for Gradle to finish indexing

#### Option B: Fabric

1. **Download Fabric:**
   - Visit [Fabric Development Template](https://fabricmc.net/develop/template/)
   - Click "Generate Template"
   - Or use the [Fabric Example Mod](https://github.com/FabricMC/fabric-example-mod)

2. **Extract and Setup:**
   - Extract the template to your project folder
   - Open in IntelliJ IDEA
   - Let Gradle sync the project

## Development Environment Setup

### Initial Configuration

1. **Configure build.gradle:**
   ```gradle
   // Set mod information
   version = '1.0.0'
   group = 'com.yourname.modid'
   archivesBaseName = 'yourmodname'
   
   minecraft {
       version = '1.20.1-forge-47.1.0' // or your target version
       mappings channel: 'official', version: '1.20.1'
   }
   ```

2. **Update mods.toml (Forge) or fabric.mod.json (Fabric):**
   - Set mod ID, name, version, description
   - Set authors and dependencies
   - Configure mod metadata

3. **Sync Gradle:**
   - In IntelliJ: Gradle panel → Reload All Gradle Projects
   - Or run: `gradlew.bat build --refresh-dependencies`

## Mod Project Structure

### Forge Mod Structure
```
MyMod/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── yourname/
│       │           └── modid/
│       │               ├── MyMod.java (Main mod class)
│       │               ├── items/
│       │               ├── blocks/
│       │               └── client/
│       └── resources/
│           ├── META-INF/
│           │   └── mods.toml
│           ├── assets/
│           │   └── modid/
│           │       ├── textures/
│           │       ├── models/
│           │       └── lang/
│           └── data/
│               └── modid/
│                   └── recipes/
├── build.gradle
└── gradle.properties
```

### Fabric Mod Structure
```
MyMod/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── yourname/
│       │           └── modid/
│       │               └── MyMod.java
│       └── resources/
│           ├── fabric.mod.json
│           ├── assets/
│           └── data/
├── build.gradle
└── gradle.properties
```

## Development Process

### Phase 1: Basic Mod Setup

1. **Create Main Mod Class:**
   - For Forge: Annotate with `@Mod`
   - For Fabric: Implement `ModInitializer`
   - Add initialization code

2. **Test Basic Setup:**
   - Run the Minecraft client from IDE
   - Verify mod loads without errors
   - Check mod appears in mods list

### Phase 2: Add Custom Content

#### Adding Custom Items

1. **Create Item Class:**
   ```java
   public class CustomItem extends Item {
       public CustomItem(Properties properties) {
           super(properties);
       }
   }
   ```

2. **Register Item:**
   - Create registration system
   - Register during initialization
   - Set creative tab

3. **Add Textures:**
   - Create 16x16 PNG texture
   - Place in `assets/modid/textures/item/`
   - Create item model JSON

#### Adding Custom Blocks

1. **Create Block Class:**
   ```java
   public class CustomBlock extends Block {
       public CustomBlock(Properties properties) {
           super(properties);
       }
   }
   ```

2. **Register Block:**
   - Register block
   - Register block item
   - Set properties (hardness, tool type, etc.)

3. **Add Block Models and Textures:**
   - Create block textures
   - Create blockstate JSON
   - Create block model JSON

#### Adding Custom Entities

1. **Create Entity Class**
2. **Register Entity Type**
3. **Create Entity Renderer**
4. **Add Entity Textures and Models**

### Phase 3: Advanced Features

1. **Custom Recipes:**
   - Create recipe JSON files
   - Place in `data/modid/recipes/`

2. **Data Generation:**
   - Use data generators for recipes, loot tables, tags
   - Run data generation task

3. **Configuration:**
   - Add configuration files
   - Use Forge Config API or Fabric Config

4. **Networking:**
   - Create custom packets
   - Handle client-server communication

5. **Events:**
   - Register event listeners
   - Handle game events

## Testing Your Mod

### In-Development Testing

1. **Run from IDE:**
   - Use the "runClient" configuration
   - Test features in development environment
   - Check console for errors

2. **Debug Mode:**
   - Set breakpoints in your code
   - Use IDE debugger
   - Inspect variables and game state

3. **Test Checklist:**
   - [ ] Mod loads without crashes
   - [ ] Items appear in creative menu
   - [ ] Textures render correctly
   - [ ] Blocks can be placed and broken
   - [ ] Recipes work as intended
   - [ ] No console errors or warnings

### Build Testing

1. **Build the Mod:**
   ```cmd
   gradlew.bat build
   ```

2. **Install in Minecraft:**
   - Find the JAR file in `build/libs/`
   - Copy to `.minecraft/mods/` folder
   - Launch Minecraft with Forge/Fabric

3. **Test in Production:**
   - Test all features
   - Check compatibility with other mods
   - Verify performance

## Building and Distribution

### Building the Mod

1. **Clean Build:**
   ```cmd
   gradlew.bat clean build
   ```

2. **Locate the JAR:**
   - Find in `build/libs/`
   - File format: `modname-version.jar`

### Preparing for Release

1. **Update Version Number:**
   - Update in `build.gradle`
   - Update in `mods.toml` or `fabric.mod.json`

2. **Create README:**
   - Describe mod features
   - List requirements
   - Add installation instructions

3. **Test Final Build:**
   - Install and test the JAR file
   - Verify no development files are included

### Distribution Options

1. **CurseForge:**
   - Create account at [CurseForge](https://www.curseforge.com/)
   - Create new project
   - Upload JAR file
   - Add description and images

2. **Modrinth:**
   - Create account at [Modrinth](https://modrinth.com/)
   - Create new project
   - Upload mod file

3. **GitHub Releases:**
   - Create repository
   - Create release tag
   - Attach JAR file

## Common Issues and Solutions

### Issue: Gradle Sync Fails
- **Solution:** Run `gradlew.bat clean --refresh-dependencies`
- Check internet connection
- Verify JDK installation

### Issue: Missing Textures (Purple/Black Checkerboard)
- **Solution:** Check texture file paths
- Verify texture filenames match references
- Ensure textures are 16x16 PNG files

### Issue: Mod Doesn't Load
- **Solution:** Check mods.toml/fabric.mod.json syntax
- Verify Minecraft version compatibility
- Check console for error messages

### Issue: Crashes on Launch
- **Solution:** Review crash log
- Check for conflicting mods
- Verify all dependencies are present

## Resources

### Documentation
- [Forge Documentation](https://docs.minecraftforge.net/)
- [Fabric Documentation](https://fabricmc.net/wiki/)
- [Minecraft Wiki](https://minecraft.fandom.com/wiki/Minecraft_Wiki)

### Tutorials
- [Forge Modding Tutorials](https://forge.gemwire.uk/wiki/Main_Page)
- [Fabric Wiki Tutorials](https://fabricmc.net/wiki/tutorial:introduction)
- [McJty's YouTube Tutorials](https://www.youtube.com/user/McJty)

### Community
- [Forge Forums](https://forums.minecraftforge.net/)
- [Fabric Discord](https://discord.gg/v6v4pMv)
- [r/feedthebeast](https://www.reddit.com/r/feedthebeast/)

## Development Workflow Summary

1. **Setup:** Install JDK, IDE, Forge/Fabric
2. **Create:** Set up mod project structure
3. **Develop:** Add items, blocks, entities, features
4. **Test:** Debug and test in development environment
5. **Build:** Compile mod to JAR file
6. **Release:** Distribute on CurseForge/Modrinth
7. **Maintain:** Fix bugs, add features, update versions

## Next Steps

1. Choose between Forge and Fabric based on your needs
2. Complete the Windows installation steps
3. Create your first simple mod (e.g., a custom item)
4. Gradually add more complex features
5. Join the modding community for support

Good luck with your Minecraft modding journey!
