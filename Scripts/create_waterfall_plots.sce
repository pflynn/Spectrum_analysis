//Make a matrix of the data tand waterfall plots it and show variation in frequency over time
//num_of_samples is the number of samples of a particular band
//num_of_samples = 270;
//num_of_bands is the number of bands of spectrum being used
// band 1 is 20MHz to 40MHz...band 2 is 40MHz to 60MHz..etc
//num_of_bands = 49;
// The waterfall graph must display a threshold point in dBm, whare it changes from white to a colour
//threshold = -81;

// num_of_data_slots is the number of data slots in each data file for duty cycle 
num_of_data_slots = 501
// changes string to one two or three in order to select the different files later

// change directory to location whare plots are to be saved
  cd('C:\Documents and Settings\pflynn\Desktop\Waterfall plots');
  
   for k = start_num_of_band:end_num_of_band
B = ones(num_of_data_slots,num_of_samples);
//for p = 1:num_of_data_slots
//value = 0;
for j = 1:num_of_samples
     number = string(j);
A = read_csv('C:\Documents and Settings\pflynn\Desktop\Results'+ '/'+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz ' + number +'.csv');

//value = evstr(A(p,1));
//upper limit
//if j == 1 then B = ones(num_of_data_slots,num_of_samples);
end
// B is the matrix for the matrix plot data at hand
 B(1:num_of_data_slots,j) = evstr(A);
end
//end

x = (k*20):(1/25):(k+1)*20; 
y = (1:1:num_of_samples);
z = evstr(B);
zm = min(z); zM = max(z);
// clearing the display
clf();
// setting the colour map

// num_of_colours is the amount of different shades in this colour plot
num_of_colours = round(((max(z)-min(z))*10)+.49)

// num_of_white is the number of colours that are white in order for it to change from white to a colour at the correct threshold
num_of_whites = round(((sqrt((min(z) - threshold)*(min(z) - threshold)))*10)+.49)
// red colour
r = linspace(0,1,(num_of_colours - num_of_whites));

//green colour all 0
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

// setting the colour bar limits
colorbar(zm,zM,[1 , num_of_colours],fmt="%.2f");
//setting the type of colour plot
scf(0);
grayplot(x,y,z);
// setting the axis lable
xtitle("Waterfall plot (power recorded in dBm where detection threshold is exceeded)",'Frequency (MHz)','Time (5*mins)');


  // exporting the image to jpg file
  xs2jpg(0,'wf plot '+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz.jpg');
xs2jpg(gcf(),'/wf plot '+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz.jpg')
end