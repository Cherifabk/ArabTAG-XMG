TARGETS = ArabTAG.xml lemmes.xml morphs.xml

all: $(TARGETS)

ArabTAG.xml: ArabTAG.mg SynArabTAG.mg SemArabTAG.mg Syntagmes.mg Nominal.mg Verbal.mg
	xmg compile synframe --more --force  $<

lemmes.xml: lemmes.lex
	lexConverter -Lt -i $< -o $@

morphs.xml: morphs.mph
	lexConverter -Mt -i $< -o $@

morphs.mph: morphs.yml
	./yml2mph.py $< $@

tests: all
	./corpus.py

tests-tulipa: all
	./corpus.py --tulipa

tests-tulipaframe: all
	./corpus.py --tulipaframe

tests-jakub: all
	./corpus.py --jakub

.PHONY: all tests
