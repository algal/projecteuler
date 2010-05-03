def nestList(f,init):
    a = init
    while True:
        yield a
        a = f(a)
		
