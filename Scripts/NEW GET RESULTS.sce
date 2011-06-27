// First stage
// allows each file to be chosen
 for j = 1:num_of_samples
     number = string(j);

// creates all the csv files with only the 501 trace values needed

    // A becomes a list of the comma seperated variables in the raw data file
   A = read_csv('C:\Program Files\Tektronix\SA2600PC\Results'+'/'+ band_name + number +'.csv');
   // A_values is a matrix of the trace1 values only
 
   A_values(1:1:501,j) = A(46:1:546,1);
end
   //Create the csv file and saves it to results folder on desktop
write_csv(A_values,'C:\Documents and Settings\pflynn\Desktop\Resultsss' + '/'+ band_name + 'full_matrix_data.csv');

