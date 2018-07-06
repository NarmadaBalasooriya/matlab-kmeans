%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SC556 - Assignment
% Author: Narmada Balasooriya
% Registration Number: PGIS/SC/MSC/CSC/17/06
% k-means implementation
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load fisheriris
X = meas(:,1:4);

%{
% filename
filename = 'iris.txt';

% pattern to analyse the txt file
%formatSpec = [repmat('%*d',1,8-5+1) repmat('%d',1,5) '%[^\n\r]'];
delimiter = ',';
% read file
file = fopen(filename, 'r');
dataArray = textscan(file, '%f,%f,%f,%f','CollectOutput',true);
fclose(file);

data = cell2mat(dataArray(1:4));
fprintf(data);
%}
rng(1);
[idx,C] = kmeans_new_v2(X,3);
[idx_real, Cen_real] = kmeans(X,3);

%% Sepal length vs width

% Plot the iris dataset 
figure;
plot(X(:,1), X(:,2),'*');
title 'Iris Data - Sepal Lengths vs Sepal Widths';
xlabel 'Sepal Lengths (cm)';
ylabel 'Sepal Widths (cm)';
pause;

% plot my kmeans implementation
figure;
plot(X(idx==1, 1), X(idx==1, 2), 'r*', 'MarkerSize', 8);
hold on
plot(X(idx==2, 1), X(idx==2, 2), 'b*', 'MarkerSize', 8);
plot(X(idx==3, 1), X(idx==3, 2), 'g*', 'MarkerSize', 8);
plot(C(:,1), C(:,2),'kx', 'MarkerSize', 10, 'LineWidth', 2);
title ' Sepal Lengths vs Sepal Widths: Cluster Assignments and Centroids - My k-means';
xlabel 'Sepal Lengths (cm)';
ylabel 'Sepal Widths (cm)';
hold off

pause;

% Plot matlab Kmeans implementation
figure;
plot(X(idx_real==1, 1), X(idx_real==1, 2), 'r*', 'MarkerSize', 8);
hold on
plot(X(idx_real==2, 1), X(idx_real==2, 2), 'b*', 'MarkerSize', 8);
plot(X(idx_real==3, 1), X(idx_real==3, 2), 'g*', 'MarkerSize', 8);
plot(Cen_real(:,1), Cen_real(:,2),'kx', 'MarkerSize', 10, 'LineWidth', 2);
title ' Sepal Lengths vs Sepal Widths: Cluster Assignments and Centroids - Matlab k-means';
xlabel 'Sepal Lengths (cm)';
ylabel 'Sepal Widths (cm)';
hold off

%% Petal length vs petal width

% Plot the iris dataset 
figure;
plot(X(:,3), X(:,4),'*');
title 'Iris Data: Petal lengths vs petal widths';
xlabel 'Petal Lengths (cm)';
ylabel 'Petal Widths (cm)';
pause;

% Plot my kmeans implementation

figure;
plot(X(idx==1, 3), X(idx==1, 4), 'r*', 'MarkerSize', 8);
hold on
plot(X(idx==2, 3), X(idx==2, 4), 'b*', 'MarkerSize', 8);
plot(X(idx==3, 3), X(idx==3, 4), 'g*', 'MarkerSize', 8);
plot(C(:,3), C(:,4),'kx', 'MarkerSize', 10, 'LineWidth', 2);
title 'Petal lengths vs petal widths: Cluster Assignments and Centroids - My k-means';
xlabel 'Petal Lengths (cm)';
ylabel 'Petal Widths (cm)';
hold off

pause;

% plot matlab kmeans implementation
figure;
plot(X(idx_real==1, 3), X(idx_real==1, 4), 'r*', 'MarkerSize', 8);
hold on
plot(X(idx_real==2, 3), X(idx_real==2, 4), 'b*', 'MarkerSize', 8);
plot(X(idx_real==3, 3), X(idx_real==3, 4), 'g*', 'MarkerSize', 8);
plot(Cen_real(:,3), Cen_real(:,4),'kx', 'MarkerSize', 10, 'LineWidth', 2);
title 'Petal lengths vs petal widths: Cluster Assignments and Centroids - Matlab k-means';
xlabel 'Petal Lengths (cm)';
ylabel 'Petal Widths (cm)';
hold off