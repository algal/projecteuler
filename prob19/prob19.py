import datetime
import itertools

def iterate(f,x):
    """Returns the infinite sequence [x,f(x),f(f(x)),f(f(f(x))),...]"""
    yield x
    while True:
        x = f(x)
        yield x
    pass

def ilen(x):
    """Returns the length of an iterable"""
    length = 0
    for i in x:
        length = length+1
    return length

# calendar research to find the first Sunday
firstsunday = datetime.date(1901,1,6)
finaldate   = datetime.date(2000,12,31)
week     = datetime.timedelta(days=7)

sundays = iterate(lambda d: d+week,firstsunday)
sundays = itertools.takewhile(lambda d: d <= finaldate, sundays)
magicsundays = itertools.ifilter(lambda d: d.day == 1, sundays)
mycount = ilen(list(magicsundays))

# someone else's simpler solution.
#
# instead of iterating by 7 days, it just calculates the first every
# month and checks the weekday.

count = 0
for y in range(1901,2001):
    for m in range(1,13):
        if datetime.datetime(y,m,1).weekday() == 6:
            count += 1
print count


# best python solution
#
# also iterates over first of month
# uses the weekday(y,m,d) function, and a double comprehension
#
from calendar import weekday 
ccount = sum(int(weekday(y, m, 1) == 6) for y in range(1901, 2001) for m in range(1, 13)) 
