function [textures] = read_textures_test()

cd test
rawFiles = dir('*.raw'); 
numfiles = length(rawFiles);

for k = 1:numfiles 
  mat = readraw(rawFiles(k).name); 
  l=1;
  for i=1:128
      for j=1:128
          out(i,j) = mat(l);
          l = l + 1;
      end
  end
          
  textures{k} = out;
end

cd ..
end

