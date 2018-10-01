URL=http://lab.hakim.se/reveal-js
REPO=https://github.com/hakimel/reveal.js/archive/master.zip
FLAGS=-s --highlight-style=zenburn -f rst -t revealjs -V revealjs-url=./reveal.js
#FLAGS=-s -f rst -t revealjs -V revealjs-url=./reveal.js
THEME=black

all: course.html reveal.js

reveal.js:
	wget -N ${REPO}
	unzip master.zip
	mv reveal.js-master reveal.js

course.html: course.txt
	pandoc ${FLAGS} -V theme=${THEME} $^ -o $@

clean:
	rm -f course.html 
