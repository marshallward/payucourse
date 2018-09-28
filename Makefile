URL=http://lab.hakim.se/reveal-js
REPO=https://github.com/hakimel/reveal.js/archive/master.zip
FLAGS=-s -f rst -t revealjs -V revealjs-url=./reveal.js

all: course.html reveal.js

master.zip:
	wget ${REPO}

reveal.js: master.zip
	unzip $^
	mv reveal.js-master reveal.js

course.html: course.txt
	pandoc ${FLAGS} $^ -o $@

clean:
	rm -f course.html 
