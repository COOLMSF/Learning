  #include <math.h>
  #include <stdio.h>
  #include <stdlib.h>

  char *tokenstring = "first,25.5,second,15";
  int result, i;
  double fp;
  char o[10], f[10], s[10], t[10];

  int main()
  {
     result = sscanf(tokenstring, "%[^','],%[^','],%[^','],%s", o, s, t, f);
     fp = atof(s);
     i  = atoi(f);
     printf("%s\n %lf\n %s\n %d\n", o, fp, t, i);
  }
