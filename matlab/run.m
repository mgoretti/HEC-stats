a = shaperead('CHE_adm/CHE_adm1.shp');
%plot([a.X], [a.Y]);

Colors = hot(26)

hold on;
for i=1:26
    state = a(i);
    fill(state.X, state.Y, Colors(i,:))
end;


%%
x = [0 1 1 0]
y = [0 0 1 1]

fill(x, y, Colors(10,:))

hold on;

x = [0 -1 -1 0]
y = [0 0 1 1]

fill(x, y, Colors(20,:))

%%
x = [0 1 1 0];
y = [0 0 1 1];
patch(x,y,'red')
%%
vert = [0 0;1 0;1 1;0 1]; % x and y vertex coordinates
fac = [1 2 3 4]; % vertices to connect to make square
patch('Faces',fac,'Vertices',vert,'FaceColor','red')
%%
fvc = [1 0 0;0 1 0;0 0 1;0 0 0];
patch('Faces',fac,'Vertices',vert,...
'FaceVertexCData',fvc,'FaceColor','interp')