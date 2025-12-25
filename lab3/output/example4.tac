=== THREE-ADDRESS CODE (TAC) ===

  0:  factorial = 1
  1:  n = 5
  2:  counter = 1
  3:  L0:
  4:  t0 = counter <= n
  5:  ifz t0 goto L1
  6:  t1 = factorial * counter
  7:  factorial = t1
  8:  t2 = counter + 1
  9:  counter = t2
 10:  goto L0
 11:  L1:
 12:  print(factorial)

=== VARIABLE TABLE ===
  factorial : int
  n : int
  counter : int
