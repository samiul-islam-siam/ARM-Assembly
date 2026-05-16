# ARM Assembly Programming in Keil

## 🛠️ Prerequisites

Make sure the following tools are installed before getting started:

- Download MDK-Arm: [Keil $\mu$Vision](https://www.keil.com/download/product/)
- **Hardware:** No hardware needed!
- **Operating System:** Windows 10 or 11

## ⚙️ Running a program using simulator

1. Go to Project → New $\mu$Vision Project. Name your project and then **Save**.

2. From the Select Device for Target ‘Target 1’ window, expand ARM → ARM Cortex M4 and then select ARMCM4.

3. Go to “Manage Run-Time Environment” window, expand CMSIS and select CORE and then expand Device and then select Startup (C Startup).

4. Then from the left sidebar titled “Project”, right click on Source Group 1, and then press “Add new item to Group ‘Source Group 1’”.

5. Select Asm File (.s) from the type selection menu and name it.

6. Now you can see the editor where you would be able to write assembly programs.

7. Before running, go to Project → **Options for Target 'Target_1'** for configuring the options or use **Alt+F7**.

8. Now go to the “Linker” tab and then from the Scatter File dropdown, choose “.\RTE\Device\ARMCM4\ARMCM4_ac6.sct”.

9. Then from the “Debug” tab, make sure you have selected the “Use Simulator” checkbox.

10. Now, just simply save by pressing Ctrl + S, and then compile with the build/rebuild button.

11. Then you can start the debugger by clicking on the Start/Stop Debug Session button.

12. If the build process was successful (no error in the .s file), the debug session will start. 

13. You can now run the code and check the Watch Windows, Memory Windows, Serial Windows according your need.

## 📄 License

This project is open-source. Feel free to use and modify it as needed.