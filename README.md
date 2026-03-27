# 📊 Body Mass Index (BMI) Calculator (Version in LUA)

This is a small console application written in LUA that calculates the user's Body Mass Index (BMI) and determines their ideal weight range, offering a friendly, colored interface.

---

## ✨ Features

- **BMI Calculation:** Calculates BMI based on weight (kg) and height (m).  
- **Weight Classification:** Displays the weight classification (Underweight, Normal Weight, Obesity, etc.) according to the table (based on SUS standards).  
- **Ideal Weight Range:** Calculates and displays the ideal weight range in kilograms for the entered height.  
- **Interactive Interface:** Uses colors and an ASCII banner for a better visual experience in the terminal.  
- **Compatibility:** Works across different operating systems like Windows, Linux, and macOS (adaptive screen clearing).
- **Modular Architecture:** The code has been divided into modules, making it easier to study.

---

## ⬇️ Setup (Cloning the Repository)

If this project is hosted on GitHub, you can clone it to your local machine using Git:

```bash
git clone https://github.com/CodeMarcsX/LuBMI.git
cd LuBMI
````

---

## 🛠️ How to run

### Prerequisites

You need to have the Lua interpreter installed on your system.

### Execution

No compilation required! Just run the main file:

```bash
lua main.lua
````

⚠️ Important: If the banner or special characters appear "bugged" in the terminal, first set the code page to UTF-8:
```bash
chcp 65001
```

---

## 🚀 Usage

1. The program will start with a banner and the screen will be cleared.
2. It will prompt you to enter your weight in kilograms (kg).
3. Next, it will prompt for your height in meters (m).
4. The result will be displayed, showing your BMI, classification, and ideal weight range.

**Interaction Example:**

```
=====================================
        █████╗  ███╗   ███╗██╗
        ██╔══██╗████╗ ████║██║
        ███████║██╔████╔██║██║
        ██╔══██║██║╚██╔╝██║██║
        ███████║██║ ╚═╝ ██║██║
        ╚══════╝╚═╝     ╚═╝╚═╝
=====================================
          BODY MASS INDEX
=====================================

Your weight (kg): 75
Your height (m): 1.75
Your age (y): 18

Your BMI is 24.5
Ideal weight between 55.7 kg and 78.4 kg.
Normal weight.
```

or

**Preview:**

https://github.com/user-attachments/assets/ea1f8d4a-00c9-47f8-90a8-d2cab80359f0
