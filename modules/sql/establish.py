from sqlalchemy import create_engine


def init():
    try:
        return create_engine('mysql+pymysql://root:123456@localhost:3306/grocery', pool_recycle=3000)
    except Exception as e:
        print("error connecting to MySQL: ")
        print(e)

