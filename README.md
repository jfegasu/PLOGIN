# PROYECTO PLOGIN
<img src='https://blogger.googleusercontent.com/img/a/AVvXsEimdqxynaYJeDRuTUp3lzEWFnnQSC2KTVSxvnV70I2eZ5tOCfjwdNnExSTSm2tCf1xBFHVHwsN80OCpDCO0J80UTNWxPC86s7s5aB8rnizg7guNowqTxhr5Fd9WH48n7pn8uLZNFTgXuSGUH6BNncmfQEpOz9pAe_T0zD8n2-aGZk8-C_l6GWk-aq60fQ=s960' height=250>

## RUTAS (ENDPOINT)
|ENDPOINT|NOMBRE|REDIRECCIONA|EXCEPCION|
|:---|:--|:--|:---|
| / |RAIZ 127.0.0.1:5000| login.htm|
| /v | VALIDA INGRESO| /paso1| |
|||/|NO SE PUEDE UTILIZAR EL USUARIO ROOT|
|||/|USUARIO O CREDENCIALES NO VALIDOS|
| /paso1 | MUESTRA OPCIONES| / |NO HA VALIDADO CREDENCIALES <paso1>| 
| /cpw  |CONTRASEÑA|clogin.html [/cpw1]|
| /cpw1 | CAMBIO DE CONTRASEÑA|||
|||/|CLAVE ANTERIOR NO COINCIDE <CPWD>|
|||/|LAS NUEVAS CLAVES NO COINCIDEN|
|||/|LA CLAVE NUEVA NO PUEDE SER LA ANTERIOR|
|||/|Error: No cumple con las condiciones:\nAl menos debe haber Una Mayuscula, \nUn numero, Una minuscula,\n un caracter especial,\n una longitud minima de 12 caracteres|
|||/|FALLO CAMBIO DE CLAVE|
|||/|CAMBIO SATISFACTORIO DE CLAVE
|/region|REGIONES|region.html|
|||/|SESION CADUCADA|
|||/paso1|NO TIENE ACCESO <region>|
|/pais|PAISES|pais.html|
|||/|SESION CADUCADA|
|||/paso1|NO TIENE ACCESO <region>|

## TEMPLATES
|NOMBRE|DESCRIPCION|
|:---|:---|
|alerta.html|
|banner.html|
|base.html|
|login.html|
|paso1.html|
|clogin.html|
|pais.html|
|region.tml|

## BASE DE DATOS HR
Tablas, relaciones y datos: [HR](https://github.com/jfegasu/PLOGIN/blob/main/DATASET/HRMYSQL.sql)

## CONFIGURACION DE BASE DE DATOS

### MYSQL
<pre>
MYSQL={
    'MYSQL_HOST':'localhost', 
    'MYSQL_USER':'prueba',
    'MYSQL_PASSWORD':'prueba',
    'MYSQL_DB': 'hr'
    }
    </pre>
### SQLITE
<pre>
SQLITE={
    'SQLITE_DB': 'hr'
}
</pre>
### ASIGNACION
<pre>
DATABASE=MYSQL
</pre>
### UTILIZACION
<pre>
def CargarBD(cual):
    MY=list(DATABASE.items())
    for i in range(len(MY)):
        cual[f"'{MY[i][0]}'"]=MY[i][1]
</pre>

# LOG DE TRANSACCIONES
<pre>
from flask import request,render_template,session
import logging
import os
from datetime import datetime
import re
import string
import winreg

class Auditor():
    logger=None
    def __init__(self):
        
        fecha=datetime.now()
        fe=str(fecha.year)+str(fecha.month)+str(fecha.day)
        # print("** Inicia **")
        os.makedirs('/log/'+fe,exist_ok=True)
        logger = logging.getLogger('werkzeug')
        self.logger =logger 
        logging.basicConfig(format='%(asctime)s %(levelname)s %(message)s ',filename='/log/'+fe+'/login.log', encoding='utf-8',level=logging.WARNING)
        self.logger.setLevel(logging.WARNING  )
        # self.logger.warning("inicia")

    def logstart(self):
        return self.logger
    
    def registra(self,tipo,msg,usua="-"):
        client_ip = request.remote_addr
        if tipo==10:
            self.logger.debug(client_ip+' '+msg+' ['+usua+']')
        elif tipo==20:
            # print(client_ip+' '+msg+' '+usua)
            self.logger.info(client_ip+' '+msg+' '+usua)
        elif tipo==30:
            self.logger.warning(client_ip+' '+msg+' '+usua)
        elif tipo==40:
            # print(client_ip+' '+msg+' '+usua)
            self.logger.error(client_ip+' '+msg+' ['+usua+']')
        elif tipo==50:
            self.logger.critical(client_ip+' '+msg+' '+usua)
        elif tipo==60:
            self.logger.exception(client_ip+' '+msg+' '+usua)
</pre>
# DETECTOR DE SQL INJECTION
<pre>
class Utiles(Auditor):
    
    @classmethod
    def ConsistenciaClave(cs,datos):
            
            mayusculas = len([c for c in datos if c.isupper()])
            minusculas = len([c for c in datos if c.islower()])
            numeros = len([c for c in datos if c.isdigit()])
            canti=len(datos)
            
            espe=0
            caracteres = ['@', '#', '!', '*']
            for ca in datos:
                if ca not in string.ascii_letters and ca not in string.digits:
                    for char in caracteres:
                        cuenta = datos.count(char)
                        if cuenta:
                            espe+=1                
            print(f"datos={datos},mayusculas={mayusculas},minusculas={minusculas}, numeros={numeros}, longitud={canti},especiales={espe}")
            if mayusculas>=1 and minusculas>=1 and numeros>=1 and canti>=12 and espe>=1:
                return True
            else:
                return False
    @classmethod
    def Inyeccion(cs,dato,donde=" " ):
        Au=Auditor()
        patron=["--",';','union',"'"," or "," and ", "drop ",'1=1','1 = 1','"']
        for cadena in patron:
            resultado = re.search(cadena, dato.lower())   
            if resultado:
                 Au.registra(40,'Posible ataque de inyeccion sql ['+dato+'] '+donde)
                 return 'Posible ataque de inyeccion sql ['+dato+'] '+donde
        return 'x'  
    @classmethod
    def ValidaSesion(cs):
        if 'usuario' not in session or session['usuario'] is None:
            return True
        else:
            return False
</pre>
# REGISTRAR EN EL REGEDIT
<pre>
def RegEdInicio(clave,Valor):
    reg_key = winreg.CreateKey(winreg.HKEY_CURRENT_USER, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run")
    winreg.SetValueEx(reg_key, clave, 0, winreg.REG_SZ, Valor)
    winreg.CloseKey(reg_key)   
 
def RegEdCrea(clave, Valor):
    reg_key = winreg.CreateKey(winreg.HKEY_CURRENT_USER, r"SOFTWARE\InventaDB") 
    winreg.SetValueEx(reg_key, clave, 0, winreg.REG_SZ, Valor) 
    winreg.CloseKey(reg_key)
    return "Ok"

def getRegEd(clave):
    reg_key = winreg.OpenKey(winreg.HKEY_CURRENT_USER, r"SOFTWARE\InventaDB")
    valor, tipo = winreg.QueryValueEx(reg_key, clave)
    return valor                   
</pre>