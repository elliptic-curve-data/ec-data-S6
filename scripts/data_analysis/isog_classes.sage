from collections import defaultdict
data = defaultdict(list)
i = 0
with open("../data/curves_data__S_2_3_5_7_11_13.txt" , "r") as fp:
    for line in fp:
        c4,c6,disc,jinv,cond = line.strip().split(",")
        E = EllipticCurve_from_c4c6(ZZ(c4), ZZ(c6))
        key = (ZZ(cond),( E.change_ring(GF(p)).cardinality() for p in prime_range(14, 200)))
        data[key] += [(ZZ(c4),ZZ(c6))]
        i += 1
        if i % 1000 == 0:
            print i

classes = defaultdict(list)
for k in data.keys():
    for c4,c6 in data[k]:
        E1 = EllipticCurve_from_c4c6(c4, c6)
        for E2 in classes[k]:
            if E2.is_isogenous(E1, maxp=1):
                break
        else:
            classes[k] += [E1]

