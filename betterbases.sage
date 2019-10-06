fil = open("rank2_big_bases.txt")

ansdict = {}

line = fil.readline()
while line != '':
    print "\n\n",
    a = int(line[53:])
    print a
    E = EllipticCurve([0,a])
    line = fil.readline()
    P1 = sage_eval("E"+line,locals={'E':E})
    line = fil.readline()
    P2 = sage_eval("E"+line,locals={'E':E})
    s,u= E.lll_reduce(E.saturation([P1,P2])[0])
    print s
    s = E.saturation(s)[0]
    print s
    ansdict[a] = s
    print E.integral_points(mw_base=s)
    line = fil.readline()
    line = fil.readline()
save(ansdict, "rank2results")
