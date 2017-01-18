# [json对象持久化](http://www.jsonrpc.org/specification)
* [json介绍](http://www.json.org/json-zh.html)
```python
import json
import datetime
import collections


class Post:
    def __init__(self, date, title, rst_text, tags):
        self.date = date
        self.title = title
        self.rst_text = rst_text
        self.tags = tags

    def as_dict(self):
        return dict(
            date=str(self.date),
            title=self.title,
            underline='-'*len(self.title),
            rst_text=self.rst_text,
            tag_text=' '.join(self.tags),
        )


class Blog:
    def __init__(self, title, posts=None):
        self.title = title
        self.entries = posts if posts is not None else []

    def append(self, post):
        self.entries.append(post)

    def by_tag(self):
        tag_index = collections.defaultdict(list)
        for post in self.entries:
            for tag in post.tags:
                tag_index[tag].append(post.as_dict())
        return tag_index

    def as_dict(self):
        return dict(
            title=self.title,
            underline='=' * len(self.title),
            entries=[p.as_dict() for p in self.entries],
        )

    @staticmethod
    def blog_encode(something):
        if isinstance(something, datetime.datetime):
            return dict(
                __class__='datetime.datetime',
                __args__=[],
                __kw__=dict(
                    year=something.year,
                    month=something.month,
                    day=something.day,
                    hour=something.hour,
                    minute=something.minute,
                    second=something.second,
                )
            )
        elif isinstance(something, Post):
            return dict(
                __class__="Post",
                __args__=[],
                __kw__=dict(
                    date=something.date,
                    title=something.title,
                    rst_text=something.rst_text,
                    tags=something.tags,
                )
            )
        elif isinstance(something, Blog):
            return dict(
                __class__="Blog",
                __args__=[
                    something.title,
                    something.entries,
                ],
                __kw__=dict()
            )
        else:
            return json.JSONEncoder.default(something)

    @staticmethod
    def blog_decode(some_dict):
        if set(some_dict.keys()) == {"__class__", "__args__", "__kw__"}:
            class_ = eval(some_dict['__class__'])
            return class_(*some_dict['__args__'], **some_dict['__kw__'])
        else:
            return some_dict


def test_blog_main():
    travel = Blog('Travel')
    travel.append(
        Post(
            date=datetime.datetime(2013, 1, 1, 11, 12),
            title='Hard Aground',
            rst_text="""Some embarraseing revelation.Includeing ? and ?""",
            tags=('#RedRanger', '#Whitby42', '#ICW'),
        )
    )
    travel.append(
        Post(
            date=datetime.datetime(2013, 2, 2, 22, 22),
            title='Anchor Follies',
            rst_text="""Some witty epigram.Includeing ? and ?""",
            tags=('#RedRanger', '#Whitby42', '#Mistakes'),
        )
    )
    text = json.dumps(travel, indent=4, default=Blog.blog_encode)
    blog_obj = json.loads(text, object_hook=Blog.blog_decode)
    with open('tmp.json', 'w', encoding='utf-8') as target:
        json.dump(travel,target, indent=4, default=Blog.blog_encode)
    with open('tmp.json','r', encoding='utf-8') as t:
        obj = json.load(t, object_hook=Blog.blog_decode)
        print(obj.title)

```