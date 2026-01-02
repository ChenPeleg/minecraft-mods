# Plan: Update Minecraft & Fabric tool versions

Goal: set the repository to use the requested versions safely and document them.

Checklist 
- Update keys in Gradle files: `minecraft_version`, `yarn_mappings`, `loader_version`, `loom_version`, `fabric_api_version`.
- Refresh dependencies and build (`./gradlew --refresh-dependencies && ./gradlew build`).
- Run client and smoke-test; revert if incompatible.

Versions to apply

```
minecraft_version=1.21.11
yarn_mappings=1.21.11+build.3
loader_version=0.18.4
loom_version=1.14-SNAPSHOT

# Fabric API
fabric_api_version=0.140.2+1.21.11
```

Document final working versions here after verification.

