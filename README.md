# PROYECTO PLOGIN
![LOGO](LOGO.png)
---
## RUTAS (ENDPOINT)
|ENDPOINT|NOMBRE|REDIRECCIONA|MENSAJE|
|:---|:--|:--|:---|
| / |RAIZ 127.0.0.1:5000| login.htm|
| /v | VALIDA INGRESO| /paso1| BIENVENIDO|
|||/|NO SE PUEDE UTILIZAR EL USUARIO ROOT|
|||/|USUARIO O CREDENCIALES NO VALIDOS|
| /paso1 | MUESTRA OPCIONES| / |NO HA VALIDADO CREDENCIALES <paso1>| 
| /cpw  |CONTRASEÑA|clogin.html [/cpw1]|
| /cpw1 | CAMBIO DE CONTRASEÑA|/| --- CAMBIO SATISFACTORIO DE CLAVE|
|||/|CLAVE ANTERIOR NO COINCIDE <CPWD>|
|||/|LAS NUEVAS CLAVES NO COINCIDEN|
|||/|LA CLAVE NUEVA NO PUEDE SER LA ANTERIOR|
|||/|Error: No cumple con las condiciones:\nAl menos debe haber Una Mayuscula, \nUn numero, Una minuscula,\n un caracter especial,\n una longitud minima de 12 caracteres|
|||/|FALLO CAMBIO DE CLAVE|
|/region|REGIONES|region.html|
|||/|SESION CADUCADA|
|||/paso1|NO TIENE ACCESO <region>|
|/pais|PAISES|pais.html|
|||/|SESION CADUCADA|
|||/paso1|**NO TIENE ACCESO <region>**|
---
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

