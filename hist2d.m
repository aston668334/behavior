function [n,xbins,ybins]=hist2d(x,y,xedges,yedges)


% computes bins vectors (as middle of each edges couples)
xbins = mean(cat(1,xedges(1:end-1),xedges(2:end)));
ybins = mean(cat(1,yedges(1:end-1),yedges(2:end)));
% computes bins width vectors and area matrix
xbw = diff(xedges);
ybw = diff(yedges);
[xx,yy] = meshgrid(xbw,ybw);
a = xx.*yy;
% initiate the result matrix
n = zeros(length(ybins),length(xbins));
% main loop to fill the matrix with element counts
for i = 1:size(n,1)
	k = find(y >= yedges(i) & y < yedges(i+1));
	for j = 1:size(n,2)
		n(i,j) = length(find(x(k) >= xedges(j) & x(k) < xedges(j+1)));
	end
end
% plots a 3-D graph with indexed colors

% unit cube XYZ coordinates for patch
ux = [0 1 1 0 0 0;1 1 0 0 1 1;1 1 0 0 1 1;0 1 1 0 0 0];
uy = [0 0 1 1 0 0;0 1 1 0 0 0;0 1 1 0 1 1;0 0 1 1 1 1];
uz = [0 0 0 0 0 1;0 0 0 0 0 1;1 1 1 1 0 1;1 1 1 1 0 1];
for i = 1:size(n,1)
  for j = 1:size(n,2)
    patch(ux*xbw(j) + xedges(j), ...
        uy*ybw(i) + yedges(i), ...
        uz*n(i,j),repmat(n(i,j)/max(n(:)),size(ux)))
  end
    end
% Create zlabel
set(gca,'YDir','reverse');
zlabel('times');
% Create ylabel
ylabel('y posistion(cm)');
% Create xlabel
xlabel('x posistion(cm)');

axis tight
view(3)
rotate3d on
end