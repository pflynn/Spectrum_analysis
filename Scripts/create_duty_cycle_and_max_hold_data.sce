// Calculates and saves the percentage of spectrum occupied over frequency and time!

printf('Calculating percentage of spectrum occupied....\n')
spectrum_occupancy = string(mean(B/num_of_samples)*100);
write_csv(spectrum_occupancy,'C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+ '/SO '+ band_name +'.csv');
printf('\n Spectrum Occupancy = '+ spectrum_occupancy +' Percent\n')
    
clear A
//clear B
clear C
clear l