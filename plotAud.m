function plotAud(cmap,freq,db)



surf(1:19, 1:19, circleIt(freq,db));
grid off
axis off
axis([0 19 0 19 -0.005 0.08])
colormap(lower(cmap))










end