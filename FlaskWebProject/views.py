import os
from datetime import datetime
from flask import render_template,url_for,request,redirect,session,flash
from FlaskWebProject import app
from azure.storage.queue import QueueService

queue_service = QueueService(account_name=os.getenv('storageAccount'), account_key=os.getenv('storageKey'))
queue_service.create_queue('dddd')

@app.route('/', methods=['get','post'])
def home():

    #cnxn = pyodbc.connect('DRIVER={SQL Server};SERVER=%s;PORT=1433;DATABASE=%s;UID=%s;PWD=%s' % (os.getenv('SQL_ADR'), os.getenv('SQL_DTB'), os.getenv('SQL_USR'), os.getenv('SQL_PWD')))
    #cursor = cnxn.cursor()

    if request.method == "POST":
        data = request.form['data']
        cursor.execute("insert into DataTable(symbol) values (?)", data)
        cnxn.commit()
        cursor.execute("select * from DataTable")
        row = cursor.fetchall()
        return render_template(
            'index.html',
            title='Home Page',
            year=datetime.now().year,
            data=row
        )

    #cursor.execute("select * from DataTable")
    #row = cursor.fetchall()
    row = 'row'

    return render_template(
        'index.html',
        title='Home Page',
        year=datetime.now().year,
        data=row
    )