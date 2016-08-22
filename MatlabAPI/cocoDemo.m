%% Demo for the CocoApi (see CocoApi.m)

%% initialize COCO api (please specify dataType/annType below)
annTypes = { 'instances', 'captions', 'person_keypoints' };
dataType='val2014'; annType=annTypes{3}; % specify dataType/annType
annFile=sprintf('D:/数据集/COCO/annotations/%s_%s.json',annType,dataType);
coco=CocoApi(annFile);

%% display COCO categories and supercategories
if( ~strcmp(annType,'captions') )
  cats = coco.loadCats(coco.getCatIds());
  nms={cats.name}; fprintf('COCO categories: ');
  fprintf('%s, ',nms{:}); fprintf('\n');
  nms=unique({cats.supercategory}); fprintf('COCO supercategories: ');
  fprintf('%s, ',nms{:}); fprintf('\n');
end

%% get all images containing given categories, select one at random
catIds = coco.getCatIds('catNms',{'person','dog','skateboard'});
imgIds = coco.getImgIds('catIds',catIds);
imgId = imgIds(randi(length(imgIds)));

%% load and display image
img = coco.loadImgs(imgId);
I = imread(sprintf('D:/数据集/COCO/%s/%s',dataType,img.file_name));
figure(1); imagesc(I); axis('image'); set(gca,'XTick',[],'YTick',[])

%% load and display annotations
annIds = coco.getAnnIds('imgIds',imgId,'catIds',catIds,'iscrowd',[]);
anns = coco.loadAnns(annIds); coco.showAnns(anns);
