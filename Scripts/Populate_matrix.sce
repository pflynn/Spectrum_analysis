// Second stage
//Creating csv files with 501 values of 1(exceeds threshold) or 0(does not exceed threshold)

// num_of_data_slots is the number of data slots in each csv file, this should not change as 
// this is the amount of values the spectrum analyzer produces to describe each max hold band.
// For example if you were measuring a band 501MHz wide you would have one power value in dbm for 
// each whole number frequency in that band, and plotting it would yield the max hold graph for the band 
  num_of_data_slots = 501;

// The stacksize is increased to allow all the results values to fit in the matrix p.
stacksize (30000000);
// p is set to its size before filling it to save on processing time in the loop
p = zeros(end_sample -(start_sample -1), num_of_data_slots)
// Prints to the terminal to let the user know What is happening now.
printf('Filling matrix p with all result values...\n') 

// The for loop fills matrix p with all the results values. 
for j = start_sample:end_sample 
    // number is a string of the value of j
     number = string(j);
     // A becomes a list of the results values for the jth minute of analysing
     A = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Results'+'/'+ band_name + number +'.csv'));
     
    // fills up the jth line in the matrix p
     p(j - (start_sample -1),1:1:num_of_data_slots) = A';    
end
