// plot max hold graphs
// change directory to the desired location to save these plot files
  cd('C:\Documents and Settings\pflynn\Desktop\Max hold plots');

  clf()
  plot([x],evstr(A))
   
   //threshold line
   plot([x],threshold,'r--') // plots a dash-dotted line 
   
   // give it titles
   xset("font size", 3) // sets font size for axis values
   xtitle('MAX HOLD','Frequency (MHz)','Power (dBm)'); 
   a = gca() //gets handle of current axis
   a.title.font_size = 3 // sets title fontsize to 5
   a.x_label.font_size = 3 // sets x lable font size to 4
   a.y_label.font_size = 3 // sets y lable font size to 4
   a.x_label.font_style = 2; 
   a.title.font_style = 4;  
     a.tight_limits = "on"
  
  xs2jpg(0,'mh plot '+ band_name');
xs2jpg(gcf(),'/mh plot '+ band_name + 'MHz.jpg')
 //end