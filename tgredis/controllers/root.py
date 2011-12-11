# -*- coding: utf-8 -*-
"""Main Controller"""

from tg import expose
from tgredis.lib.base import BaseController
from tgredis.controllers.error import ErrorController

__all__ = ['RootController']

class RootController(BaseController):
    """
    The root controller for the tg-redis application.

    All the other controllers and WSGI applications should be mounted on this
    controller. For example::

        panel = ControlPanelController()
        another_app = AnotherWSGIApplication()

    Keep in mind that WSGI applications shouldn't be mounted directly: They
    must be wrapped around with :class:`tg.controllers.WSGIAppController`.

    """

    error = ErrorController()

    @expose('tgredis.templates.index')
    def index(self):
        """Handle the front-page."""
        return dict(page='index')

