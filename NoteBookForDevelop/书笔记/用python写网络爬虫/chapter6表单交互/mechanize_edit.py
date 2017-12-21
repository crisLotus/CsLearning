# -*- coding: utf-8 -*-
import mechanicalsoup

# TODO: 想扩展mechanicalsoup，使之可以获得Form的value

COUNTRY_URL = 'http://example.webscraping.com/places/default/edit/Afghanistan-1'
LOGIN_EMAIL = 'test@qq.com'
LOGIN_PASSWORD = 'test'
LOGIN_URL = 'http://example.webscraping.com/places/default/user/login'


def mechanize_edit():
    """Use mechanize to increment population
    """
    # login
    br = mechanicalsoup.StatefulBrowser(
        soup_config={'features': 'lxml'},
        raise_on_404=True,
        user_agent='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36',
    )
    br.open(LOGIN_URL)
    br.select_form('form')
    print(br.get_current_form().print_summary())
    br['email'] = LOGIN_EMAIL
    br['password'] = LOGIN_PASSWORD
    response = br.submit_selected()

    br.launch_browser()


if __name__ == '__main__':
    mechanize_edit()
