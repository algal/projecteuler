w = {1:'one',
     2:'two',
     3:'three',
     4:'four',
     5:'five',
     6:'six',
     7:'seven',
     8:'eight',
     9:'nine',
     10:'ten',
     11:'eleven',
     12:'twelve',
     13:'thirteen',
     14:'fourteen',
     15:'fifteen',
     16:'sixteen',
     17:'seventeen',
     18:'eighteen',
     19:'nineteen',
     20:'twenty',
     30:'thirty',
     40:'forty',
     50:'fifty',
     60:'sixty',
     70:'seventy',
     80:'eighty',
     90:'ninety',
     100:'hundred',
     1000:'one thousand'}

def pronounceNum(n):
    if n == 1000:
        return w[n]
    
    hundreds = (n // 100)
    tensones = n - 100*(n // 100)
    tens = tensones // 10
    ones = tensones - 10*(tensones // 10)

    word = ''
    # handle hundreds
    if hundreds == 0:
        pass
    elif hundreds != 0 and tensones == 0:
        word = word + w[hundreds] + ' ' + w[100]
    elif hundreds != 0 and tensones != 0:
        word = word + w[hundreds] + ' ' + w[100] + ' and '

    # process tensones
    if 1 <= tensones <= 19:
        word = word + w[tensones]
    elif 20 <= tensones <=99:
        # process tens
        word = word + w[tens*10]

        # process ones
        if ones != 0:
            word = word + w[ones]

    return word

def countletters(s):
    """Returns number of non-space, non-hyphen chars in s"""
    s = s.replace(' ','').replace('-','')
    return len(s)

allnums = reduce(lambda x,y:x+y,[pronounceNum(i) for i in xrange(1,1000+1)],'')

charcount = countletters(allnums)

