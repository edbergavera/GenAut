#!/usr/bin/python
import sys, os
from django.core.handlers import wsgi
import site

# Add project root to PYTHONPATH
sys.path.append('/home/geniuspart/public_html/')
# Add virtualenv packages
site.addsitedir('/home/geniuspart/public_html/venv/lib/python2.7/site-packages')
# Set up django settings
os.environ['DJANGO_SETTINGS_MODULE'] = "gap.settings"
# Activate your virtual env
activate_env = os.path.expanduser("/home/geniuspart/public_html/venv/bin/activate_this.py")
execfile(activate_env, dict(__file__=activate_env))
# Init application instance of WSGI
application = wsgi.WSGIHandler()
