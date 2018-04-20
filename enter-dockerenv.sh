#!/bin/bash
docker run -ti --rm -v $PWD:/work -w /work -p 4000:4000 shihta/jekyll-asciidoc:gitlab bash
