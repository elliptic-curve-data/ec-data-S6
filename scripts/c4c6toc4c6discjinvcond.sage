for line in sys.stdin:
    c4,c6 = line.strip().split(",")
    E = EllipticCurve_from_c4c6(ZZ(c4), ZZ(c6))
    print(c4 + ","+ c6 + "," + str(E.discriminant()) + "," + str(E.j_invariant()) + ","+ str(E.conductor()))

