=== THREE-ADDRESS CODE (TAC) ===

  0:  sum = 0
  1:  i = 1
  2:  L0:
  3:  t0 = i <= 5
  4:  ifz t0 goto L1
  5:  t1 = sum + i
  6:  sum = t1
  7:  t2 = i + 1
  8:  i = t2
  9:  goto L0
 10:  L1:
 11:  t3 = sum > 10
 12:  ifz t3 goto L2
 13:  print(sum)
 14:  goto L3
 15:  L2:
 16:  print(0)
 17:  L3:

=== VARIABLE TABLE ===
  sum : int
  i : int
