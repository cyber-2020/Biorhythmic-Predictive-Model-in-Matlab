% Electrical and Computer Engineering
    clc; close all; clear;

    disp('*******************************************************************');
    disp('Electrical and Computer Engineering');
    disp('*******************************************************************')
    disp('');
    
 % Task 1: Load & Display the data
    %Load the data from the file zzp5data.txt into a matrix called indata.
    %The data consists of a 3 column matrix of dates. 1st column is the
    %year, the 2nd is the month, and the 3rd is the day.

    disp('-------------------------------------------------------------------')
    disp('Task 1: Load the data and display it in a 3 column table')
    disp('-------------------------------------------------------------------')
    disp('        ')   %increases the readability of an output

    indata = load('zzp5data.txt');
    disp('        Year         Month       Day');
    disp('--------------------------------------------');
    disp(indata);
    
    %Used variables/functions in Task 1:
    %indata - matrix[year month day]
    
% Task 2: Develop a Matlab function to find the Julian day number
    %Person's biorhythm requires knowing the number of days since they were
    %born. This may be found by subtracting the birhday from required day.
    %Therefore we need to define a Matlab function that calculates the 
    %Julian day number that can be used to find a person's biorhythm.
    %Julian day = 1721060 + 365y + 31(m-1) + d + [y'/4] - [y'/100] +
    %[y'/400] - x

    
    disp('-------------------------------------------------------------------')
    disp('Task 2: Develop a Matlab function to find the Julian day number')
    disp('-------------------------------------------------------------------')
    disp('        ');

    date=[2008,12,14];          %1st given date
    given_date=julian(date);    %determining the julian day number of 1st given date & output the result
    fprintf('   The julian day number of 2008-12-14 is %7.0f\n',given_date); 
    clear given_date date;      %clearing unnecessary variables
    
    date=[1808,3,15];           %2nd given date
    given_date=julian(date);    %determining the julian day number of 2nd given date & output the result
    fprintf('   The julian day number of 1808-3-15 is %7.0f\n',given_date);
    clear given date date;      %clearing unnecessary variables
    
    data=indata;                       %assigning values of indata to data
    given_date=julian(data);           %determining the julian day number of data that has the same values as indata
    indata_out=[indata,given_date'];   %assigning corresponding values of indata and their julian day number to a 4 column table
    disp('        ');
    disp('   Below is the table that lists corresponding entries of'); 
    disp('   indata date values and their julian day number:');
    disp('        ');
    disp('        Year         Month       Day   Julian day #');   %Table column headings names
    disp('---------------------------------------------------');   
    [r,c]=size(indata_out);
    for k=1:r
        fprintf('        %4.0f\t %7.0f\t %7.0f\t %7.0f\n',indata_out(k,:));          %Table body
    end
    disp('        ');
    clear data given_date indata_out;  %clearing unnecessary variables
    
    %Used variables/functions in Task 1:
    %date - [year month day]
    %given_date - used to store the julian day number of date variable
    %indata_out - used to store the corresponding entries of indata date values 
    %and their julian day number
    
% Task 3: Calculate the biorhythm cycle using given formula sin(2pi()t/p) where t, 
    %define a matlab function cycle(jd,jb,p) which will calculate the appropriate 
    %cycle value on a particular day using is the difference between the current 
    %Julian day number and the Julian day number of the person's birth and p is 
    %the period in days for the particular cycle - physical, emotional, or intellectual. 
    
    disp('--------------------------------------------------------------------')
    disp('Task 3:Calculate the biorhythm cycle using given formula sin(2pi*t/p)')
    disp('--------------------------------------------------------------------')
    disp('        ')   %increases the readability of an output
    
    cycleper = [23,28,33];      %contains the # of days in each of the cycles[phy,emo,int]
    dumbirth=[1978,9,10];       %given date of birth to calculate phy, emo, int cycle values
    cur_date=[2008,9,20];       %given current date to calculate the physical cycle value
    phy_cycle = cycle(cur_date,dumbirth,cycleper(1));
    clear cur_date;
    
    cur_date=[2008,2,14];       %given current date to calculate the emotional cycle value
    emo_cycle = cycle(cur_date,dumbirth,cycleper(2));   
    clear cur_date;
    
    cur_date=[2008,11,23];      %given current date to calculate the physical cycle value
    int_cycle = cycle(cur_date,dumbirth,cycleper(3));
    
    disp('For a birthday of 1978-9-10:')        %Display the phy,emo,int cycles for the given dates
    fprintf('   physical cycle value is %0.5f on 2008-9-20\n',phy_cycle);
    fprintf('   emotional cycle value is %0.5f on 2008-2-14\n',emo_cycle);
    fprintf('   intellectual cycle value is %0.5f on 2008-11-23\n',int_cycle);
    disp('        ')
    clear cur_date dumbirth phy_cycle emo_cycle int_cycle;
    
    birthday=indata(1,:);       %given date of birth to calculate phy, emo, int cycle values
    cur_date=indata(2,:);       %given current date to calculate phy, emo, int cycle values
    phy_cycle = cycle(cur_date,birthday,cycleper(1));
    emo_cycle = cycle(cur_date,birthday,cycleper(2));
    int_cycle = cycle(cur_date,birthday,cycleper(3));
    
    disp('For a birthday of 1732-2-22');        %Display the phy,emo,int cycles for the given dates
    fprintf('   physical cycle value is %0.5f on 1777-12-15\n',phy_cycle);
    fprintf('   emotional cycle value is %0.5f on 1777-12-15\n',emo_cycle);
    fprintf('   intellectual cycle value is %0.5f on 1777-12-15\n',int_cycle);
    
