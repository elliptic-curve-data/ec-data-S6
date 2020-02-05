alist = load("remaining_a_rank1.sobj")

@parallel(ncpus=30, timeout=60*15)
def runone(a):
    try:
        magma.load("descentpar.m")
    except RuntimeError:
        pass
    P = magma.docurve(a)
    E = EllipticCurve([0,a])
    EP = sage_eval("E" + str(P).replace(":",","),locals={'E':E})
    print E,EP
    return EP

L = list(runone(alist))
save(L, 'big_run')
