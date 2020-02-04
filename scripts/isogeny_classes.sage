try:
	c4s[0]+cs6[0]
except NameError:
	c4s = load("c4s.sobj")
	c6s = load("c6s.sobj")

print("loaded c4s,c6s")

c4c6_to_index = {}
for i,c4 in enumerate(c4s):
	if i%1000==0:
		print("part 1, i:",i)
	c6 = c6s[i]
	c4min,c6min = EllipticCurve_from_c4c6(c4,c6).minimal_model().c_invariants()
	c4c6_to_index[(c4min,c6min)] = i
	
print("built c4c6_to_index")	
	
isogeny_classes = {}

for i,c4 in enumerate(c4s):
	if i%1000==0:
		print("part 2, i:",i)
	if i in isogeny_classes:
		continue
	
	c6 = c6s[i]
	E = EllipticCurve_from_c4c6(c4,c6)
	CE = E.isogeny_class()
	
	iso_indices = []
	for isoE in CE.curves:
		isoEmin = isoE.minimal_model()
		isoc4,isoc6 = isoEmin.c_invariants()
		isoindex = c4c6_to_index[(isoc4,isoc6)]
		iso_indices.append(isoindex)
	iso_indices = tuple(iso_indices)
	for j in iso_indices:
		isogeny_classes[j] = iso_indices
		
