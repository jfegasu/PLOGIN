
MYSQL={'MYSQL_HOST':'localhost',
'MYSQL_USER':'prueba',
'MYSQL_PASSWORD':'prueba',
'MYSQL_DB': 'hr'
}

SQLITE={
    'SQLITE_DB': 'hr'
}

DATABASE=MYSQL

def CargarBD(cual):
    MY=list(DATABASE.items())
    for i in range(len(MY)):
        cual[f"'{MY[i][0]}'"]=MY[i][1]