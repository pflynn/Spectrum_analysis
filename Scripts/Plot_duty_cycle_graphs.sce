//Plot and save duty cycle graphs
// num_of_bands is the number of bands to plot
// band 1 is 20MHz to 40MHz...band 2 is 40MHz to 60MHz..etc


// change directory to location whare plots are to be saved
  cd('C:\Documents and Settings\pflynn\Desktop\Duty cycle plots');


//A = read_csv('C:\Documents and Settings\pflynn\Desktop\Duty cycle plot data'+ '/dc '+ band_name + '.csv');
//clear the display
 clf()
scf(0)
plot([x],evstr(M))
a = gca() //gets handle of current axis
   a.title.font_size = 3 // sets title fontsize to 5
   a.x_label.font_size = 3 // sets x lable font size to 4
   a.y_label.font_size = 3; // sets y lable font size to 4
   a.x_label.font_style = 2;
   a.title.font_style = 4;
     a.tight_limits = "on"
  // give it titles
   xtitle('Fraction of Time(above threshold)','Frequency (MHz)','Fraction of Time');
  // exporting the image to jpg file
  xs2jpg(0,'dc plot '+ band_name + '.jpg');
xs2jpg(gcf(),'/dc plot '+ band_name + '.jpg')

