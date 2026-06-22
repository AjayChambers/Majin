# =========================================================
# Windows 11 (x86_64) Toolchain — GNU-style clang-cl flags
# =========================================================
CMAKE_MINIMUM_REQUIRED(VERSION 4.3.2)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

# Compiler
set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)

# Build System
set(CMAKE_GENERATOR "Ninja")

# Linker
set(CMAKE_LINKER "lld-link")