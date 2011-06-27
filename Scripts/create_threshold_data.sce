// Second stage
//Creating csv files with 501 values of 1(exceeds threshold) or 0(does not exceed threshold)

// 
for j = 1:num_of_samples
    // 'number' is used to pick the desired file at hand
    // 'number' has to be a string as it is used as part of a file name 
     number = string(j);
     

    // A becomes a list of the 250 trace1 values
    // evstr() changes them from string to numerical values because they are stored as strings in the csv files
    //
    //
    if (j == 1) 
A = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Results'+'/'+ band_name + number +'.csv'));
B = (A>threshold)*1;
else
    A = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Results'+'/'+ band_name + number +'.csv'));
    C = (A>threshold)*1;
    B = B + C;
// creates a list of strings of either 1 or 0 depending on wheather the value 
// exceeds the threshold or not.
end
end
    B = string(B)
//end
// Creates and saves files used for getting duty cycle plots
write_csv(B,'C:\Documents and Settings\pflynn\Desktop\Duty cycle plot data'+ '/dc '+ band_name +'.csv');

clear A
clear B
clear C