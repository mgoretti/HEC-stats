clear; load('db.mat');

%%
out = [];
sumprod = 0;
current = X(1,1);
credits = 0;
for i=1:size(X,1)
    if ( X(i,1) ~= current) %other user
        %previous user update
        out = [  out; [X(i-1,1) X(i-1,2) sumprod/credits credits]  ];
        %reset for the user
        sumprod = 0;
        credits = 0;
    end;
        sumprod = sumprod + X(i,3) * X(i,4);
        credits = credits + X(i,4);
        current = X(i,1);
end;

[~, indices] = sort(out(:,3), 'descend');
sorted = out(indices, :);
sortedYear = sorted(find(sorted(:,2) == 2014),:)