# -*- coding: utf-8 -*-
"""Setup the tg-redis application"""

import logging
from tg import config
from tgredis import model
import transaction

def bootstrap(command, conf, vars):
    """Place any commands to setup tgredis here"""

    # <websetup.bootstrap.before.auth

    # <websetup.bootstrap.after.auth>