<center><img src="mct.png"></center>

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
# ENVIAR CORREO
[INSTRUCCIONES GMAIL](https://es.stackoverflow.com/questions/539447/envio-autom%C3%A1tico-de-correos-con-python-y-smtp-actualizaci%C3%B3n-junio-2022)
<pre>
def EnviaCorreo(Para,Asunto,Cuerpo):
    clave=getRegEd('pwd')
    msg = EmailMessage()
    
    msg['Subject'] = Asunto
    msg['From'] = 'jfegasu@gmail.com'
    msg['To'] = Para
    
    msg.set_content(Cuerpo)
    with smtplib.SMTP_SSL('smtp.gmail.com', 465) as smtp:
        smtp.login('jfegasu@gmail.com', clave)
        smtp.send_message(msg)

def CorreosHTML(Para,Asunto,Cuerpo):
    smtp_server = 'smtp.gmail.com'
    smtp_port = 587
    password=getRegEd('pwd')
    msg = MIMEMultipart('alternative')
    username='jfegasu@gmail.com'
    msg['Subject'] = Asunto
    msg['From'] = username
    msg['To'] = Para
    
    html = """
<html>
  <body>
    <div style="width:100%;overflow:auto" class="w3-w3-green mx-auto">
      <img loading="lazy" class="tabla" src="https://blogger.googleusercontent.com/img/a/AVvXsEimdqxynaYJeDRuTUp3lzEWFnnQSC2KTVSxvnV70I2eZ5tOCfjwdNnExSTSm2tCf1xBFHVHwsN80OCpDCO0J80UTNWxPC86s7s5aB8rnizg7guNowqTxhr5Fd9WH48n7pn8uLZNFTgXuSGUH6BNncmfQEpOz9pAe_T0zD8n2-aGZk8-C_l6GWk-aq60fQ=s960" style="border:true;width:95%;border-color:black;height:100px;"><br>
    </div>"""+Cuerpo+""" <br><br><br>
    <div   style="background-color:green; color:white;padding: 15px 0px 15px 60px;"><b>Servicio Nacional de Aprendizaje SENA - Centro de Gestión de Mercados, Logística y Tenologías de la Información - Regional Distrito Capital <br />Dirección: Cl 52 N&#176; 13 65 -Telefono: +(57) 601 594 1301<br />Conmutador Nacional (601) 5461500 - Extensiones <br /> El SENA brinda a la ciudadanía, atención presencial en las 33 Regionales y 117 Centros de Formación
 <br />Atención al ciudadano: Bogotá (601) 3430111 - Línea gratuita y resto del país 018000 910270 <br />Atención al empresario: Bogotá (601) 3430101 - Línea gratuita y resto del país 018000 910682</p></div>
  </body>
</html>
"""
    msg.attach(MIMEText(html, 'html'))

# Enviar el correo
    try:
        server = smtplib.SMTP(smtp_server, smtp_port)
        server.starttls()
        server.login(username, password)
        server.sendmail(msg['From'], msg['To'], msg.as_string())
        server.quit()
        print("Correo enviado exitosamente")
    except Exception as e:
        print(f"Error al enviar el correo: {e}")      
</pre>

[FUENTE](https://github.com/jfegasu/PLOGIN/blob/main/utils/Utilitarios.py)

# TABLAS ORM DE HR 

<pre>
from peewee import Model, CharField, IntegerField, TextField, ForeignKeyField, DateTimeField, SqliteDatabase,AutoField
from peewee import MySQLDatabase
from databases import *
from flask import session
import datetime as dt

db = MySQLDatabase('mi_base_de_datos', user='root', password='mi_contraseña', host='localhost', port=3306)

class Region(Model):
    region_id = IntegerField(primary_key=True)
    region_name = CharField(null=True)

    class Meta:
        database = db

class Country(Model):
    country_id = CharField(primary_key=True, max_length=2)
    country_name = CharField(null=True)
    region = ForeignKeyField(Region, backref='countries')

    class Meta:
        database = db

# Tabla Locations
class Location(Model):
    location_id = AutoField(primary_key=True)
    street_address = CharField(null=True)
    postal_code = CharField(null=True)
    city = CharField()
    state_province = CharField(null=True)
    country = ForeignKeyField(Country, backref='locations')

    class Meta:
        database = db

# Tabla Jobs
class Job(Model):
    job_id = CharField(primary_key=True, max_length=10)
    job_title = CharField()
    min_salary = DecimalField(max_digits=8, decimal_places=0, null=True)
    max_salary = DecimalField(max_digits=8, decimal_places=0, null=True)

    class Meta:
        database = db

# Tabla Employees
class Employee(Model):
    employee_id = AutoField(primary_key=True)
    first_name = CharField(null=True)
    last_name = CharField()
    email = CharField()
    phone_number = CharField(null=True)
    hire_date = DateField()
    job = ForeignKeyField(Job, backref='employees')
    salary = DecimalField(max_digits=8, decimal_places=2)
    commission_pct = DecimalField(max_digits=2, decimal_places=2, null=True)
    manager = ForeignKeyField('self', null=True, backref='subordinates')  # Auto-relación para el manager
    department_id = ForeignKeyField('Department', backref='employees', null=True)

    class Meta:
        database = db

# Tabla Departments
class Department(Model):
    department_id = AutoField(primary_key=True)
    department_name = CharField()
    manager = ForeignKeyField(Employee, null=True, backref='managed_departments')
    location = ForeignKeyField(Location, null=True, backref='departments')

    class Meta:
        database = db

# Tabla JobHistory
class JobHistory(Model):
    employee = ForeignKeyField(Employee, backref='job_histories')
    start_date = DateField()
    end_date = DateField()
    job = ForeignKeyField(Job, backref='job_histories')
    department = ForeignKeyField(Department, backref='job_histories')

    class Meta:
        database = db
        indexes = (
            (('employee', 'start_date'), True),  # Asegura que el par (employee_id, start_date) sea único
        )
if __name__ == '__main__':
    DATABASE.connect()  # Conectar a la base de datos
    app.run(debug=True, port=8000, host='0.0.0.0')
</pre>
## CREAR TABLAS EN LA BASE DE DATOS
<pre>
python modelosorm.py
</pre>
# DIAGRAMA GANT
<pre>
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from datetime import datetime

# Datos de las tareas en orden inverso
tareas = [
    ("Pruebas de sotware", "18/11/2023", "30/11/2023"),
    ("EndPoint aplicación", "11/11/2023", "17/11/2023"),
    ("Modelo Físico", "4/11/2023", "10/11/2023"),
    (" Modelo Relacional", "27/10/2023", "3/11/2023"),
    ("Mockups", "4/11/2023", "11/11/2023"),
    ("Documentación casos de uso", "1/11/2023", "22/11/2023"),
    ("Diagrama casos de uso", "26/10/2023", "31/10/2023"),  # Fecha de término fija
    ("Modelo de robustez", "22/10/2023", "25/10/2023"),
    ("Analisis de historias de usuarios", "11/10/2023", "21/10/2023"),
    ("Levantamiento de inFormación", "6/10/2023", "10/10/2023"), 
    ]

# Fechas de inicio y término del proyecto
inicio_proyecto = datetime.strptime("6/10/2023", "%d/%m/%Y")
fin_proyecto = datetime.strptime("30/11/2023", "%d/%m/%Y")

# Función para convertir la fecha en formato de cadena a objeto datetime
def convert_date(date_str):
    return datetime.strptime(date_str, "%d/%m/%Y")

# Extraer las fechas de inicio y término
inicio = [convert_date(t[1]) for t in tareas]
termino = [convert_date(t[2]) for t in tareas]
tarea_names = [t[0] for t in tareas]

# Crear la gráfica de Gantt con un estilo personalizado
fig, ax = plt.subplots(figsize=(10, 6))
ax.xaxis.set_major_locator(mdates.WeekdayLocator(byweekday=mdates.MO))  # Etiquetas semanales
ax.xaxis.set_major_formatter(mdates.DateFormatter("%U"))  # Solo número de semana del año

# Establecer orientación vertical en el eje x para las etiquetas de fechas
ax.tick_params(axis='x', rotation=0)  # Sin rotación

for i, tarea in enumerate(tarea_names):
    ax.barh(tarea, left=inicio[i], width=termino[i] - inicio[i], color='lightblue', edgecolor='gray')

    # Agregar fecha de término encima de la barra
    ax.text(termino[i], i, termino[i].strftime("%d/%m/%Y"), va='center', ha='left', fontsize=10, fontweight='bold')

# Calcular y agregar hitos dentro del cronograma
for i, (inicio_tarea, tarea) in enumerate(zip(inicio, tarea_names)):
    if inicio_tarea == inicio_proyecto:
        ax.plot(inicio_tarea, i, marker='o', markersize=8, color='red', label='Inicio del Proyecto', linestyle='None')
    if inicio_tarea == convert_date("12/11/2023"):  # Fecha de término de desarrollo en Primavera P6
        ax.plot(inicio_tarea, i, marker='o', markersize=8, color='purple', label='Desarrollo Cronograma en Primavera P6', linestyle='None')

# Agregar el hito de término del proyecto
ax.plot(fin_proyecto, tarea_names.index("Pruebas de sotware"), marker='o', markersize=8, color='green', label='Fin del Proyecto', linestyle='None')

plt.ylabel("Etapas")
plt.title("Diagrama de Gantt - Programa de Trabajo Fábrica de SoFtware", fontsize=14, fontweight='bold')

# Personalización adicional
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

# Etiqueta en el eje de abajo
ax.set_xlabel("Semanas 2023")

# Agregar leyenda en la esquina superior derecha
plt.legend(loc='upper right', title='Hitos')

plt.tight_layout()
plt.show()
</pre>
<hr>
<img src="gant.png">