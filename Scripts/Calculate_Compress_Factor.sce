// calculates a compress factor to give the desired detail in the waterfall graph
     compress_factor = 1;
     while(((end_sample - (start_sample-1))/compress_factor) > 336 | (((end_sample - (start_sample-1))/compress_factor)) ~= int(((end_sample - (start_sample-1))/compress_factor))) 
         compress_factor = compress_factor+1;
     end
printf('Compress factor = '+string(compress_factor)+'\n')
