triangleraw=file('triangle.txt').read()
t = [line.split(' ') for line in triangleraw.strip().split('\n')]

maxdepth = len(t)-1
maxoffset= len(t[maxdepth])-1

# t now gives t[depth][offset]
#
# depth is 0-based, counting from the top
# offset is 0-based, counting from the left
v = {}

def value(d,o):
    """gives the max total for the subtriangle rooted at d,0"""
    # return memoized value if possible
    if (d,o) in v:
        return v[(d,o)]

    thisitem = int(t[d][o])
    # the total of a subtree that starts at the leaf, is just the value of the leaf
    if d == maxdepth:
        val = thisitem
    else:
        val = thisitem + max(value(d+1,o),value(d+1,o+1))

    v[(d,o)]=val
    return val


# for efficiency:
#
#  1) add memoization to avoid recalculating values.
#  2) adpative heuristic to abandon search of pathways that cannot catch up with peers
#
v = {}

def getValue(d,o):
    if (d,o) not in v:
        v[(d,o)]=getValue(d,o)
    return v[(d,o)]

    
