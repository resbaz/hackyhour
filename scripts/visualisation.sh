#! /bin/bash
# Output roster structure in graphviz format.

dotgen() {
    echo 'graph hh {'
    awk -F"|" '{OFS="\" -- \""; print $(NF-3), $(NF-2), $(NF-1)}' roster.md \
        | tail --lines=+3 | sed 's/^/    "/g; s/$/";/g'
    awk -F"|" '{OFS="\" -- \""; print $(NF-3), $(NF-1)}' roster.md \
        | tail --lines=+3 | sed 's/^/    "/g; s/$/";/g'
    echo '}'
}

dotgen | dot -Tpng > /tmp/hh.png
