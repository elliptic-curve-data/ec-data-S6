data = []
i = 0
Nmax = 500000-1 #current max N in Cremona's DB
for E in cremona_curves(range(Nmax+1)):
        cond = E.conductor()
        data += [log(RR(cond))]
        i += 1
        if i % 1000 == 0:
            print(i)

H = histogram(data, bins= 150, color="#444488", edgecolor="#444488", linewidth=1)

H.show(dpi=400, transparent=True, typeset="latex", fontsize=16)
H.save("../img/cond_cremona.svg", dpi=400, transparent=True, typeset="latex", fontsize=16)
H.save("../img/cond_cremona.pdf", dpi=400, transparent=True, typeset="latex", fontsize=16)
