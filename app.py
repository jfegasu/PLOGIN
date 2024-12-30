from flask import Flask,session, jsonify,request,render_template,redirect,url_for
import json
from flask_mysqldb import MySQL
from utils.Utilitarios import Auditor,Utiles
from datetime import datetime,timedelta
from databases.databases import *

# CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin'
# SET PASSWORD for 'admin'@'localhost' = PASSWORD('admin')
# CREATE USER 'prueba'@'localhost' IDENTIFIED BY 'prueba'
# GRANT ALL PRIVILEGES ON hr.* TO admin
# CREATE USER 'jgalindos' IDENTIFIED BY 'prueba1234'
# GRANT SELECT ON hr.regions to jgalindos
# SET PASSWORD for 'jgalindos' = PASSWORD('prueba1234')




app=Flask(__name__)
# app.config['SECRET_KEY'] = "akDFJ34mdfsYMH567sdf" # this must be set in order to use sessions
app.config['PERMANENT_SESSION_LIFETIME'] =   timedelta(minutes=5)
app.secret_key = 'akDFJ34mdfsYMH567sdf'
CargarBD(app.config)
mysql = MySQL(app)

Au=Auditor()

@app.route("/")
def Raiz():
    session['usuario']='prueba'    
    fecha=datetime.now()
    fe=str(fecha.year)+str(fecha.month)+str(fecha.day)
    
    return render_template("login.html")
@app.route("/v",methods=['POST'])
def Raiz1():
    if request.method == 'POST':
        usua = request.form.get('usua')
        pw = request.form.get('pw')
        Utiles.Inyeccion(usua,'usuario')
        Utiles.Inyeccion(pw,'clave')
        # if not Utiles.ConsistenciaClave(pw):
        #     print("No cumple")
      
        if not usua=="root":
            print("-->",usua)
        else:
            msgito="NO SE PUEDE UTILIZAR EL USUARIO ROOT"
            regreso="/" 
            Au.registra(30,msgito,'')       
            return render_template("alerta.html", msgito=msgito,regreso=regreso)

        try:
            # app.config['MYSQL_HOST'] = 'localhost'
            app.config['MYSQL_USER'] = usua
            app.config['MYSQL_PASSWORD'] = pw
            # app.config['MYSQL_DB'] = 'hr'
            cur = mysql.connection.cursor()
            
            msgito="BIENVENIDO"
            regreso="/paso1"
            Au.registra(30,msgito,usua )
            return render_template("alerta.html", msgito=msgito,regreso=regreso)
        except Exception as e:
            msgito="USUARIO O CREDENCIALES NO VALIDOS"
            regreso="/"
            print(str(e))
            usua=''
            Au.registra(40,msgito,app.config['MYSQL_USER'])
            
            return render_template("alerta.html", msgito=msgito,regreso=regreso)
    session.permanent = True
    session['usuario'] = usua
    return usua

@app.route("/paso1")
def Paso1():
    try:
        cur = mysql.connection.cursor()
        return render_template("paso1.html")
    except Exception as e:
        msgito="NO HA VALIDADO CREDENCIALES <paso1>"
        regreso="/"
        # logger.error('ERROR: '+msgito+' ')
        Au.registra(40,msgito,'')
        return render_template("alerta.html", msgito=msgito,regreso=regreso)


@app.route("/cpw")
def cpwd():
    if Utiles.ValidaSesion():
        msgito="SESION CADUCADA"
        regreso="/" 
        Au.registra(40,msgito,'')       
        return render_template("alerta.html", msgito=msgito,regreso=regreso)
    else:
        Au.registra(30,'Ingresa a cambiar clave','') 
        return render_template("clogin.html")
