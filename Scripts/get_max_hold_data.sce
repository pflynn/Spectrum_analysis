// 3rd stage
//Get the Max hold data for each band

for j = 1:num_of_samples
    // 'number' is used to pick the desired file at hand
    // 'number' has to be a string as it is used as part of a file name 
     number = string(j);
     // Puts first file values into A
     if (j == 1) 
         A = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Results' + '/'+ band_name + number +'.csv'));
         // Adds rest of values to A
     else
         B = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Results' + '/'+ band_name + number +'.csv'));
         
         A = max(A,B)
         // C is a list of 1s and 0s, 1 if B is greater than A at that point, else c is 0
        // C = B>A;
         // D is the opposite of C
       //  D = ~C;
        // Values in A are updated if values in B are greater than it at particular points
      //   A = A.*D + B.*C;
     end

end

// A file is created for each band of spectrum, this is the max hold data
write_csv(string(A),'C:\Documents and Settings\pflynn\Desktop\Max hold plot data'+ '/mh '+ band_name + '.csv');

// Clearing some variables
clear A
clear B
clear C
clear D