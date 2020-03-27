function [] = plot_pca(dimensionality_Reduced_data,N)
figure(1);
for i=1:N
    plot3(dimensionality_Reduced_data(1,i),dimensionality_Reduced_data(2,i),dimensionality_Reduced_data(3,i),'*');
    xlabel('1st Principal Component');
    ylabel('2nd Principal Component');
    zlabel('3rd Principal Component');
    hold on;
    grid on;
    num=num2str(i);
    text(dimensionality_Reduced_data(1,i),dimensionality_Reduced_data(2,i),dimensionality_Reduced_data(3,i),num);
end
end

