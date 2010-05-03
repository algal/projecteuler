# bound every name with ","
names = '\",' + open('names.txt').read() + ',\"'
#split on "," , remove empties, clean, uppercase, and sort
names = sorted([name.strip().upper() for name in names.split('\",\"') if name !=''])

def value(name):
    def atoi(ch):
        return 1+'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.find(ch)
    return sum(atoi(ch) for ch in name)

scores = [(rank,name,value(name)) for (rank,name) in zip(xrange(1,len(names)+1),names)]
total = sum( rank * value for (rank,name,value) in scores )


