// STAGE 1
// SET THE VARIABLES

// needed for large amount of files
//stacksize(000000)

//num_of_samples is the number of samples of a particular band
num_of_samples = 576;

//num of bands is the number of bands of spectrum being used
// band 1 is 20MHz to 40MHz...band 2 is 40MHz to 60MHz..etc
// eg if we are just looking at the fourth band (80 - 100MHz) start_num_of_band = 4;
// and end_num_of_band = 4;
start_num_of_band = 49;
end_num_of_band = 49;

// This is the noise floor for the particular band(s) at hand
threshold = -81;

//Get Results from raw data
exec('C:\Program Files\scilab-5.3.1\work\get_results.sce', -1)
