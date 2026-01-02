# Tutorial: Start Here

This short guide is written for someone who codes in JavaScript or Python and is completely new to Java. It explains what this repository is for and how to move through it slowly.

## What this project is
- It is a place to experiment with **Minecraft mods** (small add-ons that change the game).
- The repository currently contains planning notes in `plans/` and older documentation in `docs/`.
- You do not need to know deep Java yet; the goal is to help you reach your first working change.

## How to read the repository (step by step)
1. Open `plans/minecraft-mod-creation-guide.md` (located in the `plans/` folder of this repo) to see the big picture. Read it like a roadmap, not like code.
2. Skim `docs/` if you want examples of how features are explained to players.
3. Follow `tutorial/first-mod-walkthrough.md` (next file in this folder) for a slow, beginner-friendly path to creating a tiny feature. If you generated your project from a template, the same steps apply—the files already exist, so you only need to add the shown code.
4. When you get stuck on Java syntax, search online for “Java vs Python syntax cheat sheet” or “Java vs JS syntax” and copy small patterns rather than guessing.

## Tools you will need
- **Java 17+** (the runtime/compiler). Install like you would install Node or Python.
- **Gradle** (a build tool). When you create your mod project (using a Forge/Fabric template), it will generate the Gradle files for you.
- **An IDE** such as IntelliJ IDEA. Treat it like VS Code with better Java support.
The walkthrough in this folder uses the Fabric mod loader for simplicity; if you choose Forge, the high-level steps are the same but class names and annotations differ (see the plan guide for details).

### Very short build/test flow (once a Gradle project exists)
1. Run `./gradlew build` from the repository root (or `gradle build` if you are using a system Gradle). It downloads dependencies and compiles the mod.
2. If you add unit tests later, they will run as part of that same command.
3. The built JAR (mod file) will appear under `build/libs/` when you have source code and resources.

## Grading / evaluation (why it matters)
If you are doing this for a class or a team review, here is a simple rubric you can follow:
- **40% Working feature:** The mod compiles, loads, and your feature actually works in-game.
- **30% Code clarity:** Your Java code is small, uses clear names, and mirrors patterns from the guide.
- **20% Documentation:** You add or update a short README-style note describing what you built and how to use it.
- **10% Testing and safety:** Basic checks run without errors (e.g., `gradle build`) and you avoid obvious crashes.

Treat the rubric as a checklist. If each line is true, you are likely to get full credit.

## Next steps
- Read `tutorial/first-mod-walkthrough.md`.
- Try one change at a time (for example, add a simple item) and rebuild after each change.
- Keep notes on what worked so you can update the docs for the next learner.
