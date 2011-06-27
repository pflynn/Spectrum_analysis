// This script compresses the data into a smaller matrix
// It gets the Max hold Data
// It gets the Duty cycle data
printf('\n Compressing data....\n')
printf('Getting Max hold data....\n')
printf('Getting duty cycle data....\n')

for j = start_sample:end_sample
    // 'number' is used to pick the desired file at hand
    // 'number' has to be a string as it is used as part of a file name 
     number = string(j);
     
    if (j == start_sample) 
// A is array of values from the first file of data
A = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Results'+'/'+ band_name + number +'.csv'));
// B stores a list the same as A, but values of A are changed to 1 or zero, 1 if the value in at that point A is above threshold
// 0 if value at that point in A is below threshold.
B = (A>threshold)*1;

E = A;
// fills in the first line in z when compress factor is 1


if  int(((j -(start_sample -1))/compress_factor)) == ((j-(start_sample -1))/compress_factor)
        z(1:num_of_data_slots,((j-(start_sample -1))/compress_factor)) = E;
        end
else
    // C holds values of current data file for j = 2, too end of loop
    C = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Results'+'/'+ band_name + number +'.csv'));
    // same as B above, does this for each file from j = 2 too the end of loop.
    D = (C>threshold)*1;
    // sums up the amount of times each frequency is above the threshold.
    B = B + D;
    
    // gets the max hold data for the entire set of data
    A = max(A,C)
    E = max(E,C)
    // compresses the data for waterfall plot and stores in matrix z
    if  int(((j -(start_sample -1))/compress_factor)) == ((j-(start_sample -1))/compress_factor)
        z(1:num_of_data_slots,((j-(start_sample -1))/compress_factor)) = E;
        // sets e back 1000 dbm to ensure the new max hold for the next section 
        // of waterfall plot is not effected by the last
        E = E -1000;
    end
end
end
printf('\n Data compressed.\n')

// Instead of B holding the amount of times each frequency exceeded the threshold
    // it gives it as a fraction of 1 by dividing by the number of samples
    L = string(B/(end_sample - (start_sample-1)))
//end
// Creates and saves files used for getting duty cycle plots
if (Analysis_Period == "Week")
write_csv(L,'C:\Documents and Settings\pflynn\Desktop\Duty cycle plot data'+ '/dc '+ band_name +'.csv');
printf('\n Duty cycle data saved\n')
else
    write_csv(L,'C:\Documents and Settings\pflynn\Desktop\Spectrum Days\Duty Cycle Data'+ '/dc '+ band_name + Analysis_Period + '.csv');
printf('\n Duty cycle data saved\n')
end
// A file is created for each band of spectrum, this is the max hold data
if(Analysis_Period == "Week")
write_csv(string(A),'C:\Documents and Settings\pflynn\Desktop\Max hold plot data'+ '/mh '+ band_name + '.csv');
printf('\n Max hold data saved.\n')
else
    write_csv(string(A),'C:\Documents and Settings\pflynn\Desktop\Spectrum Days\Max Hold Data'+ '/mh '+ band_name + Analysis_Period +'.csv');
    end