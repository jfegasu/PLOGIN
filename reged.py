import winreg
from utils.Utilitarios import *
python_exe = r"C:\Python39\python.exe"  # Asegúrate de usar la ruta correcta a tu python.exe
script_path = r"D:\GITHUB\CPSI\PROY\PLOGIN\putil.py"

command = f'"{python_exe}" "{script_path}"'
# reg_key = winreg.CreateKey(winreg.HKEY_CURRENT_USER, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run")
# winreg.SetValueEx(reg_key, "InventaDB", 0, winreg.REG_SZ, 'python.exe "D:\\GITHUB\\CPSI\\PROY\\PLOGIN\\putil.py"')
# winreg.CloseKey(reg_key)
a="inicio"; b='python.exe "D:\\GITHUB\\CPSI\\PROY\\PLOGIN\\putil.py"'
RegEdCrea('START',b)
RegEdCrea('puerto','5001')
RegEdCrea('path',r'd:\github\CPSI\PROY\PLOGIN')


print(getRegEd("puerto"))

# reg_key = winreg.CreateKey(winreg.HKEY_CURRENT_USER, r"SOFTWARE\InventaDB") 
# winreg.SetValueEx(reg_key, 'PUERTO', 0, winreg.REG_SZ, '3307') 
# winreg.CloseKey(reg_key)
