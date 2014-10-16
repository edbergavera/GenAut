#!/usr/bin/python
import sys, os
#sys.path.insert(0, "/home/geniuspart/public_html/lib/python")
#sys.path.insert(0, "/home/geniuspart/public_html/gapenv/gap")
#sys.path.insert(0, "/home/geniuspart/public_html/genius")
#os.chdir("/home/geniuspart/public_html/gapenv/gap")
sys.path.append('/home/geniuspart/public_html/')
import site
site.addsitedir('/home/geniuspart/public_html/venv/lib/python2.7/site-packages')

os.environ['DJANGO_SETTINGS_MODULE'] = "gap.settings"

# Activate your virtual env
activate_env=os.path.expanduser("~/public_html/venv/bin/activate_this.py")
execfile(activate_env, dict(__file__=activate_env))

from django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
#runfastcgi(method="threaded", daemonize="false")
