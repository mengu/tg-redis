# -*- coding: utf-8 -*-
"""Main Controller"""

from tg import expose
from tgredis.lib.base import BaseController
from tgredis.controllers.error import ErrorController
from urllib2 import urlopen
import json
import redis

__all__ = ['RootController']

redis_instance = redis.StrictRedis()

class RootController(BaseController):

    error = ErrorController()

    @expose('tgredis.templates.index')
    def index(self, feed=None):
        """Handle the front-page."""
        page = feed.capitalize() if feed else 'index'
        feeds_list = self._get_feed(feed)
        return dict(page=page, feeds_list=feeds_list)

    def _get_feed(self, feed):
        redis_key = "reddit_feed_%s" % feed
        feeds = redis_instance.get(redis_key)
        if not feeds:
            feeds = urlopen("http://www.reddit.com/r/%s.json?limit=10" % feed).read()
            redis_instance.setex(redis_key, 60, feeds)
        return json.loads(feeds)


