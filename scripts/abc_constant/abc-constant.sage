#The abc data is taken from the ABC@HOME project of Bart de Smit:
#
# https://www.math.leidenuniv.nl/~desmit/abc/
#

#First we parse the html files for abc-triples:
abcs = []
#filename = "abc-quality.html"
#filename = "abc-unbeaten.html"
filename = "abc-merit.html"
#filename = "abc-size.html"
with open(filename,"r") as fp:
	for line in fp:
		if line.startswith("<tr>"):
			entries = line.strip().split('<td class="abcnum">')
			entries = entries[-3:]
			#print(len(entries))
			#print(entries)
			abc = []
			for s in entries:
				s = s.replace("<sup>","**")
				s = s.replace("</sup>"," ")
				s = s.replace("&#x200B;"," ")
				s = s.replace("&middot;"," ")
				factors = s.split(" ")
				x = 1
				for f in factors:
					#print(f)
					if f == "":
						continue
					if f == "BIG":
						#We omit the abc-triples where one of the
						#factors is "BIG".
						#This BIG factor can be computed 
						#from a+b=c and the other numbers.
						#However it is not necessarily a prime.
						#Thus computing rad(a*b*c) would require
						#a factorization of BIG, which seems
						#computationally difficult.
						#So for simplicity we omit them from our
						#heuristic.
						break
					x *= eval(f)
				#print(x)
				if f == "BIG":
					break
				abc.append(x)
			#print("abc:",abc)
			if len(abc) == 3:
				if a+b==c:
					abcs.append(abc)
				else:
					print("error in abc:",abc)
			#break
#print("abcs:",abcs)
print("len(abcs):",len(abcs))

#Next, for given eps>0, compute what constant K_eps in 
#the abc-conjecture we have to take _at least_.
#If we assume the data of ABC@HOME to be "extremal",
#this constant might be the correct one.
eps = 0.1
#eps = 0.1
Kepss = []
for a,b,c in abcs:
	Keps = RR(c)/radical(a*b*c)^(1+eps)
	Kepss.append(Keps)
	print("Keps:",Keps)
	if Keps>7*10^6:
		print("abc:",a,b,c)
print("max Kepss:",max(Kepss))
print("log(max(Kepss)):",log(max(Kepss)))
K = max(Kepss)

#Finally, compute a height bound for the primitive solutions (x,y) of
#the $S$-hall equation for S={2,3,...,13} (and D=1).
#This is thus roughly a bound for the Neron-Tate height of S-integral
#points of the Mordell curve y^2=x^3+a, where a in ZZ\cap O_S^*
#with exponents of a bounded by 5.
print("height bound for S(6):",RR(2*(2*log(K)+2.2*log(prod(primes_first_n(6))))))
