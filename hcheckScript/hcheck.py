##usage: 
##python hcheck.py URL 
import requests
import sys

if ' '.join(sys.argv[1:]) is None:
    url="http://CHTN-elb-1544176384.us-east-1.elb.amazonaws.com"
else:
    url=' '.join(sys.argv[1:])

def report():
    print "here write code to report failure"

if requests.get(url).status_code != 200:
    print "NoOk"
    report()
else:
    print "OK"
