function plate=smoothtransposedplate(plate)
newplate=reshape(permute(reshape(plate,size(plate,1),12,8),[1 3 2]),size(plate,1),96,1);
smoothplate=zeros(size(newplate,1),96);
for i=1:96
smoothplate(:,i)=smooth(newplate(:,i),'lowess');
end
% remove zero...
plate = (smoothplate - repmat(min(smoothplate),size(smoothplate,1),1));
end
