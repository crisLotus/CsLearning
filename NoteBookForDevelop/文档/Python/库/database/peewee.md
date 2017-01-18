[peewee github](https://github.com/coleifer/peewee)

[peewee讲的非常清楚](http://zhujunwu.cn/peewee-quickstart/)
# 建立 models
'''
from peewee import *
from playhouse.sqlite_ext import SqliteExtDatabase
import datetime

db = SqliteExtDatabase('my_database.db')

class BaseModel(Model):
    class Meta:
        database = db

class User(BaseModel):
    username = CharField(unique=True)

class Tweet(BaseModel):
    user = ForeignKeyField(User, related_name='tweets')
    message = TextField()
    created_date = DateTimeField(default=datetime.datetime.now)
    is_published = BooleanField(default=True)

db.connect()
db.create_tables([Person, Pet])
'''

# insert:

'''
User.create(username='charlie')  <=>  

>>> uncle_bob = Person(name='Bob', birthday=date(1960, 1, 15), is_relative=True)
>>> uncle_bob.save() # bob is now stored in the database
1
'''

# del
'''
herb_mittens.delete_instance() <=>

>>> user = User.get(User.id == 1)
>>> user.delete_instance()  # Returns the number of rows deleted.
1
>>> User.get(User.id == 1)
UserDoesNotExist: instance matching query does not exist:
SQL: SELECT t1."id", t1."username" FROM "user" AS t1 WHERE t1."id" = ?
PARAMS: [1]


>>> query = Tweet.delete().where(Tweet.creation_date < one_year_ago)
>>> query.execute()  # Returns the number of rows deleted.
7
'''

# update



'''
>>> grandma.name = 'Grandma L.'
>>> grandma.save()  # Update grandma's name in the database.
1		<=>


>>> today = datetime.today()
>>> query = Tweet.update(is_published=True).where(Tweet.creation_date < today)
>>> query.execute()  # Returns the number of rows that were updated.
4

>>> subquery = Tweet.select(fn.COUNT(Tweet.id)).where(Tweet.user == User.id)
>>> update = User.update(num_tweets=subquery)
>>> update.execute()
'''

# query
'''
1. grandma = Person.select().where(Person.name == 'Grandma L.').get() <=>
	grandma = Person.get(Person.name == 'Grandma L.')


'''


