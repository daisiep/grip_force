clear all; close all; clc;  

% Plots grip force trace for each trial and sorts into 2, 5 and 10 second
% trials. 
% Will probably need to change the ylimits for each subject.

% Load in y data and time data. 
% load('time_9621_21-Nov-2016_2.mat')
% load('y_9621_21-Nov-2016_2.mat')

% load('time_10859_14-Nov-2016_2.mat')
% load('y_10859_14-Nov-2016_2.mat')

% load('time_3_10-Jan-2017_1.mat')
% load('y_Sub011_03-Mar-2017_run1.mat')

load('time_Sub011_03-Mar-2017_run1.mat')
load('y_Sub011_03-Mar-2017_run1.mat')

% Ordering of runs from experiment 
v = repmat([2 5 10],[1,15]); 

rng(2)
z = randperm(length(v));
run1 = v(z);


time = cell(3,15);
y = cell(3,15);
a= 1; 
b = 1; 
c = 1; 

% Sort out time and force data into 2, 5 and 10 second runs
ii = 1;
for ii = 1:length(run1)
    if run1(ii) == 2
        time{1,a} = t_data{1,ii};
        y{1,a} = y_data{1,ii};
        a = a+1;
    elseif run1(ii) == 5
        time{2,b} = t_data{1,ii};
        y{2,b} = y_data{1,ii};
        b = b+1;
    elseif run1(ii) == 10
        time{3,c} = t_data{1,ii};
        y{3,c} = y_data{1,ii};
        c=c+1;
    end
end

names = [2 5 10];

% Make subplots of all the trials for each duration 
% Will need to edit ylim for each subject

for j = 1:3
    figure('Name',[num2str(names(j)),'s'],'NumberTitle','off')
    for k = 1:15
        subplot(3,5,k)
        plot(nonzeros(time{j,k}),nonzeros(y{j,k})*-1)
        %ylim([-30000, -10000])
        title([num2str(names(j)),'s: ',num2str(k)])
        bsln = mean (y{j,k}(1:50));
        mvf30 = mean (y{j,k}(111:160));
    end
end
