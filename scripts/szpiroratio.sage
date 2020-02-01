data = []
i = 0
with open("../data/curves_data__S_2_3_5_7_11_13.txt" , "r") as fp:
    for line in fp:
        c4,c6,disc,jinv,cond = line.strip().split(",")
        data += [float(log(RR(ZZ(disc).abs()))/log(RR(ZZ(cond))))]
        i += 1
        if i % 1000 == 0:
            print i

H = histogram(data, bins= 100)


H.show(dpi=400, transparent=True)
H.save("cond.svg", dpi=400, transparent=True)
H.save("cond.pdf", dpi=400, transparent=True)

