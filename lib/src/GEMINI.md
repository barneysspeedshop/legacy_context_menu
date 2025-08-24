## Project Guidelines for Gemini Code Assist

This document outlines the key principles and conventions for the `legacy_context_menu` package. Please adhere to these guidelines when providing code suggestions and modifications.

### 1. Code Style and Conventions

*   **Immutability**: Use `const` for constructors, variables, and collections wherever possible to promote immutability and improve performance.
*   **Color Opacity**: As a strict rule, never use the `.withOpacity()` method on `Color` objects. Always use `.withValues(alpha: ...)` to ensure precision and adhere to project-specific lints.
    ```dart
    // Correct
    final myColor = Colors.blue.withValues(alpha: 0.5);

    // Incorrect
    final myColor = Colors.blue.withOpacity(0.5);
    ```
*   **API Documentation**: All public-facing classes, methods, and properties must have clear and concise Dartdoc comments. Explain what the code does, its parameters, and what it returns.

### 2. Project Structure

The package follows a standard structure to separate public API from implementation details.

*   **Public API**: The main library file `lib/legacy_context_menu.dart` should only export the public API.
*   **Implementation**: Internal widgets and logic are located in the `lib/src/` directory.
*   **Models**: Data models, like `ContextMenuItem`, are placed in `lib/src/models/`.

### 3. Testing

*   **Widget Tests**: All new features or bug fixes must be accompanied by corresponding widget tests in the `/test` directory.
*   **Coverage**: Ensure that tests cover the primary functionality, including user interactions and edge cases (e.g., disabled states, submenu navigation).