data = []
i = 0
Nmax = 500000-1 #current max N in Cremona's DB
for E in cremona_curves(range(Nmax+1)):
        disc = E.discriminant()
        cond = E.conductor()
        data += [float(log(RR(ZZ(disc).abs()))/log(RR(ZZ(cond))))]
        i += 1
        if i % 1000 == 0:
            print(i)

H = histogram(data, bins= 100, color="#444488", edgecolor="#444488", linewidth=1)


H.show(dpi=400, transparent=True, typeset="latex", fontsize=16)
H.save("../img/szpiro_ratio_cremona.svg", dpi=400, transparent=True, typeset="latex", fontsize=16)
H.save("../img/szpiro_ratio_cremona.pdf", dpi=400, transparent=True, typeset="latex", fontsize=16)

