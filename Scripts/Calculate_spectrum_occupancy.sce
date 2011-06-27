// Calculates and saves the percentage of spectrum occupied over frequency and time!

printf('Calculating percentage of spectrum occupied..\n')
// This is the percentage of values in the matrix that exceed the noise floor
// e.g. the percentage of spectrum occupied over time and frequency
spectrum_occupancy = string(mean(B/(end_sample - (start_sample-1))*100));

if (Analysis_Period == "Week")
write_csv(spectrum_occupancy,'C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+ '/SO '+ band_name +'.csv');
printf('\n Spectrum Occupancy = '+ spectrum_occupancy +' Percent\n')
else
write_csv(spectrum_occupancy,'C:\Documents and Settings\pflynn\Desktop\Spectrum Days\Spectrum occupancies'+ '/SO '+ band_name + Analysis_Period +'.csv');
printf('\n Spectrum Occupancy = '+ spectrum_occupancy +' Percent\n')
 end  
clear A
clear B
clear C
clear l