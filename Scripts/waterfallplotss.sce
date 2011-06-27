// picks each file
for j = 1:num_of_samples
    // 'number' is used to pick the desired file at hand
    // 'number' has to be a string as it is used as part of a file name 
     number = string(j);
L = read_csv('C:\Documents and Settings\pflynn\Desktop\Results'+ '/'+ string(k*20) + 'MHz to '+ string((k+1)*20) + 'MHz ' + number +'.csv');

if j == 1 then B = ones(num_of_data_slots,num_of_samples);
end

// B is the matrix for the matrix plot data at hand
 B(1:num_of_data_slots,j) = evstr(L);
end
//end
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


colorbar(zm,zM,[1 , num_of_colours],fmt="%.2f");
//setting the type of colour plot

fig = gcf(); // sets
a1 = fig.children(1);
a1.font_size = 3; 


Sgrayplot(x,y,z);
// setting the axis lable
xset("font size", 3) // sets font size for axis values
xtitle("WATERFALL PLOT (power recorded in dBm where detection threshold is exceeded)",'Frequency (MHz)','Time (mins*5)');
a = gca() //gets handle of current axis
   a.title.font_size = 3 // sets title fontsize to 5
   a.x_label.font_size = 3 // sets x lable font size to 4
   a.y_label.font_size = 3 // sets y lable font size to 4
   a.x_label.font_style = 2;
   a.title.font_style = 4;
// setting the colour bar limits