from peewee import *

database = MySQLDatabase('test_juan_db', **{'host': 'localhost', 'port': 3306, 'user': 'admin', 'password': 'admin'})

class UnknownField(object):
    def __init__(self, *_, **__): pass

class BaseModel(Model):
    class Meta:
        database = database

class Users(BaseModel):
    id = CharField(primary_key=True)
    username = CharField()
    password = CharField()
    reg_time = DateTimeField(null=True)

    class Meta:
        db_table = 'users'

class Text(BaseModel):
    blog = CharField(db_column='blog_id')
    text = TextField(null=True)
    user = ForeignKeyField(db_column='user_id', rel_model=Users, to_field='id')

    class Meta:
        db_table = 'text'
        indexes = (
            (('user', 'blog'), True),
        )
        primary_key = CompositeKey('blog', 'user')

