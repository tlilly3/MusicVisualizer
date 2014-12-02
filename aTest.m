figure('Renderer','zbuffer')
axis tight manual
F(100) = struct('cdata',[],'colormap',[]);
x = linspace(0,8);
y = sin(x);
h = plot(x,y);
set(h,'XDataSource','x');
set(h,'YDataSource','y');
temp = sin(x.^3);
oy = y;
n = (0:9)'*(temp - y)/9;
z = zeros(1,10);
tic;
for i = 1:10
    y = oy + n(i,:);
    refreshdata(h,'base');
    pause(0.01)
end
y = temp;
temp = sin(x);
oy = y;
n = (0:9)'*(temp - y)/9;
z = zeros(1,10);
for i = 1:10
    y = oy + n(i,:);
    refreshdata(h,'base');
    pause(0.01)
end
toc;