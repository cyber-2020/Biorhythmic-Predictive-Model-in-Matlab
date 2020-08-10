function cycle_value = cycle(jd,jb,p)
jd=julian(jd);
jb=julian(jb);
t=jd-jb;
cycle_value = sin((2*3.141592653589793*t)/p);
