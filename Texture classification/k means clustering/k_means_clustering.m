function [label_final]=k_means_clustering(data,k)

data_t=data;
[N M]=size(data_t);

convergence_flag=true;

%centroids=random_centroid;
random_centroid=datasample(data_t,k,'Replace',false);
centroids=random_centroid;       

%repeats till convergence
while(convergence_flag)   
    
    for i=1:N
        for j=1:k
            eucledian_distance(i,j)=sum((data_t(i,:)-centroids(j,:)).^2);
        end
        [data_y(i) label(i)]=min(eucledian_distance(i,:));
    end
    
    for j=1:k
        centroids_sum=zeros(1,M);
        count=0;
        for i=1:N
            if(label(i)==j)
                centroids_sum=centroids_sum+data_t(i,:);
                count=count+1;
            else
                continue;
            end
            centroids_updated(j,:)=centroids_sum./count;
        end
        
        if(isequal(centroids,centroids_updated))
            convergence_flag=false;
        else
            convergence_flag=true;
            centroids=centroids_updated;      
        end
        
    end
    label_final=label';
end