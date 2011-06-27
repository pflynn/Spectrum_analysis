// Run this to get the 3 graphs from raw data
// SET THE VARIABLES

// Enter the period you would like to do the analysis over
//(0ptions are Day1,Day2...Day7, or Week)
Analysis_Period = "Day4";

// The week analysis should be done first to obtain the most accurate noise floor.


// Set these for the particular band you are analysing
start_freq = 928;
end_freq = 1000;
// choises for (start_freq, end_freq)are (30,54) (54,88) (108,138) (138,174)
// (174,126) (216,225) (225,406) (406,470) (470,512) (512,608) (608,698)
// (698,806) (806,902) (902,928) (928,1000)


////////////////////////////////////////////////////////////////////////////////
if Analysis_Period == "Day1"
    end_sample = 1*(10080/7);
start_sample =0*(10080/7)+1;

elseif Analysis_Period == "Day2"
    end_sample = 2*(10080/7);
start_sample =1*(10080/7)+1;

elseif Analysis_Period == "Day3"
    end_sample = 3*(10080/7);
start_sample =2*(10080/7)+1;

elseif Analysis_Period == "Day4"
    end_sample = 4*(10080/7);
start_sample =3*(10080/7)+1;

elseif Analysis_Period == "Day5"
    end_sample = 5*(10080/7);
start_sample =4*(10080/7)+1;

elseif Analysis_Period == "Day6"
    end_sample = 6*(10080/7);
start_sample =5*(10080/7)+1;

elseif Analysis_Period == "Day7"
    end_sample = 7*(10080/7);
start_sample =6*(10080/7)+1;

elseif Analysis_Period == "Week"
    end_sample = 10080;
start_sample =1;
end
 

//Do NOT need to set anything below this point.
// The name of the file in results is ""band_name"" defined here
band_name = string(start_freq) +'MHz to '+ string(end_freq) +'MHz';


//This noise floor will be entered here for all day analysis.
if (Analysis_Period ~= "Week")
A = evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Noise Floors'+ '/NF '+ band_name +'.csv'));
while (A(1,2)>1)
    A(1,2) = A(1,2)/10;
end
threshold = A(1,1) -A(1,2)
end

//Get Results from raw data and save to results file on desktop
if Analysis_Period == "Week"
//exec('C:\Program Files\scilab-5.3.1\work\get_results.sce', -1)
end
// Create the matrix containing all values 
exec('C:\Program Files\scilab-5.3.1\work\Populate_matrix.sce', -1)

// Calculates the noise floor of the band if it is a week analysis
if (Analysis_Period == "Week")
exec('C:\Program Files\scilab-5.3.1\work\Calculate_Noise_Floor.sce', -1)
end
// Calculates the compress factor for waterfall graph
exec('C:\Program Files\scilab-5.3.1\work\Calculate_Compress_Factor.sce', -1)

// Calculates the compress factor for waterfall graph
exec('C:\Program Files\scilab-5.3.1\work\Get_MaxHold_Duty_cycle_Data_and_Compress.sce', -1)

// Create the files containg info on wheather threshold is exceeded or not
exec('C:\Program Files\scilab-5.3.1\work\Calculate_spectrum_occupancy.sce', -1)


//Create and save all plots in combined plots file on desktop
exec('C:\Program Files\scilab-5.3.1\work\Make_all_plots.sce', -1)

//printf('Creating max hold plot only...\n')
//Create and save Max hold plot in Max hold plots file on desktop
//exec('C:\Program Files\scilab-5.3.1\work\max_hold_plots.sce', -1)

//printf('Creating max duty cycle plot only...\n')
//Create and save duty cycle plot in duty cycle plots file on desktop
//exec('C:\Program Files\scilab-5.3.1\work\Plot_duty_cycle_graphs.sce', -1)

//printf('Creating waterfall plot only...\n')
//Create and save Waterfall plot in waterfall plots file on desktop
//exec('C:\Program Files\scilab-5.3.1\work\WATERFALL PLOT.sce', -1)
clear;
printf('Finished!\n')
stacksize(5000000)
