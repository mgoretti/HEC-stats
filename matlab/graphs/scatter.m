clear; load('data.mat')

%%
set1 = old2(:,2)';
set2 = old3(:,2)';
theta = linspace(0, 2*pi, size(set1, 2));
%%
set1 = new2(:,2)';
set2 = new3(:,2)';
theta = linspace(0, 2*pi, size(set1, 2));
%% polar
h = polar(theta, set1, 'mo');
set(findobj(h,'Type', 'line'), ...
'MarkerEdgeColor', 'blue', ...
'MarkerSize', 20);
hold on;

v = polar(theta, set2, 'mo');
set(findobj(v,'Type', 'line'), ...
'MarkerEdgeColor', 'red', ...
'MarkerSize', 20);

%circle
angle = 0:0.01:2*pi
polar(angle, ones(size(angle))*1.96, '-');

%% 
set1 = old2
set2 = old3
%%
set1 = new2
set2 = new3
%% scatter
h = plot(set1(:,2), set1(:,1), '+')
set(findobj(h,'Type', 'line'), ...
'MarkerEdgeColor', 'blue', ...
'MarkerSize', 20);
hold on;

v = plot(set2(:,2), set2(:,1), '+')
set(findobj(v,'Type', 'line'), ...
'MarkerEdgeColor', 'red', ...
'MarkerSize', 20);
legend('cours 2e', 'cours 3e', 'Location', 'southeast')
xlabel('t-value')
ylabel('\beta')
set(gca,'FontSize',40)
set(findall(gcf,'type','text'),'FontSize',30,'fontWeight','bold')

hFig = figure(1);
set(hFig, 'Position', [0,0, 1500, 1500])
%line
line([1.96 1.96], get(gca, 'ylim'));
line([-1.96 -1.96], get(gca, 'ylim'));
hline(0);
vline(0);