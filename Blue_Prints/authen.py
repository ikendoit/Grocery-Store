from flask import Flask, render_template, request, url_for, session, redirect, Blueprint

from modules.sql import Login

authenter = Blueprint("authen",__name__, template_folder="templates");

@authenter.route("/login", methods=["POST"])
def loginPOST():
    # authenticate user
    if request.form["name"] != "" and request.form["id"] != "":

        info = Login.login_user(request.form["name"], request.form["id"])

        #set user session
        if len(info) > 0:
            session["user"] = request.form["name"]
            session["info"] = info[0]
            return redirect(url_for("index"))

    return render_template("login.html",
                           message="Invalid Name or ID")

@authenter.route("/logout", methods=["POST"])
def logout():
    session.pop("info",None);
    return redirect(url_for("login"));
