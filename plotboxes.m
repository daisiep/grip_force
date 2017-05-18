close all; 
clear all; 
clc; 

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


time2 = cell(1,15);
time5 = cell(1,15);
time10 = cell(1,15);
a= 1; 
b = 1; 
c = 1; 

% Sort out time data into 2, 5 and 10 second runs
ii = 1; 
for ii = 1:length(run1)
    if run1(ii) == 2 
        time2{a} = t_data{1,ii};
        a = a+1;
    elseif run1(ii) == 5
        time5{b} = t_data{1,ii}; 
        b = b+1;
    elseif run1(ii) == 10
        time10{c} = t_data{1,ii}; 
        c=c+1;
    end
end

y2 = cell(1,15);
y5 = cell(1,15);
y10 = cell(1,15);
a= 1; 
b = 1; 
c = 1; 

% Do same for y data
ii = 1; 
for ii = 1:length(run1)
    if run1(ii) == 2 
        y2{a} = y_data{1,ii};
        a = a+1;
    elseif run1(ii) == 5
        y5{b} = y_data{1,ii}; 
        b = b+1;
    elseif run1(ii) == 10
        y10{c} = y_data{1,ii}; 
        c=c+1;
    end
end
  
figure('Name','2s','NumberTitle','off')

% Make subplots of all the trials for each duration 
% Will need to edit ylim for each subject

for k = 1:15; 
   
     subplot(3,5,k)
    %figure(k)
    plot(nonzeros(time2{1,k}),nonzeros(y2{1,k})*-1)
   % ylim([-30000, -10000])
   % ylim([-12500, -9000])
     title(['2s: ',num2str(k)])
      bsln = mean (y2{1,k}(1:50));
   mvf30 = mean (y2{1,k}(111:160));
forces2(k) = bsln - mvf30;
end 

figure('Name','5s','NumberTitle','off')

for k = 1:15;
   
    subplot(3,5,k)
    plot(nonzeros(time5{1,k}),nonzeros(y5{1,k})*-1)
    %ylim([-30000, -10000])
    %ylim([-12500, -9000])
     title(['5s: ',num2str(k)])
      bsln = mean (y5{1,k}(1:50));
   mvf30 = mean (y5{1,k}(111:160));
forces5(k) = bsln - mvf30;
end 
figure('Name','10s','NumberTitle','off')

for k = 1:15;
    
    subplot(3,5,k)
    plot(nonzeros(time10{1,k}),nonzeros(y10{1,k})*-1)
   % ylim([-30000, -10000])
    %ylim([-12500, -9000])
    title(['10s: ',num2str(k)])
     bsln = mean (y10{1,k}(1:50));
   mvf30 = mean (y10{1,k}(111:160));
forces10(k) = bsln - mvf30;
end 


% I don't know what this is for 
diff2 = forces2-4228.8;
diff5= forces5-4228.8;
diff10= forces10-4228.8;

mean(abs(diff2))
mean(abs(diff5))
mean(abs(diff10))
