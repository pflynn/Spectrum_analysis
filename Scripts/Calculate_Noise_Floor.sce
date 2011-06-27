// Noise Floor Calculated Here.
// ave is the average of all the values in the matrix p(all the 5,050,080 values)
ave = mean(p);

// The noise range is defined as the difference between the maximum value 
// contained in the matrix p and the minimum value contained in the matrix p.
// This is obviously the entire reand and not just the noise range, but in the next loop
// values are going to be removed on each itteration and eventually it will be the actual noise range.
noise_range = max(p) -min(p);

// This is the threshold (noise floor), it is set to zero here.
// This is the max value that the spectrum analyzer can measure in dbm.
// so the threshold is obviously set above its actual value
// the task now is to home in on the real value.(done in the next loop)
threshold = 0;

printf('Estimating threshold (noise floor)...\n') 
// This loop homes in on the actual noise floor using the following method:
// On each itteration the values that are greater than (the average of all the values
// in p plus half of the value of the range of p) are removed from p. This takes away 
// the strongest signals from p, thus reducing the range, the average and max value of p.
// on each itteration the difference between the average of all the values and the min value of p plus half range of p become closer together
// when they are the same it is concluded that all the remaining values in p are composed of entirely noise values and the 
// loop is terminated and the noise floor value is defined as the average off all the noise values( eg the average of p) plus
// half of the noise range(half of the difference between the maximum value in p and the minimum value in p) 
       while(min(p)+(noise_range/2) > ave)
       //remove the values of p that are more than the average plus half range
      p = (p.*(p<(mean(p)+(noise_range/2))*1))
       
       // remove zeroes from p
       p = p(p~=0);
       
       noise_range = max(p) -min(p);
       ave = mean(p);
  
       printf('Threshold estimate : '+string(ave+(3))+'\n')
   end
   // next estimation stage
   // max(p) should be just as close to the average as min(P) now that average is the average of the noise
   // also the threshold should be 3dbm baove the noise average
   
   
   
   
     threshold =ave+(3);
   printf('Threshold Found '+string(threshold)+'\n')
   write_csv(threshold,'C:\Documents and Settings\pflynn\Desktop\Noise Floors'+ '/NF '+ band_name +'.csv');