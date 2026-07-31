# MCU-Peripheral-Simulator
**Study Only, Mainly for Practice

# Firmware Sandbox: MCU Peripheral Simulator (Phase 1)

This project is the starting line of a practical study plan to master low-level C programming, memory architectures, and hardware-software boundaries. The goal is to build a pure software simulation of a Microcontroller Unit (MCU) driver layer from the ground up.

Currently, this repository is in **Phase 1: Project Setup & Core Foundations**.

---

## 🛠️ Development Environment Setup (VS Code)

To write and run this code on your computer, you only need to install a couple of things:

1. **Visual Studio Code:** Download and install it for your OS.
2. **C/C++ Extension:** Inside VS Code, click on the Extensions icon on the left bar (or press `Ctrl+Shift+X`), search for `C/C++` (by Microsoft), and click **Install**.
3. **A C Compiler:**
   * **Windows:** Install [MinGW-w64 via MSYS2](https://www.msys2.org/) to get `gcc`.
   * **Mac:** Open your terminal and run `xcode-select --install` to get `clang/gcc`.
   * **Linux:** Run `sudo apt install build-essential`.

---

## 🚀 How to Run the Project in VS Code

1. Open VS Code, go to `File > Open Folder...`, and select your `mcu-peripheral-simulator` folder.
2. Create a new file named `main.c`.
3. Open the built-in Terminal in VS Code (`Ctrl + ~` or `Terminal > New Terminal`).
4. Compile and run your code using these commands:

```bash
gcc main.c -o simulator
./simulator
