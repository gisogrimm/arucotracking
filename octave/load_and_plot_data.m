function cData = load_and_plot_data( name, marker )
  data = load([name,'.csv']);
  if isstruct(data)
    data = data.(name);
  end
  if nargin < 2
    marker = unique(data(:,2));
  end
  figure('Name',[name,' rotation z']);
  cData = {};
  for k=1:numel(marker)
    m = marker(k);
    idx = find(data(:,2)==m);
    ldata = data(idx,:);
    ldata(:,3:5) = unwrap(ldata(:,3:5));
    idx = find(diff(ldata(:,1))~=1);
    for l=idx(end:-1:1)'
      ldata = [ldata(1:l,:);...
	       [ldata(l,1)+1,m,nan,nan,nan,nan,nan,nan];...
	       ldata(l+1:end,:)];
    end
    cData{k} = struct('data',ldata,'marker',m);
    plot(ldata(:,1),ldata(:,5)*180/pi,'o-',...
	  'LineWidth',1.5);
    hold on;
  end
  legend(num2str(marker));
  figure('Name',[name,' translation']);
  for k=1:numel(marker)
    m = marker(k);
    idx = find(data(:,2)==m);
    ldata = data(idx,:);
    idx = find(diff(ldata(:,1))~=1);
    for l=idx(end:-1:1)'
      ldata = [ldata(1:l,:);...
	       [ldata(l,1)+1,m,nan,nan,nan,nan,nan,nan];...
	       ldata(l+1:end,:)];
    end
    plot3(ldata(:,6),ldata(:,7),ldata(:,8),'o-',...
	  'LineWidth',1.5);
    hold on;
  end
  legend(num2str(marker));
  plot3([0,0.1],[0,0],[0,0],'r-');
  plot3([0,0],[0,0.1],[0,0],'g-');
  plot3([0,0],[0,0],[0,0.1],'b-');
  text(0,0,0,'cam');
  set(gca,'DataAspectRatio',[1,1,1]);
  