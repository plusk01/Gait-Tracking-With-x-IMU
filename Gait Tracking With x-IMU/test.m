clear, clc, close all;

% X Y Z
t = linspace(0, 5, 1000);
pos = [(2*t)' cos(2*pi*2*t)' sin(2*pi*0.5*t + pi/8)'];

% w + xi + yj + zk
quat = repmat([1 0 0 0], length(t), 1);

samplePeriod = 1;

% -------------------------------------------------------------------------
% Plot 3D foot trajectory

% % Remove stationary periods from data to plot
% posPlot = pos(find(~stationary), :);
% quatPlot = quat(find(~stationary), :);
posPlot = pos;
quatPlot = quat;

% % Extend final sample to delay end of animation
% extraTime = 20;
% onesVector = ones(extraTime*(1/samplePeriod), 1);
% posPlot = [posPlot; [posPlot(end, 1)*onesVector, posPlot(end, 2)*onesVector, posPlot(end, 3)*onesVector]];
% quatPlot = [quatPlot; [quatPlot(end, 1)*onesVector, quatPlot(end, 2)*onesVector, quatPlot(end, 3)*onesVector, quatPlot(end, 4)*onesVector]];

% Create 6 DOF animation
SamplePlotFreq = 4;
Spin = 120;
SixDofAnimation(posPlot, quatern2rotMat(quatPlot), ...
                'SamplePlotFreq', SamplePlotFreq, 'Trail', 'All', ...
                'Position', [9 39 1280 768], 'View', [(100:(Spin/(length(posPlot)-1)):(100+Spin))', 10*ones(length(posPlot), 1)], ...
                'AxisLength', 0.1, 'ShowArrowHead', false, ...
                'Xlabel', 'X (m)', 'Ylabel', 'Y (m)', 'Zlabel', 'Z (m)', 'ShowLegend', false, ...
                'CreateAVI', false, 'AVIfileNameEnum', false, 'AVIfps', ((1/samplePeriod) / SamplePlotFreq));