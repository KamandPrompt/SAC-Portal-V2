from flask import Flask, render_template, redirect, request, session, url_for, flash
import pymongo

# making a flask server
app = Flask(__name__)

# making a client
client = pymongo.MongoClient("localhost", 27017)
db = client['sac_portal'] # sac_portal database 
userInfo = db['auth'] # collection containing the authentication data

# initializing the notification and error data in session variable
session['err'] = ""; session['noti'] = ""
 
# root route
@app.route('/')
def goToHome():
    if("logged_in" in session): return redirect(url_for("dashboard"))
    return redirect(url_for("home"))

@app.route('/home')
def home():
    if("logged_in" in session):
        return redirect (url_for("dashboard"))
    return render_template("home.html", session = session)

@app.route('/login')
def login():
    if("logged_in" in session):
        session['noti'] = "already logged in"
        return redirect(url_for("dashboard"))

    return render_template("loginPage.html", session = session)

@app.route("/submit", methods = ['post'])
def submit():
    if("logged_in" in session):
        session['noti'] = ""
        return redirect(url_for("dashboard"))
        
    user_name = request.form['username']
    user_pass = request.form['password']

    # empty data will be handled to the client side by script

    # storing the data from the database in user_data if it exists
    exist_status = 0 # will be used to see whether the data exist or not
    user_data = userInfo.find_one({"username":user_name, "password":user_pass})
    for inf in user_data:
        user_data = inf
        exist_status = 1

    if(exist_status == 0):
        session['err'] = "No user with the given credential"
        return redirect(url_for('login'))
    
    session['noti'] = "logged in successfully"; session['err'] = ""; session['logged_in'] = True
    session['user_data'] = {"username": user_data['username'], "password": user_data['password'], "email":user_data['email']}
    return redirect(url_for("dashboard"))

@app.route("/dashboard")
def dashboard():
    if("logged_in" in session):
        return render_template("dashboard.html", session = session)
    return redirect(url_for("home"))

@app.route('/register')
def register():
    if("logged_in" in session):
        session['noti'] = "you are already registered"; session['err'] = ""
        return redirect(url_for("dashboard"))
    return render_template("register.html", session = session)

@app.route("/submit_reg", methods = ['post'])
def submit_reg():
    user_name = request.form['username']
    user_pass = request.form['password']
    user_email = request.form['email']

    # checking if the username exist already in the database
    found_status = 0
    for it_ in userInfo.find_one({"username":user_name}):
        found_status = 1
    if(found_status): 
        session['err'] = "username already exist"
        return redirect(url_for("register"), session = session)

    # checking if the email exist already in the database
    found_status = 0
    for it_ in userInfo.find_one({"email": user_email}):
        found_status = 1
    if(found_status):
        session['err'] = "email already registered"
        return redirect(url_for("register"), session = session)

    # inserting the new data to database
    if userInfo.insert_one({"username":user_name, "password":user_pass, "email":user_email}):
        session['noti'] = "Successfully registered"; session['err'] = ""
        session['logged_in'] = True
        session['user_data'] = {"username":user_name, "password":user_pass, "email":user_email}
        return redirect(url_for("dashboard"))
    else :
        session['err'] = "unknown error ;) please try after sometime"; session['noti'] = ""
        return redirect(url_for("register"))

@app.route('/logout')
def logout():
    if("logged_in" in session):
        session.pop("logged_in"); session.pop("user_data")
        session['noti'] = "logged out successfully"; session['err'] = ""
        return redirect(url_for("home"))
    else :
        session['noti'] = "you are already logged out"; session['err'] = ""
        return redirect(url_for("home"))

# running the server
if __name__ == "__main__":
    app.run(debug=True)