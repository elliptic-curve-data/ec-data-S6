data = []
i = 0
with open("../data/curves_data__S_2_3_5_7_11_13.txt" , "r") as fp:
    for line in fp:
        c4,c6,disc,jinv,cond = line.strip().split(",")
        data += [float(log(RR(ZZ(disc).abs()))/log(RR(ZZ(cond))))]
        i += 1
        if i % 1000 == 0:
            print(i)

H = histogram(data, bins= 100, color="#444488", edgecolor="#444488", linewidth=0.3)


H.show(dpi=400, transparent=True, typeset="latex", fontsize=16)
H.save("szpiro_ratio.svg", dpi=400, transparent=True, typeset="latex", fontsize=16)
H.save("szpiro_ratio.pdf", dpi=400, transparent=True, typeset="latex", fontsize=16)

