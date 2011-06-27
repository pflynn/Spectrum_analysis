//Third stage
// Creating Duty cycle data

   for k = start_num_of_bands:end_num_of_bands

//for p = 1:num_of_data_slots
//value = 0;
for j = 1:num_of_samples
     number = string(j);
     if(j == 1)
 A = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Threshold data'+ '/th '+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz ' + number +'.csv'));
else
    A = A + evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Threshold data'+ '/th '+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz ' + number +'.csv'));
end
end
// value will hold the value to be placed in apropriate slot in the duty cycle plot data file
//value = value + (evstr(A(p,1))/num_of_samples)
//end
// B is the array for the duty cycle plot data at hand
 B = string(A./num_of_samples);
// A file is created for each band of spectrum
write_csv(B,'C:\Documents and Settings\pflynn\Desktop\Duty cycle plot data'+ '/dc '+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz.csv');
end