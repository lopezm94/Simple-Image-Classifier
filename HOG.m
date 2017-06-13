%Image descriptor based on Histogram of Orientated Gradients for gray-level images.
function H = HOG(obj)
    Im = obj.image;
    box = obj.box(:);
    v(1:2) = box(1:2);
    v(3:4) =box(3:4)-box(1:2);
    Im = imcrop(Im, v);
    if size(Im,3) == 3
        Im = rgb2gray(Im);
    end
    nwin_x=12;%number of HOG windows per bound box
    nwin_y=12;
    B=9;%number of histogram bins
    [L,C]=size(Im); % L num of lines ; C num of columns
    H=zeros(nwin_x*nwin_y*B,1); % column vector with zeros
    
    Im=double(Im);
    step_x=floor(C/(nwin_x+1));
    step_y=floor(L/(nwin_y+1));
    cont=0;
    hx = [-1,0,1];
    hy = -hx';
    grad_xr = imfilter(double(Im),hx);
    grad_yu = imfilter(double(Im),hy);
    angles=atan2(grad_yu,grad_xr);
    magnit=sqrt((grad_yu.^2)+(grad_xr.^2));
    for n=0:nwin_y-1
        for m=0:nwin_x-1
            cont=cont+1;
            angles2=angles(n*step_y+1:(n+2)*step_y,m*step_x+1:(m+2)*step_x); 
            magnit2=magnit(n*step_y+1:(n+2)*step_y,m*step_x+1:(m+2)*step_x);
            v_angles=angles2(:);    
            v_magnit=magnit2(:);
            %assembling the histogram with 9 bins (range of 20 degrees per bin)
            bin=0;
            H2=zeros(B,1);
            for ang_lim=-pi+2*pi/B:2*pi/B:pi
                bin=bin+1;
                idx = find(v_angles<=ang_lim); 
                v_angles(idx) = 100; 
                H2(bin) = H2(bin) + sum(v_magnit(idx));
            end

            H2=H2/(norm(H2)+0.01);        
            H((cont-1)*B+1:cont*B,1)=H2;
        end
    end