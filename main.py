from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug import secure_filename
from flask_mail import Mail
import json
import os
import math
from datetime import datetime


with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params["upload_location"]
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD = params['gmail-password']
)
mail = Mail(app)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Contacts(db.Model):
    
    srno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    mes = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)

class Posts(db.Model):

    srno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    subheading = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(20), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)


@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_post']))
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_of_post']): (page-1)*int(params['no_of_post'])+int(params['no_of_post'])]

    if(page==1):
        prev = "#"
        next = "/?page="+ str(page+1)
    elif(page==last):
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', params=params, posts=posts, next=next, prev=prev)

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/login')

@app.route("/delete/<string:srno>", methods=['GET', 'POST'])
def Delete(srno):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.filter_by(srno=srno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')



@app.route("/about")
def about():
    return render_template('about.html', params=params)

@app.route("/upload" , methods = ['GET', 'POST'])
def upload():
    if ('user' in session and session['user'] == params['admin_user']):
         if (request.method == 'POST'):
             f = request.files['file1']
             f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
             return "Uploaded Successfully"



@app.route("/online")
def online():
    return render_template('online.html', params=params)
    # if __name__ == '__main__':
    #     if __name__ == '__main__':
    #         import requests
    #         import json
    #         url = ('https://newsapi.org/v2/top-headlines?'
    #                'sources=bbc-sport&'
    #                'apiKey=22a1c774386d4ea48cd7344a8a2a3e95')
    #
    #         response = requests.get(url)
    #         text = response.text
    #         my_json = json.loads(text)
    #         for i in range(1, 11):
    #
    #             print(my_json['articles'][i]['title'])





@app.route("/login", methods=['GET', 'POST'])
def dashboard():
    if ('user' in session and session['user'] == params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)


    if request.method=='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if(username == params['admin_user'] and userpass == params['admin_password']):
           session['user'] = username
           posts = Posts.query.all()
           return render_template('dashboard.html', params=params, posts=posts)



    return render_template('login.html', params=params)

@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)

@app.route("/edit/<string:srno>", methods=['GET', 'POST'])
def edit(srno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == 'POST':
            title = request.form.get('title')
            subheading = request.form.get('subheading')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if srno=='0':
                post = Posts(title=title, subheading=subheading,
                             slug=slug, content=content, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(srno=srno).first()
                post.title = title
                post.subheading = subheading
                post.slug = slug
                post.content = content
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/'+srno)
        post = Posts.query.filter_by(srno=srno).first()
        return render_template('edit.html', params=params, post=post, srno=srno)

@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, email = email, phone_num = phone, mes = message, date= datetime.now() )
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from Blog', sender=email,
                          recipients= [params['gmail-user']],
                          body = message + "\n" + phone)
    return render_template('contact.html', params=params)


app.run(debug=True)