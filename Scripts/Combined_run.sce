// do all the steps required to get the 3 graphs from raw data
// SET THE VARIABLES

// resets it back to its default value for quicker processing
stacksize(5000000)

//num_of_samples is the number of samples of a particular band
num_of_samples = 348;

//num of bands is the number of bands of spectrum being used
// band 1 is 20MHz to 40MHz...band 2 is 40MHz to 60MHz..etc
// eg if we are just looking at the fourth band (80 - 100MHz) start_num_of_band = 4;
// and end_num_of_band = 4;
start_num_of_band = 25;
end_num_of_band = 25;

// This is the noise floor for the particular band(s) at hand
threshold = -80.1;

// num_of_data_slots is the number of data slots in each data file, this should not change
  num_of_data_slots = 501


for k = start_num_of_band:end_num_of_band
    // First stage
// allows each file to be chosen
 for j = 1:num_of_samples
     number = string(j);
// this loop will only run once if only one band is being analysed
// It creates all the csv files with only the 501 trace values needed
    // A becomes a list of the comma seperated variables in the raw data file
   A = read_csv('C:\Program Files\Tektronix\SA2600PC\Results'+'/'+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz' + number +'.csv');
   // A_values is a matrix of the trace1 values only
   A_values = A(46:1:546,1);
   //Create the csv file and saves it to results folder on desktop
//write_csv(A_values,'C:\Documents and Settings\pflynn\Desktop\Results' + '/'+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz ' + number +'.csv');

 // A becomes a list of the 501 trace1 values
    // evstr() changes them from string to numerical values because they are stored as strings in the csv files
evstr_A_values = evstr(A_values);

// B is a list of strings of either 1 or 0 depending on wheather the value 
// exceeds the threshold or not.
    //B = string((evstr_A_values>threshold)*1);
//end
// Creates and saves files used for getting duty cycle plots
//write_csv(B,'C:\Documents and Settings\pflynn\Desktop\Threshold data'+ '/th '+ string(T*20) + 'MHz to '+ string((T+1)*20) + 'MHz ' + number +'.csv');


// The first set of threshold data is put into thresh_data
     if(j == 1)
 tresh_data = (evstr_A_values>threshold)*1
 
 max_hold_data = evstr_A_values;
 
 B = ones(num_of_data_slots,num_of_samples);
 B(1:num_of_data_slots,j) = evstr_A_values;
 
 //The remaining sets of data are added to A (makes duty cycle data)
else
    tresh_data = tresh_data + (evstr_A_values>threshold)*1;
    
   // C is a list of 1s and 0s, 1 if B is greater than A at that point, else c is 0
         C = evstr_A_values>max_hold_data;
         // D is the opposite of C
         D = ~C;
        // Values in A are updated if values in B are greater than it at particular points
         max_hold_data = max_hold_data.*D + evstr_A_values.*C;
         
         B(1:num_of_data_slots,j) = evstr_A_values;
         
         
    if j == num_of_samples
    real_tresh_data = tresh_data./num_of_samples
    
    end
end
end
end
//do all plots
// plot max hold graphs
// change directory to the desired location to save these plot files
  cd('C:\Documents and Settings\pflynn\Desktop\Combined plots');
  
  //clear window
   clf();
 
x = (k*20):(1/25):(k+1)*20; 
y = (1:1:num_of_samples);
z = evstr(B);
zm = min(z); zM = max(z);

// setting the colour map

// num_of_colours is the amount of different shades in this colour plot
num_of_colours = round(((max(z)-min(z))*10)+.49)

// num_of_white is the number of colours that are white in order for it to change from white to a colour at the correct threshold
num_of_whites = round(((sqrt((min(z) - threshold)*(min(z) - threshold)))*10)+.49)

// red colour
r = linspace(0,1,(num_of_colours - num_of_whites));

//green colour 
g = zeros(1,(num_of_colours - num_of_whites));
g(1,1:1:((num_of_colours - num_of_whites)/2)) = linspace(0,1,((num_of_colours - num_of_whites)/2))
g(1,(((num_of_colours - num_of_whites)/2)+1):1:(num_of_colours - num_of_whites)) = linspace(1,0,((num_of_colours - num_of_whites)/2))

// Blue colour
b = linspace(1,0,(num_of_colours - num_of_whites));

// sets the color map to white
cmap = ones(num_of_colours,3);
// puts colour into this section of color map
for l = (num_of_whites + 1):num_of_colours
    cmap(l,1)= r(1,(l-num_of_whites));
    cmap(l,2)= g(1,(l-num_of_whites));
    cmap(l,3)= b(1,(l-num_of_whites));
end
xset('colormap',cmap);

subplot(3,2,4)
colorbar(zm,zM,[1 , num_of_colours],fmt="%.2f");
//setting the type of colour plot
//scf(0);

subplot(312)
Sgrayplot(x,y,z);
// setting the axis lable
xtitle("Waterfall plot (power recorded in dBm where detection threshold is exceeded)",'Frequency (MHz)','Time (mins*5)');
// setting the colour bar limits

M = read_csv('C:\Documents and Settings\pflynn\Desktop\Duty cycle plot data'+ '/dc '+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz.csv');


subplot(313)
plot([k*20:(1/25):(k+1)*20],evstr(M))

// give it titles
   xtitle('Fraction of Time','Frequency (MHz)','Fraction of Time');
   
 //MAX Hold  
   
  
   // plot the actual graph
   subplot(311)
   plot([k*20:(1/25):(k+1)*20],max_hold_data)
   
   //threshold line
   plot([k*20:(1/25):(k+1)*20],threshold,'r--') // plots a dash-dotted line with a right-pointing triangle centered on each points
   
   // give it titles
   xtitle('Max Hold','Frequency (MHz)','Power (dBm)'); 

   // exporting the image to jpg file
  xs2jpg(0,'all plots '+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz.jpg');
xs2jpg(gcf(),'/all plots '+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz.jpg')
