
load('SUN3Dv1.mat');
n=53146;
m=2788;

for i =200:415
    if (i==89)||(i==315)||(i==314)||(i==312)||(i==311)
        continue
    end
    disp(i);
    name = SUN3D(i);
    data = loadSUN3D(name{1});
    if (length(data.extrinsicsC2W)==0)
        disp('no extrinsics');
        continue
    end
    %intrinsic
    K = eye(4);
    K(1:3, 1:3) = data.K;
    
    for frameID= 60:20:(length(data.image)-30)
        c = clock;
        disp(datestr(datenum(c(1),c(2),c(3),c(4),c(5),c(6))));
        
        Data.image{1} = imread(data.image{frameID-5});
        Data.depth{1} = depthRead(data.depth{frameID-5});
        ext = data.extrinsicsC2W(:,:,frameID-5);
        E = eye(4);
        E(1:3, 1:4) = ext;
        Data.invCameraMatrix{1} = E/K;
        Data.CameraMatric{1} = inv(Data.invCameraMatrix{1});
        Data.ID{1}.name = name;
        Data.ID{1}.frame = frameID - 5;
        %Data.depthFill{1} = backward(data, K, frameID-5, 105);
        
        Data.image{2} = imread(data.image{frameID});
        Data.depth{2} = depthRead(data.depth{frameID});
        ext = data.extrinsicsC2W(:,:,frameID);
        E = eye(4);
        E(1:3, 1:4) = ext;
        Data.invCameraMatrix{2} = E/K;
        Data.CameraMatric{2} = inv(Data.invCameraMatrix{2});
        Data.ID{2}.name = name;
        Data.ID{2}.frame = frameID;
        %Data.depthFill{2} = backward(data, K, frameID, 105);
        
        Data.image{3} = imread(data.image{frameID+5});
        Data.depth{3} = depthRead(data.depth{frameID+5});
        ext = data.extrinsicsC2W(:,:,frameID+5);
        E = eye(4);
        E(1:3, 1:4) = ext;
        Data.invCameraMatrix{3} = E/K;
        Data.CameraMatric{3} = inv(Data.invCameraMatrix{3});
        Data.ID{3}.name = name;
        Data.ID{3}.frame = frameID + 5;
        %Data.depthFill{3} = backward(data, K, frameID+5, 105);
        
        %save
        if (rand>=0.05)
            filename = ['/media/mjia/Seagate Backup Plus Drive/SUN3D/train/', num2str(n, '%07.0f'), '.mat'];
            save(filename, 'Data');
            n = n+1;
        else
            filename = ['/media/mjia/Seagate Backup Plus Drive/SUN3D/val/', num2str(m, '%07.0f'), '.mat'];
            save(filename, 'Data');
            m = m+1;
        end
    
    end  
end




