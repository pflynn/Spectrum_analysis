// change directory to location whare plots are to be saved
  cd('C:\Documents and Settings\pflynn\Desktop\Waterfall plots');
  
clf()
colorbar(zm,zM,[1 , num_of_colours],fmt="%.2f");
//setting the type of colour plot

fig = gcf(); // sets
a1 = fig.children(1);
a1.font_size = 3; 


stacksize(9000000)
Sgrayplot(x,y,z);
stacksize(5000000)
// setting the axis lable
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
     
     xs2jpg(0,'wf plot '+ band_name + 'MHz.jpg');
xs2jpg(gcf(),'/wf plot '+ band_name + 'MHz.jpg');