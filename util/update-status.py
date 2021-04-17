#!/bin/python3
import json
import codecs
import sys
import getopt
from collections import OrderedDict

if (len(sys.argv) != 3):
    sys.exit(1)

file_dir = "/mnt/socoding/files/fancyindex/data/supported_os.json"

with codecs.open(file_dir, 'r', 'utf-8') as f:
    oslist = json.load(f, object_pairs_hook=OrderedDict)
    for osobj in oslist:
        for tag in osobj['tags']:
            if (tag['key'] == sys.argv[1]):
                tag['text'] = "stat: " + str(sys.argv[2])
                tag['color'] = "mdl-chip mdl-color--green" if str(sys.argv[2]) == "0" else "mdl-chip mdl-color--red"

with codecs.open(file_dir, 'w', 'utf-8') as f:
    json.dump(oslist, f, ensure_ascii=False,
              indent=4, separators=(',', ': '))
