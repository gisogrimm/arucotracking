function load_and_plot_data( name, marker )
  s = load([name,'.csv']);
  data = s.(name);
  if nargin < 2
    marker = unique(data(:,2))
  end
  figure('Name',name);
  subplot(2,1,1);
  for m=marker
    idx = find(data(:,2)==m);
    plot(data(idx,1),unwrap(data(idx,3:5))*180/pi);
    hold on;
  end
  subplot(2,1,2);
  for m=marker
    idx = find(data(:,2)==m);
    plot(data(idx,1),data(idx,6:8));
    hold on;
  end