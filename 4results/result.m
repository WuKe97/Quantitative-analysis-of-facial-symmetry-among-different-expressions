clear;
clc;
load('asymfeature.mat');


%result1
zasymfea=zscore(asymfea);
[pc,score,latent,tsquare] = pca(zasymfea);
pc1=latent(1)/sum(latent);
xlab=['PC1(',num2str(round(pc1*10000)/100),'%)'];
pc2=latent(2)/sum(latent);
ylab=['PC2(',num2str(round(pc2*10000)/100),'%)'];
pzasymfea= zasymfea*pc(:,1:5);
hfig =  figure('color','w');
axes1 = axes('Parent',hfig); 
mappedX = tsne(pzasymfea,'Algorithm','Exact','Distance','seuclidean','NumDimensions',2,'NumPCAComponents',2);
% Plot results
gscatter(mappedX(1:30,1), mappedX(1:30,2),label_class(1:30),'y');hold on;
gscatter(mappedX(31:59,1), mappedX(31:59,2),label_class(31:59),'m');hold on;
gscatter(mappedX(60:91,1), mappedX(60:91,2),label_class(60:91),'c');hold on;
gscatter(mappedX(92:122,1), mappedX(92:122,2),label_class(92:122),'r');hold on;
gscatter(mappedX(123:152,1), mappedX(123:152,2),label_class(123:152),'g');hold on;
gscatter(mappedX(153:183,1), mappedX(153:183,2),label_class(153:183),'b');hold on;
gscatter(mappedX(184:213,1), mappedX(184:213,2),label_class(184:213),'k');hold on;
xlabel(xlab);
ylabel(ylab);
hold on;
set(legend('AN','DI','FE','HA','NE','SA','SU'));


%result2
zasymfea=zscore(asymfea);
szasymfea=sum(zasymfea,2);
l11=0;l12=0;l13=0;
l21=0;l22=0;l23=0;
l31=0;l32=0;l33=0;
l41=0;l42=0;l43=0;
l51=0;l52=0;l53=0;
l61=0;l62=0;l63=0;
l71=0;l72=0;l73=0;
z1=min(szasymfea)+(max(szasymfea)-min(szasymfea))/3;
z2=min(szasymfea)+(max(szasymfea)-min(szasymfea))/3*2;
for i=1:213
  if szasymfea(i)<z1
      if label_class(i)==1
          l11=l11+1;
      elseif label_class(i)==2
          l21=l21+1;
      elseif label_class(i)==3
          l31=l31+1;
      elseif label_class(i)==4
          l41=l41+1;
      elseif label_class(i)==5
          l51=l51+1;
      elseif label_class(i)==6
          l61=l61+1;
      elseif label_class(i)==7
          l71=l71+1;
      end
  elseif szasymfea(i)<z2
      if label_class(i)==1
          l12=l12+1;
      elseif label_class(i)==2
          l22=l22+1;
      elseif label_class(i)==3
          l32=l32+1;
      elseif label_class(i)==4
          l42=l42+1;
      elseif label_class(i)==5
          l52=l52+1;
      elseif label_class(i)==6
          l62=l62+1;
      elseif label_class(i)==7
          l72=l72+1;
      end
  else
      if label_class(i)==1
          l13=l13+1;
      elseif label_class(i)==2
          l23=l23+1;
      elseif label_class(i)==3
          l33=l33+1;
      elseif label_class(i)==4
          l43=l43+1;
      elseif label_class(i)==5
          l53=l53+1;
      elseif label_class(i)==6
          l63=l63+1;
      elseif label_class(i)==7
          l73=l73+1;
      end
  end
end