@app.route("/cpw1",methods=['POST'])
def cpwd1():
    try:
         
        if request.method == 'POST':
            pw1 = request.form.get('pw1')
            app.config['MYSQL_PASSWORD'] = pw1
            cur = mysql.connection.cursor()
    except Exception as e:
        msgito="CLAVE ANTERIOR NO COINCIDE <CPWD>"
        regreso="/" 
        Au.registra(40,msgito,'')       
        return render_template("alerta.html", msgito=msgito,regreso=regreso)
    
    
    if request.method == 'POST':
        pw2 = request.form.get('pw2')
        pw3 = request.form.get('pw3')
        if pw2 == pw3:
            pass
            # app.config['MYSQL_PASSWORD'] = pw1
            # cur = mysql.connection.cursor()
            # msgito="OK  <CPWD>"
            # regreso="/"        
            # return render_template("alerta.html", msgito=msgito,regreso=regreso)
        else:
            msgito="LAS NUEVAS CLAVES NO COINCIDEN"
            regreso="/" 
            Au.registra(40,msgito,'')       
            return render_template("alerta.html", msgito=msgito,regreso=regreso)
    if request.method == 'POST':
        pw2 = request.form.get('pw2')
        pw3 = request.form.get('pw3')
        usua = request.form.get('usua')
        if pw1==pw2:
            msgito="LA CLAVE NUEVA NO PUEDE SER LA ANTERIOR"
            regreso="/" 
            Au.registra(40,msgito,'')       
            return render_template("alerta.html", msgito=msgito,regreso=regreso)
        
    if not Utiles.ConsistenciaClave(pw2):
        msgito="Error: No cumple con las condiciones:\nAl menos debe haber Una Mayuscula, \nUn numero, Una minuscula,\n un caracter especial,\n una longitud minima de 12 caracteres"
        regreso="/"
        Au.registra(40,msgito,'')
        return render_template("alerta.html", msgito=msgito,regreso=regreso)
    
                    
    try:
        cur = mysql.connection.cursor()
        usua=app.config['MYSQL_USER']
        pwx=app.config['MYSQL_PASSWORD']
        print(usua)
        # GRANT ALTER, UPDATE ON hr.* TO jgalindos;
        # cur.callproc('ChangeUserPassword',[usua,pw2])
        sql=f"set password for '{usua}'@'localhost' = PASSWORD('{pw2}') "
        # sql1=([usua,pw2])
        # print(usua,pw2,sql)
        cur.execute(sql)
        mysql.connection.commit()
        msgito="CAMBIO SATISFACTORIO DE CLAVE "
        regreso="/"
        Au.registra(30,msgito,usua)
        return render_template("alerta.html", msgito=msgito,regreso=regreso)
        
    except Exception as e:
        msgito="FALLO CAMBIO DE CLAVE"
        regreso="/"
        Au.registra(40,msgito,'')
        return render_template("alerta.html", msgito=msgito,regreso=regreso)

@app.route("/region")
def Region():
    if Utiles.ValidaSesion():
        msgito="SESION CADUCADA"
        regreso="/" 
        Au.registra(40,msgito,'')       
        return render_template("alerta.html", msgito=msgito,regreso=regreso)
    else:
        try:
            cur = mysql.connection.cursor()
            cur.execute("select * from regions")
            cadena=cur.fetchall()

            Au.registra(30,'Ingresa a regions ',app.config['MYSQL_USER'])
            
            return render_template("region.html",cadena=cadena)
        except Exception as e:
            msgito="NO TIENE ACCESO <region>"
            regreso="/paso1"
            Au.registra(40,msgito,'')
            
            return render_template("alerta.html", msgito=msgito,regreso=regreso) 
@app.route("/pais")
def Pais():
    if Utiles.ValidaSesion():
        msgito="SESION CADUCADA"
        regreso="/" 
        Au.registra(40,msgito,'')       
        return render_template("alerta.html", msgito=msgito,regreso=regreso)
    else:    
        try:
            cur = mysql.connection.cursor()
            cur.execute("select * from countries c join regions r using(region_id)")
            cadena=cur.fetchall()

            Au.registra(30,'Ingresa a couuntries ',app.config['MYSQL_USER'])
            
            return render_template("pais.html",cadena=cadena)
        except Exception as e:
            msgito="NO TIENE ACCESO <pais>"
            regreso="/paso1"
            Au.registra(40,msgito,'')
            
            return render_template("alerta.html", msgito=msgito,regreso=regreso) 
@app.route('/logout')
def logout():
    session.clear()
    app.config['MYSQL_USER'] = 'prueba'
    app.config['MYSQL_PASSWORD'] = 'prueba'
    msgito="SALIENDO DE LA SESION......"
    regreso="/"
    Au.registra(30,msgito,'')
    return render_template("alerta.html", msgito=msgito,regreso=regreso) 
    

if __name__=='__main__':
    app.run(debug=True,port=8000,host='0.0.0.0')