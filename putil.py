import psutil
import platform as pl 
# for proc in psutil.process_iter():
#     print(proc.name(), proc.pid)
# https://nssm.cc/download

# C:\nssm\nssm.exe install "CheckSystemService" python C:\ruta\a\tu\putil.py
# https://tecnobillo.com/sections/python-en-windows/servicios-windows-python/servicios-windows-python.html
import psutil
import logging
import os
from datetime import datetime
from utils.Utilitarios import *

datos=[]
fecha=datetime.now()
fe1=str(fecha.year)+str(fecha.month)+str(fecha.day)+"-"+str(fecha.hour)+"-"+str(fecha.minute)
fe=str(fecha.year)+"-"+str(fecha.month)+"-"+str(fecha.day)
ruta=getRegEd("path")+'/log/'+fe
print(ruta)
os.makedirs(ruta,exist_ok=True)
       
logging.basicConfig(format='%(asctime)s %(levelname)s %(message)s ',filename=ruta+"/system_check.log", level=logging.INFO)

# Función para verificar los discos
def check_disks():
    partitions = psutil.disk_partitions()
    
    for partition in partitions:
        usage = psutil.disk_usage(partition.mountpoint)
        datos.append(partition.device+": "+str(usage.total))
        
        
# Función para verificar la memoria RAM
def check_memory():
    memory = psutil.virtual_memory()
    datos.append("RAM: "+str(memory.total))

def Total():
    datos_sistema_operativo = [
    'architecture',
    'linux_distribution',
    'mac_ver',
    'machine',
    'platform',
    'processor',
    'python_build',
    'python_compiler',
    'python_version',
    'release',
    'system',
    'uname',
    'version',
    ]
    cpu=psutil.cpu_count()
    pc="PC: "+str(getattr(pl,'node')())
    npc=(getattr(pl,'node')())
    print(npc)
    logging.info(pc)
    
    for perfil in datos_sistema_operativo:
        if hasattr(pl, perfil):  # aqui preguntamos con el metodo hasattr si para la pataforma "pl" contamos con el atributo actual.
            datos.append(perfil+": "+str(getattr(pl, perfil)()))
            
    for da in datos:
       logging.info(da) 
    
# Función principal
def main():
    logging.info('*******************************************************************')
    check_disks()
    check_memory()
    Total()

if __name__ == "__main__":
    main()
