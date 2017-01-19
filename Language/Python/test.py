#! -*- coding:utf-8 -*-
import shelve


class Blog:
    """

    Usage:

        >>> b1 = Blog('Travel Blog')
        >>> shelf = shelve.open('data/blog', 'n')
        >>> b1._id = 'Blog:1'
        >>> b1._id
        'Blog:1'
        >>> shelf[b1._id] = b1
        >>> shelf.close()
        >>> shelf = shelve.open('data/blog', 'w')
        >>> shelf['Blog:1']._id
        'Blog:1'

    """

    def __init__(self, title, *posts):
        self.title = title

    def as_dict(self):
        return dict(
            title=self.title,
            underline='='*len(self.title),
        )


def main():
    if True:
        t = 'aaaa'
    print('test.asdf'.split())


if __name__ == '__main__':
    import doctest
    doctest.testmod()
    main()
