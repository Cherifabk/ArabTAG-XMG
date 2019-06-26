#! /usr/bin/python3

import sys
import codecs
import yaml
import subprocess
import os, os.path
import xml.etree.cElementTree as ET
import argparse

CORPUS = yaml.load_all(codecs.open("corpus.yml", encoding="utf-8"))
TULIPA_JAR = os.environ.get("TULIPA_JAR", "/home/xmg/TuLiPA-frames.jar")
TULIPA_FRAME = os.environ.get("TULIPA_JAR", "/home/xmg/TuLiPA-frames.jar")
PARTAGE = os.environ.get("PARTAGE", None) or os.environ.get("ParTAGe", "/home/xmg/.local/bin/partage4xmg")


def run_test_tulipa(e):
    if os.path.exists("corpus0.xml"):
        os.unlink("corpus0.xml")
    with codecs.open("corpus.txt", mode="w", encoding="utf-8") as f:
        f.write(e["text"])
    subprocess.check_call([
        "java", "-jar", TULIPA_FRAME,"-cyktag", "-g", "ArabTAG.xml", "-l", "lemmes.xml", 
        "-m", "morphs.xml", "-a", e['axiom'], "-b", "corpus.txt", "-o", "corpus"])
    subprocess.check_call([
    "cat corpus0.xml >> corpusfinal.txt"], shell=True)
    if not os.path.exists("corpus0.xml"):
        assert 0 == e['expected']
    else:
        xml = ET.parse("corpus0.xml")
        parses = xml.getroot().findall("parse")
        assert len(parses) == e['expected']

def run_test_tulipaframe(e):
    if os.path.exists("corpus0.xml"):
        os.unlink("corpus0.xml")
    with codecs.open("corpus.txt", mode="w", encoding="utf-8") as f:
        f.write(e["text"])
    subprocess.check_call([
        "java", "-jar", TULIPA_FRAME,"-cyktag", "-g", "ArabTAG.xml", "-f", "ArabTAG.xml",
        "-th", "more.mac","-l", "lemmes.xml", "-m", "morphs.xml", "-a", e['axiom'],
        "-b", "corpus.txt", "-o", "corpus"])
    subprocess.check_call([
    "cat corpus0.xml >> corpusfinal.txt"], shell=True)
    if not os.path.exists("corpus0.xml"):
        assert 0 == e['expected']
    else:
        xml = ET.parse("corpus0.xml")
        parses = xml.getroot().findall("parse")
        assert len(parses) == e['expected']

def run_test_jakub(e):
    if os.path.exists("corpus0.xml"):
        os.unlink("corpus0.xml")
    with codecs.open("corpus.txt", mode="w", encoding="utf-8") as f:
        f.write(e["text"])
    inp = open("corpus.txt", encoding="utf-8")
    out = subprocess.check_output(
        [
            PARTAGE, "parse", "-g", "ArabTAG.xml", 
            "-l", "lemmes.xml", "-m", "morphs.xml", "-s", e['axiom'], "-d", "-u"],
        stdin=inp, shell=False)
    sys.stdout.write(out.decode())
    sys.stdout.flush()
    for l in out.split():
        words = l.split()
        if len(words) >= 2 and (words[1]=="tree" or words[1]=="trees"):
            n = int(words[0])
            assert n == e["expected"]


def main():
    parser = argparse.ArgumentParser(description="Run the ArabTag test suite.")
    parser.add_argument("--tulipa", help="use Tulipa for parsing",
                        dest="parser", action="store_const", const="tulipa")
    parser.add_argument("--tulipaframe", help="use TulipaFrame for parsing",
                        dest="parser", action="store_const", const="tulipaframe")
    parser.add_argument("--jakub", help="use Jakub's parser for parsing",
                        dest="parser", action="store_const", const="jakub")
    parser.add_argument("tags", nargs="*")
    parser.set_defaults(parser="tulipa")
    args = parser.parse_args()
    if args.parser == "tulipa":
        run_test = run_test_tulipa
    elif args.parser == "tulipaframe":
        run_test = run_test_tulipaframe
    else:
        run_test = run_test_jakub
    for e in CORPUS:
        if all(t in e['tags'] for t in args.tags):
            run_test(e)


if __name__ == '__main__':
    main()
