// Second stage
//Creating csv files with 501 values of 1(exceeds threshold) or 0(does not exceed threshold)

// 
for j = 1:num_of_samples
    // 'number' is used to pick the desired file at hand
    // 'number' has to be a string as it is used as part of a file name 
     number = string(j);
     
    if (j == 1) 
A = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Results'+'/'+ band_name + number +'.csv'));
B = (A>threshold)*1;
else
    C = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Results'+'/'+ band_name + number +'.csv'));
    D = (C>threshold)*1;
    B = B + D;
    
    A = max(A,C)
// creates a list of strings of either 1 or 0 depending on wheather the value 
// exceeds the threshold or not.
end
end
    B = string(B/num_of_samples)
//end
// Creates and saves files used for getting duty cycle plots
write_csv(B,'C:\Documents and Settings\pflynn\Desktop\Duty cycle plot data'+ '/dc '+ band_name +'.csv');

// A file is created for each band of spectrum, this is the max hold data
write_csv(string(A),'C:\Documents and Settings\pflynn\Desktop\Max hold plot data'+ '/mh '+ band_name + '.csv');

clear A
clear B
clear C