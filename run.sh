#!/bin/bash

IN=input-files

ex1() {
    # shows: that sed finds the pattern /old/ and substitues 'new' for
    # it and then appends a new line even though the file doesn't
    # initially container a NL at the end.
    sed 's/old/new/' $IN/old
}

ex2() {
    # shows: a new line isn't required in the RegEx even though a NL
    # is present in the file
    sed 's/old/new/' $IN/old-with-nl
}

ex3() {
    # shows: a substituions doesn't occur if the pattern is not found
    # shows: that sed AutoPrints the line that it did find.
    sed 's/red/blue/' $IN/old-with-nl
}

ex4() {
    # shows: sed doesn't require any quoting in some cases
    sed s/old/new/ $IN/old
}

ex5() {
    # shows: sed script can be double quoted as well.  Shell expansion
    # and quoting will likely take place for either of these examples
    # in a non-trivial usage.
    sed "s/old/new/" $IN/old
}

ex6() {
    # shows: simple find replace in multi-line file.
    sed 's/RED/123/' $IN/rgb
}

ex7() {
    # shows: piping text from echo into sed
    echo old | sed 's/old/new/'
}

ex8() {
    # shows: that sed replace only the first occurance given only the
    # substitue command.
    sed 's/old/young/' $IN/word-multiple-times
}

ex9() {
    # shows: seq printing a sequence of numbers, one to a line and sed
    # deleting line #2
    seq 3 | sed '2d'
    sed '2d' $IN/1-3.txt
}

ex10() {
    # shows: sed deleting the lines between 'b' and 'g' in the given
    # file leaving the line with 'a' and 'b' alone
    sed '/c/,/g/ d' $IN/a-i.txt
}

ex11() {
    # shows: sed can use a different delimeter than the normal
    # /RegEx/SubEx/ patter that uses the character '/'
    echo old | sed 's:old:new:'
    echo old | sed 's|old|new|'
    echo old | sed 's_old_new_'
}

ex12() {
    # shows: sed if the pattern and/or substition includes characters
    # used by the input they must be escaped to distinguish the
    # delimiter from the target and destination patterns
    echo '/A/' | sed 's/\/A\//\/a\//'

    # shows: changing the delimeter makes the substritution more
    # readable
    echo '/A/' | sed 's|/A/|/a/|'
    echo '/A/' | sed 's:/A/:/a/:'
    echo '/A/' | sed 's_/A/_/a/_'
}

ex() {
    "ex$1"
}

"$@"
