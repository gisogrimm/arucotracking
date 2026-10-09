d = dir('unnamed*.mat');
load(d(end).name)
fh = fopen('data.csv','w');
mPos = data{2}.data;
mField = data{1}.data;
mData = [];
for k=1:size(mPos,2)
  t = mPos(1,k);
  [tmp,idx] = min(abs(mField(1,:)-t));
  vPos = mPos(2:4, k);
  fField = mField(3, idx);
  fprintf(fh,'%g,%g,%g,%g\n',vPos(1),vPos(2),vPos(3),fField);
  mData(k,:) = [vPos(1),vPos(2),vPos(3),fField];
end
fclose(fh);

fh = figure();
fmin = min(mData(:,4));
for k=1:size(mData,1)
  plot3(mData(k,1),mData(k,2),mData(k,3),'bo','markersize',mData(k,4)-fmin+0.1);
  hold on;
end