//clear window
 clf();
 // gets handel on current graphics window
 a = gcf();
 // sets the size of the graphics window to its maximum
 a.figure_size = [1280,1024]

A (1,1)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 30MHz to 54MHz.csv'));
A (1,2)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 54MHz to 88MHz.csv'));
//A (1,3)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 108MHz to 138MHz.csv'));
//A (1,4)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 138MHz to 174MHz.csv'));
A (1,5)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 174MHz to 216MHz.csv'));
//A (1,6)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 216MHz to 225MHz.csv'));
//A (1,7)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 225MHz to 406MHz.csv'));
//A (1,8)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 406MHz to 470MHz.csv'));
//A (1,9)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 470MHz to 512MHz.csv'));
A (1,10)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 512MHz to 608MHz.csv'));
//A (1,11)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 608MHz to 698MHz.csv'));
//A (1,12)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 698MHz to 806MHz.csv'));
A (1,13)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 806MHz to 902MHz.csv'));
//A (1,14)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 902MHz to 928MHz.csv'));
A (1,15)= evstr(read_csv('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files'+'/SO 928MHz to 1000MHz.csv'));
barh(A)
a = gca();


 
a.y_ticks.labels = ["30MHz to 54MHz";"54MHz to 88MHz";"108MHz to 138MHz";"138MHz to 174MHz";"174MHz to 216MHz";"216MHz to 225MHz";"225MHz to 406MHz";"406MHz to 470MHz";"470MHz to 512MHz";"512MHz to 608MHz";"608MHz to 698MHz";"698MHz to 806MHz";"806MHz to 902MHz";"902MHz to 928MHz";"928MHz to 1000MHz"]

a.data_bounds = [0,0;100,15.5]

//a.x_ticks.locations = [0;12.5;25;37.5;50;62.5;75;87.5;100]
a.x_ticks.labels = ["0%";"10%";"20%";"30%";"40%";"50%";"60%";"70%";"80%";"90%";"100%"]

xset("font size", 3) // sets font size for axis values
xtitle("Measured Spectrum Occupancy - TSSG Rooftop - March to August 2011",'Percentage Occupancy (Over Time and Frequency)');

a.title.font_size = 5 // sets title fontsize to 5
   a.x_label.font_size = 3 // sets x lable font size to 4
   a.y_label.font_size = 3 // sets y lable font size to 4
   a.x_label.font_style = 2; // sets font style for graph label
   a.title.font_style = 4; // sets font style for graph title
   
   // change directory to the desired location to save the plot files
  cd('C:\Documents and Settings\pflynn\Desktop\Spectrum Occupancy Files');
  
 
// exporting the image to jpg file
  xs2jpg(0,'Spectrum Occupancy.jpg');
xs2jpg(gcf(),'Spectrum Occupancy.jpg')