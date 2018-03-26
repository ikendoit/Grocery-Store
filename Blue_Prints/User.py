from flask import Flask, render_template, request, url_for, session, redirect, jsonify, Blueprint

userer = Blueprint("userpages", __name__, template_folder="templates");

@userer.route("/")
def index():
    return render_template("index.html", user=(session["info"] if "info" in session else None))


@userer.route("/profile/", methods=["GET"])
def profile():
    return render_template("profile.html",
                           user=(session["info"] if "info" in session else None))


@userer.route("/contact/")
def contact():
    return render_template("contact.html",
                           user=(session["info"] if "info" in session else None))


@userer.route("/about/")
def about():
    return render_template("about.html",
                           user=(session["info"] if "info" in session else None))


@userer.route("/login/")
def login():
    return render_template("login.html")


@userer.route("/signup/")
def signup():
    return render_template("signup.html")
