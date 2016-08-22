%% Demo for the CocoApi (see CocoApi.m)
%% CoCo Directory
cocoDir = 'D:/Êý¾Ý¼¯/COCO';

%% initialize COCO api (please specify dataType/annType below)
dataType='val2014'; annType='person_keypoints'; % specify dataType/annType
annFile=sprintf('%s/annotations/%s_%s.json', cocoDir, annType, dataType);
coco=CocoApi(annFile);


%% get all images containing given categories, select one at random
catIds = coco.getCatIds('catNms',{'person','dog','skateboard'});
imgIds = coco.getImgIds('catIds',catIds);
imgId = imgIds(randi(length(imgIds)));

%% load and display image
img = coco.loadImgs(imgId);
I = imread(sprintf('%s/%s/%s',cocoDir, dataType,img.file_name));
figure(1); imagesc(I); axis('image'); set(gca,'XTick',[],'YTick',[])

%% load and display annotations
annIds = coco.getAnnIds('imgIds',imgId,'catIds',catIds,'iscrowd',[]);
anns = coco.loadAnns(annIds); coco.showAnns(anns);
