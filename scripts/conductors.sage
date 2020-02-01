data = []
i = 0
with open("../data/curves_data__S_2_3_5_7_11_13.txt" , "r") as fp:
    for line in fp:
        c4,c6,disc,jinv,cond = line.strip().split(",")
        data += [log(ZZ(cond)*1.0)]
        i += 1
        if i % 1000 == 0:
            print(i)

H = histogram(data, bins= 150, color="#444488", linewidth=0)

log_N_Cremona = log(500000.0)
cremona_line = line2d([(log_N_Cremona,-5000),(log_N_Cremona,10^5)],linestyle="--",rgbcolor="#666")
H += cremona_line

H.show(dpi=400, transparent=True, typeset="latex", fontsize=16)
H.save("cond.svg", dpi=400, transparent=True, typeset="latex", fontsize=16)
H.save("cond.pdf", dpi=400, transparent=True, typeset="latex", fontsize=16)
