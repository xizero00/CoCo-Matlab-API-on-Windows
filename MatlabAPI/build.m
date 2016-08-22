% author: xizero00
% date:2016/8/22
% email:xizero00@gmail.com

dir1 = '../common';
dir2 = './private';
% build gason 

files = dir([dir2, '/*.cpp']);
c_files = [];
for i=1:numel(files)
    c_files = [c_files, fullfile(dir2, files(i).name), ' '];
end

c_files = strtrim(c_files);
opts = {};
opts{end+1} = '-v';
opts{end+1} = '-n';
opts{end+1} = ['-I"' dir1 '"'];
opts{end+1} = ['-L"' dir1, '"'];
opts{end+1} = '-lgason';
opts{end+1} = '-lmaskApi';
opts{end+1} = '-largeArrayDims';
mopts = {c_files, opts{:}};

mex(mopts{:});

files = dir([dir2, '/*.c']);
c_files = [];
for i=1:numel(files)
    c_files = [c_files, fullfile(dir2, files(i).name), ' '];
end
mopts = {c_files, opts{:}};

mex(mopts{:});