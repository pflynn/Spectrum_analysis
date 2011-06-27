// Fourth stage
//Get the Max hold data for each band
//num_of_samples is the number of samples of a particular band
num_of_samples = 40;
//num_of_bands is the number of bands of spectrum being used
// band 1 is 20MHz to 40MHz...band 2 is 40MHz to 60MHz..etc
num_of_bands = 4

// num_of_data_slots is the number of data slots in each data file for duty cycle 
num_of_data_slots = 501



// changes string to one two or three in order to select the different files later
   for k = 4:num_of_bands

//for p = 1:num_of_data_slots
//value = 10000;
for j = 1:num_of_samples
     number = string(j);
     if (j == 1) 
         A = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Results' + '/'+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz ' + number +'.csv'));
     else
         B = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Results' + '/'+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz ' + number +'.csv'));
         C = B>A;
         D = ~C;
         
         
         A = A.*D + B.*C;
     end


// value will hold the value to be placed in apropriate slot in the max hold data slot
//if (value*value) > (evstr(A(p,1))*evstr(A(p,1)))
     //value = evstr(A(p,1));

//end
// B is the array for the max hold plot data at hand
 //B(p,1) = string(value);
end

// A file is created for each band of spectrum
write_csv(string(A),'C:\Documents and Settings\pflynn\Desktop\Max hold plot data'+ '/mh '+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz.csv');
end