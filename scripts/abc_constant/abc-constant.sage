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
print(RR(2*(2*log(K)+2.2*log(prod(primes_first_n(6))))))
