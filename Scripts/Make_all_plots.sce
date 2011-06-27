//do all plots
// plot max hold graphs
// change directory to the desired location to save these plot files
if (Analysis_Period == "Week") 
  cd('C:\Documents and Settings\pflynn\Desktop\Combined plots');
 else
     cd('C:\Documents and Settings\pflynn\Desktop\Spectrum Days\Combined plots');
     end
 // num_of_data_slots is the number of data slots in each data file, this should not change
  num_of_data_slots = 501
 
//clear window
 clf();
 // gets handel on current graphics window
 a = gcf();
 // sets the size of the graphics window to its maximum
 a.figure_size = [1280,1024]
  
printf('Setting x axis for plots...\n')
x = linspace(start_freq,end_freq,num_of_data_slots)

printf('Setting y axis for plots...\n')
// Giving y axis the desired length
y = linspace(0,((end_sample -(start_sample -1))/(60)),((end_sample -(start_sample -1)))/compress_factor);

// defining the max and minimum values in z
zm = min(z); zM = max(z);

printf('Setting up the colour bar...\n')
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

printf('Creating the colour Bar...\n')
// Picks the section of plot area to put the colour bar in.
subplot(3,2,4)
// Makes the colour bar
colorbar(zm,zM,[1 , num_of_colours],fmt="%.2f");
//setting the type of colour plot

fig = gcf(); // sets fig as a handel on current graphisx window
a1 = fig.children(1);
a1.font_size = 3; 

// picks the section of plot area for the waterfall plot
subplot(312)
printf('Creating Waterfall Plot...\n')
// Creates the waterfall plot
Sgrayplot(x,y,z);
// setting the axis lable
printf('Editing plot layout(titles etc)...\n')
xset("font size", 3) // sets font size for axis values
xtitle("WATERFALL PLOT (power recorded in dBm where detection threshold is exceeded)",'Frequency (MHz)','Time (hours)');
a = gca() //gets handle of current axis
   a.title.font_size = 3 // sets title fontsize to 5
   a.x_label.font_size = 3 // sets x lable font size to 4
   a.y_label.font_size = 3 // sets y lable font size to 4
   a.x_label.font_style = 2; // sets font style for graph label
   a.title.font_style = 4; // sets font style for graph title
     a.tight_limits = "on" // stops the graph extending beyond data
     a.box = "on"; // Makes sure there is a box around the entire plot

////////////////////////////////////////////////////////////////////////////////

//////////////Duty Cycle Plot Section///////////////////////////////////////////

// M is set to an array of the duty cycle data
if  (Analysis_Period == "Week")
M = read_csv('C:\Documents and Settings\pflynn\Desktop\Duty cycle plot data'+ '/dc '+ band_name + '.csv');
printf('Creating Duty Cycle plot...\n')
else 
    M = read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Days\Duty Cycle Data'+ '/dc '+ band_name + Analysis_Period + '.csv');
printf('Creating Duty Cycle plot...\n')
    end
// picks the section of plot area for the duty cycle plot
subplot(313)
// Makes the duty cycle plot
plot([x],evstr(M))
printf('Editing plot layout(titles etc)...\n')
// give it titles
   xset("font size", 3) // sets font size for axis values
   xtitle('TIME FRACTION(above threshold)','Frequency (MHz)','Fraction of Time');
   a = gca() //gets handle of current axis
   a.title.font_size = 3 // sets title fontsize to 5
   a.x_label.font_size = 3 // sets x lable font size to 4
   a.y_label.font_size = 3; // sets y lable font size to 4
   a.x_label.font_style = 2; // sets font style for graph label
   a.title.font_style = 4; // sets font style for graph title
     a.tight_limits = "on" // stops the graph extending beyond data
   
////////////////////////////////////////////////////////////////////////////////  
   
//////////////////Max Hold Plot Section/////////////////////////////////////////

    // Reads max hold data into array A.
    if (Analysis_Period == "Week") 
   A = read_csv('C:\Documents and Settings\pflynn\Desktop\Max hold plot data'+'/'+'mh '+ band_name +'.csv');
  else 
    A = read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Days\Max Hold Data'+ '/mh '+ band_name + Analysis_Period + '.csv');
    end
   // plot the actual graph
   printf('Creating max hold plot...\n')
   // picks the section of plot area for the duty cycle plot
   subplot(311)
   // Makes the max hold plot
   plot([x],evstr(A))
   printf('Editing plot layout(titles etc)...\n')
   //threshold line
   plot([x],threshold,'r--') // plots a dash-dotted line 
   
   // give it titles
   xset("font size", 3) // sets font size for axis values
   xtitle('MAX HOLD','Frequency (MHz)','Power (dBm)'); 
   a = gca() //gets handle of current axis
   a.title.font_size = 3 // sets title fontsize to 5
   a.x_label.font_size = 3 // sets x lable font size to 4
   a.y_label.font_size = 3 // sets y lable font size to 4
   a.x_label.font_style = 2; // sets font style for graph label
   a.title.font_style = 4;  // sets font style for graph title
     a.tight_limits = "on" // stops the graph extending beyond data
     
   // exporting the image to jpg file
   if  Analysis_Period == "Week"
  xs2jpg(0,'all plots '+ band_name + '.jpg');
xs2jpg(gcf(),'/all plots '+ band_name + '.jpg')
else
    xs2jpg(0,'all plots '+ band_name + Analysis_Period +'.jpg');
xs2jpg(gcf(),'/all plots '+ band_name + Analysis_Period +'.jpg')
end