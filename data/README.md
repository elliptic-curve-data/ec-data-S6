# Data

This folder contains all of this project's data that is related to M(S(6)), the set of all rational elliptic curves with good reduction outside {2, 3, 5, 7, 11, 13}.

### Contents

 - [curves__S_2_3_5_7_11_13.zip](curves__S_2_3_5_7_11_13.zip) decompresses to a text file curves__S_2_3_5_7_11_13.txt in cvs format (comma separated values). 
   Each line corresponds to a curve E of M(S(6)), which is given in the format `c4,c6`.
   Here c4 and c6 are the c-invariants of a minimal model of E. 
   In particular, E has a (possibly non-minimal) model `y^2 = x^3 - 27 c4 x - 54 c6`.
   Note that we did not prove completeness of our table, although heuristically it should be.
 
 - [curves_data__S_2_3_5_7_11_13.zip](curves_data__S_2_3_5_7_11_13.zip) is as [curves__S_2_3_5_7_11_13.zip](curves__S_2_3_5_7_11_13.zip), except that each line of the contained text file is of the form `c4,c6,Delta,j,N`, where c4 and c6 are as before, Delta is the global minimal discriminant of E, j the j-invariant of E, and N the conductor of E. 

 - [mwMordellS6.sobj](mwMordellS6.sobj) is a sage object file that contains Mordell-Weil bases of Mordell curves, that were used to compute the table M(S(6)).
   The Mordell curves are of the form `E_a: y^2 = x^3 + a`, where a is an integer of the form `+/- prod_{p in S} p^{a_p}` with `0 <= a_p <= 5`.
   The Mordell-Weil bases for 2*306 such curves are missing so far.
 
 - [mwMordellUnknown.sobj](mwMordellUnknown.sobj) is a sage object file that contains a list of a's that correspond to half of the Mordell curves E_a for which we do not know their Mordell-Weil basis.
   The other half is given by -27*a for a in the given list.

### Completeness of the table

The table is likely to be complete, however this is not proved yet.
Proving completeness with our method should take about 50 more CPU years.

### Authors

Alex J. Best, Benjamin Matschke.

### License

Creative Commons BY-NC 4.0.
