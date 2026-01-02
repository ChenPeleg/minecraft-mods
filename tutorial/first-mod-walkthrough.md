# First Mod Walkthrough (slow and friendly)

Audience: you know JavaScript/Python and want to add one tiny feature to a Minecraft mod without drowning in Java details.

## Goal
Add a super simple feature: a custom item that says hello in chat when you right-click it. This mirrors adding a small function in JS or a command in Python.

## Step 1: Understand the folders
- `src/main/java/` — Java source files (like `src/` in Node projects).
- `src/main/resources/` — JSON and assets (similar to static files in web apps).
- `build.gradle` — Project settings (like `package.json` but for Gradle).

If the folders do not exist yet, create them as you go.

## Step 2: Create the main mod class
In Java, a class is like a module plus its functions. Create `MyMod.java` in `src/main/java/com/example/mymod/` with this minimal shape:
```java
package com.example.mymod;

import net.fabricmc.api.ModInitializer;

public class MyMod implements ModInitializer {
    public static final String MOD_ID = "mymod";

    @Override
    public void onInitialize() {
        // Runs once when Minecraft loads your mod
    }
}
```
Think of `onInitialize` as `main()` in Python or the top-level `init()` in a small JS script.

## Step 3: Register a simple item
Add this inside the `com.example.mymod` package:
```java
public class HelloItem extends Item {
    public HelloItem(Settings settings) {
        super(settings);
    }

    @Override
    public TypedActionResult<ItemStack> use(World world, PlayerEntity user, Hand hand) {
        if (!world.isClient) {
            user.sendMessage(Text.literal("Hello from your first mod!"), false);
        }
        return super.use(world, user, hand);
    }
}
```
- `@Override` is like redefining a method in a subclass in Python.
- `Text.literal` builds the chat message.

Register the item during `onInitialize`:
```java
public static final Item HELLO_ITEM = new HelloItem(new Item.Settings());

public void onInitialize() {
    Registry.register(Registries.ITEM, new Identifier(MOD_ID, "hello_item"), HELLO_ITEM);
}
```

## Step 4: Add the item JSON
Create `src/main/resources/assets/mymod/models/item/hello_item.json`:
```json
{ "parent": "minecraft:item/generated", "textures": { "layer0": "mymod:item/hello_item" } }
```
Add a 16×16 PNG at `src/main/resources/assets/mymod/textures/item/hello_item.png`. (You can reuse any small square image while learning.)

## Step 5: Build and try it
1. Run `gradle build`.
2. Copy the resulting JAR from `build/libs/` into your Minecraft `mods` folder.
3. Launch the game, open a world, and give yourself the item with `/give @p mymod:hello_item`.
4. Right-click with the item; you should see the chat message.

## Troubleshooting (in plain language)
- **“Cannot find symbol” errors:** Check imports at the top of the file. IntelliJ can auto-import with `Alt+Enter`.
- **Game crashes on load:** The mod ID in code, JSON paths, and filenames must match exactly (case-sensitive).
- **Texture is missing (purple/black):** The PNG path or name is wrong; match the JSON path precisely.

## What to do next
- Change the message text or add a cooldown to see how logic works.
- Follow the same pattern to add a block or a command.
- Update `tutorial/README.md` with anything you learned so future readers benefit.
