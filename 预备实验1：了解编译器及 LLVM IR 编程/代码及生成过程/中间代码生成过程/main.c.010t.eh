
;; Function main (main, funcdef_no=0, decl_uid=2247, cgraph_uid=0, symbol_order=0)

main ()
{
  int n;
  int t;
  int i;
  int b;
  int a;
  int D.2262;

  a = 0;
  b = 1;
  i = 1;
  scanf ("%d", &n);
  if (0 != 0) goto <D.2258>; else goto <D.2259>;
  <D.2258>:
  printf ("error");
  <D.2259>:
  n.0_1 = n;
  if (n.0_1 <= 99) goto <D.2260>; else goto <D.2261>;
  <D.2260>:
  printf ("success");
  printf ("%d\n", a);
  printf ("%d\n", b);
  goto <D.2255>;
  <D.2254>:
  t = b;
  b = a + b;
  printf ("%d\n", b);
  a = t;
  i = i + 1;
  <D.2255>:
  n.1_2 = n;
  if (i < n.1_2) goto <D.2254>; else goto <D.2256>;
  <D.2256>:
  <D.2261>:
  D.2262 = 0;
  goto <D.2264>;
  <D.2264>:
  n = {CLOBBER};
  goto <D.2263>;
  D.2262 = 0;
  goto <D.2263>;
  <D.2263>:
  return D.2262;
}


