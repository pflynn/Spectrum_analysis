for j = 1:10080
    number = string(j);
    A = read_csv('C:\Program Files\Tektronix\SA2600PC\Results'+'/928MHz to 928MHz' + number +'.csv');
    
    write_csv(A,'C:\Documents and Settings\pflynn\Desktop\testt' + '/902MHz to 928MHz' + number +'.csv');
end