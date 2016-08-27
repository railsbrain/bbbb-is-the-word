"""
Routes and views for the flask application.
"""

import pyodbc, os
from datetime import datetime
from flask import render_template,url_for,request,redirect,session,flash
from FlaskWebProject import app


@app.route('/')
@app.route('/home')
def home():

    cnxn = pyodbc.connect('DRIVER={SQL Server};SERVER=%s;PORT=1433;DATABASE=%s;UID=%s;PWD=%s' % (os.getenv('SQL_ADR'), os.getenv('SQL_DTB'), os.getenv('SQL_USR'), os.getenv('SQL_PWD')))
    cursor = cnxn.cursor()
    cursor.execute("select * from wp_terms")
    row = cursor.fetchone()

    """Renders the home page."""
    return render_template(
        'index.html',
        title='Home Page',
        year=datetime.now().year,
        data=row
    )
    
    
@app.route('/awesome')
def awesome():
    """Renders awesome"""
    return render_template(
        'awesome.html',
        title='AWESOME',
    )