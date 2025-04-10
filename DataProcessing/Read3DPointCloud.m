bowl=importdata('yourpath\ourfilename.txt');
x=bowl(:,1);
y=bowl(:,2);
z=bowl(:,3);
figure(1)
scatter3(x,y,z,10,z,'filled');
xlabel('X')
ylabel('Y')
zlabel('Z')
colormap jet;
colorbar;
hold on;