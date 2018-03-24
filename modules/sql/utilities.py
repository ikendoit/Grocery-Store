from modules.sql import establish

engine = establish.init()


def convert(result):
    return [dict(row) for row in result]


def query(string):
    try:
        return convert(engine.execute(string))
    except Exception as e:
        print(e)
        print("Query could not register.")


def execute(string):

    try:
        engine.execute(string)
    except Exception as e:
        print(e)
        print("Query could not register-2.")
