// First stage 
printf('Getting raw data files...\n')
// For loop allows each file to be chosen
 for j = 1:end_sample
     // number is a string of the value j, number is used later to select csv files to read.
     number = string(j);

// creates all the csv files with only the 501 trace1 values needed
// The trace1 values are the values of max hold for a minute, for the range of spectrum.

// A becomes a list of the comma seperated variables in the raw data file, number is used to select the file.
A = read_csv('C:\Program Files\Tektronix\SA2600PC\Results'+'/'+ band_name + number +'.csv');
   
// A_values is a matrix of the trace1 values only
A_values = A(46:1:546,1);

   //Create the csv file and saves it to results folder on desktop
write_csv(A_values,'C:\Documents and Settings\pflynn\Desktop\Results' + '/'+ band_name + number +'.csv');
end // ends the for loop

// Clears the A_values matrix
clear A_values;
printf('Results got\n') // prints to the terminal 'Results Got'

