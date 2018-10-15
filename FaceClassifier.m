[fname path] = uigetfile('.jpg',"Provide a face for testing");
fname = strcat(path,fname);
im = imread(fname);
im = imresize(im , [100,100]);
imshow(im)
title("Input face");

F  = FeatureStatistical(im);
load db.mat
Ftrain = db(:,1:2);
Ctrain = db(: , 3);
for i =1:size(Ftrain,1)
    
dist(i,:) = sum(abs(Ftrain(i,:) - F));
end
Min = min(dist);
if Min<8
    
m = find(dist == min(dist),1);
detClass = Ctrain(m)
if detClass == 1
    sentence = strcat('Detected Person is ', 'Obama');
else
    sentence = strcat('Detected Person is ' , 'Trump');
end
else
    sentence = strcat('He is neither Obama nor Trump');
end
    

    
    
try 
    NET.addAssembly ('System.Speech')
    Speaker = System.Speech.Synthesis.SpeechSynthesizer;
    if ~isa(sentence , 'cell')
        sentence = {sentence};
    end
    for n = 1:length(sentence)
        Speaker.Speak(sentence{n});
    end
end



