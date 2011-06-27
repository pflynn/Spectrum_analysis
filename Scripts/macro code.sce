// make code for sa macro

A(1,1) = '# 80MHz to 100MHz'
A(2,1) = 'sens:spec:freq:center 90e6'
A(3,1) = 'sens:spec:freq:span 20e6'
A(4,1) = 'init;'
A(5,1) = '% sleep 30'
A(6,1) = 'mmemory:store:results "80MHz to 100MHz1.csv'

for k = 1:50
  A((1+(6*k-1)),1) = '# 80MHz to 100MHz'
  A((2+(6*k-1)),1) = 'sens:spec:freq:center 90e6'
  A((3+(6*k-1)),1) = 'sens:spec:freq:span 20e6'
  A((4+(6*k-1)),1) = 'init;'
  A((5+(6*k-1)),1) = '% sleep 30'
  A((6+(6*k-1),1) = 'mmemory:store:results "80MHz to 100MHz' + string(k) + '.csv'
end
