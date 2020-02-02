data = []

for f2 in range(9):
	for f3 in range(6):
		for f5 in range(3):
			for f7 in range(3):
				for f11 in range(3):
					for f13 in range(3):
						N = 2^f2 * 3^f3 * 5^f5 * 7^f7 * 11^f11 * 13^f13
						data.append(log(RR(N)))

H = histogram(data, bins= 150, color="#444488", edgecolor="#444488", linewidth=1)

log_N_Cremona = log(500000.0)
cremona_line = line2d([(log_N_Cremona,-5),(log_N_Cremona,74)],linestyle="--",rgbcolor="#666")
H += cremona_line

H.show(dpi=400, transparent=True, typeset="latex", fontsize=16)
H.save("../img/possible_conductors.svg", dpi=400, transparent=True, typeset="latex", fontsize=16)
H.save("../img/possible_conductors.pdf", dpi=400, transparent=True, typeset="latex", fontsize=16)
