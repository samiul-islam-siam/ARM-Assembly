# ARM Assembly Programming in Keil

## 🛠️ Prerequisites

Make sure the following tools are installed before getting started:

- Download MDK-Arm: [Keil $\mu$Vision](https://www.keil.com/download/product/)
- **Hardware:** No hardware needed!
- **Operating System:** Windows 10 or 11

## ⚙️ Running a Program Using the Simulator

1. Open **Keil μVision** and go to **Project → New μVision Project**.  
   Enter a project name and click **Save**.

2. In the **Select Device for Target 'Target 1'** window:
   - Expand **ARM → ARM Cortex-M4**
   - Select **ARMCM4**
   - Click **OK**

3. In the **Manage Run-Time Environment** window:
   - Expand **CMSIS** and select **CORE**
   - Expand **Device** and select **Startup (C Startup)**
   - Click **OK**

4. From the left sidebar (**Project** panel):
   - Right-click **Source Group 1**
   - Select **Add New Item to Group 'Source Group 1'**

5. Choose **Asm File (.s)** from the list, give the file a name, and click **Add**.

6. You can now write your ARM assembly code in the editor.

7. Before running the program, open the target configuration window:
   - Go to **Project → Options for Target 'Target 1'**
   - Or press **Alt + F7**

8. Open the **Linker** tab and select the scatter file:

   ```text
   .\RTE\Device\ARMCM4\ARMCM4_ac6.sct
   ```

9. Open the **Debug** tab and make sure **Use Simulator** is enabled.

10. Save the project using **Ctrl + S** and build it using the **Build/Rebuild** button.

11. Start debugging by clicking **Start/Stop Debug Session**.

12. If the build completes successfully (without errors in the `.s` file), the debugger will launch.

13. You can now run the program and inspect:
   - Watch Window
   - Memory Window
   - Registers
   - Serial Windows
   - Other debugging tools as needed

---

## 📂 Project Structure

```text
├── o2_Labx/
|   ├── Lab Manual x.pdf
│   ├── example1.s
│   ├── example2.s
│   └── ...
├── README.md
```

---

## 📄 License

This project is open-source and available for educational and personal use.  
Feel free to use, modify, and distribute it as needed.
