function SpecificTask1(xvector1, yvector1)
%CREATEFIGURE(xvector1, yvector1)
%  XVECTOR1:  bar xvector
%  YVECTOR1:  bar yvector

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.11 0.718214285714286 0.811428571428571]);
hold(axes1,'on');

% Create bar
bar(xvector1,yvector1,'BarWidth',0.5);

% Create ylabel
ylabel({'Percentage of Correctly Classified Digits'});

% Create xlabel
xlabel({'Number of Singular Vectors as Basis used for Classification'});

% Create title
title({'Specific Task 1'});

% text(1:length(Y), Y', num2str(Y'),'HorizontalAlignment','center','VerticalAlignment','bottom')


% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0.866359447004608 26.3663594470046]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[0 100]);
box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTick',[5 10 15 20]);