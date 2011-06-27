//Third stage
// Creating Duty cycle data



for j = 1:num_of_samples
    // 'number' is used to pick the desired file at hand
    // 'number' has to be a string as it is used as part of a file name 
     number = string(j);
     // The first set of threshold data is put into A
     if(j == 1)
 A = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Threshold data'+ '/th '+ band_name + number +'.csv'));
 //The remaining sets of data are added to A (makes duty cycle data)
else
    A = A + evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Threshold data'+ '/th '+ band_name + number +'.csv'));
end
end

// B is the array for the duty cycle plot data at hand
// each value in B is made the fraction of time that that point of spectrum is above the threshold
 B = string(A./num_of_samples);
// A file is created for each band of spectrum
write_csv(B,'C:\Documents and Settings\pflynn\Desktop\Duty cycle plot data'+ '/dc '+ band_name +'.csv');

clear A
clear B