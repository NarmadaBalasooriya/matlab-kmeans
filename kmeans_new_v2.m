%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SC556 - Assignment
% Author: Narmada Balasooriya
% Registration Number: PGIS/SC/MSC/CSC/17/06
% k-means algorithm
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [indices, centroids] = kmeans_new_v2(X, k)
    %% Variable Initializations %$
    Y = X;
    [rows,m] = size(Y); % get the size of the dataset
    max_iterations = 10; % set the maximum number of iterations
    centroids = zeros(k, m); % initialize the centroids
    Y_new = Y; % create Y_new -> which will change
    rand_datapoint_size = floor(rows/k); % random data point size for a cluster
    iter = 0;
    min_dis = 0;
    
    %% Centroid Initialization %%
    % select some random datapoints and get the centroids
    for i=1:k
        new_idx = (1:rand_datapoint_size);
        random_cluster = Y_new(new_idx, :);
        centroids(i,:) = mean(random_cluster); % generate the centroid
        Y_new(new_idx,:) = []; % remove the used rows
    end
    
    %% Main Loop %%
    
    while(1)
        iter = iter + 1; % iterate
        
        %% Distance computation %%
        % compute the distance from each datapoint to centroid and get the
        % minimum distance and the corresponding index of the centroid list
        
        for n=1:rows
            
            minIdx = 1; % Idx of minimum distance
            min_dis = norm(Y(n,:)-centroids(minIdx,:),2); 
            
           for j = 1:k
                dist = norm(centroids(j,:)-X(n,:),1);
                if(dist < min_dis)% check for the minimum distance
                    min_dis = dist; 
                    minIdx = j; % change the index
                end
           end
           indices(n) = minIdx; % update the indices vector
        end
        
        %% Recalculate the centroids %%
        
        for x=1:k
            %caculate the new mean for the clusters -> centroids
            centroids(x,:) = sum(Y(find(indices==x),:)); 
            centroids(x,:) = centroids(x,:) / length(find(indices==x));
        
        end
        
        %% convergence criteria
        if(min_dis < 0.01)
            break;
        end
        
        %% convergence criteria - alternative
        if(iter>max_iterations)
            break;
        end
    end

end
