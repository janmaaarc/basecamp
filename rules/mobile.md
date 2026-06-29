# Mobile Development Rules (React Native / Flutter)

- Never block the main thread. Move heavy work to background isolates or workers.
- Handle offline state explicitly. Assume the network can fail at any time.
- Use platform-specific APIs only when necessary. Prefer cross-platform abstractions.
- Never hardcode screen dimensions. Use responsive layouts.
- Test on both iOS and Android before marking anything done.
- Request permissions at the point of need, not on app launch.
- Never store sensitive data in AsyncStorage or SharedPreferences unencrypted.
- Handle app lifecycle events (background, foreground, kill) explicitly.
