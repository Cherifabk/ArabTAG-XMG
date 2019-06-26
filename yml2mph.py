#! /usr/bin/python3
import yaml, sys, codecs

f = codecs.open(sys.argv[2], mode="w", encoding="utf-8")

for e in yaml.load_all(codecs.open(sys.argv[1], encoding="utf-8")):
    f.write(u"%s\t%s\t[%s]\n" % (e[0], e[1], "; ".join("%s=%s" % (k, v) for k,v in e[2].items())))
