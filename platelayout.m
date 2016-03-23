function platelayout(x,titular)
if max(size(x)) ==96
    x=reshape(x,8,12);
end
imagesc(x);
title(titular)
set(gca,'YTick', 1:8, 'YTickLabel', {'A','B','C','D','E','F','G','H'})
set(gca,'XTick', 1:12);
colorbar;
hold on
[ii, jj] = find(isnan(x));
scatter(jj,ii,'xr','MarkerEdgeColor',[1 1 1],'MarkerFaceColor',[0 0 0],'LineWidth',2,'SizeData',100)
hold off
end