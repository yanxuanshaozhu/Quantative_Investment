%% 一、2015-2016年沪深300指数调整对投资组合的影响


clear all;
clc;
%%   个人信息
%  yanxuanshaozhu
%  说明：由于协方差矩阵非半正定，可以通过类似岭回归中的方法，在主对角线加一个小的正数变成对角占优阵，从而使问题能够处理 
%% 2015年1-6月部分
%%% 首先进行数据清洗：

% 导入数据
[dayReturn]=xlsread('2015_1_dayReturn.xlsx',1);
% 日对数收益率转为年化收益率
ExpReturn=mean(dayReturn')*246;
% 协方差矩阵
m_cov=cov(dayReturn')*246;
% 对角线元素加一个很小的正数，将协方差矩阵转为半正定
ExpCovariance=m_cov+.0001 * eye(299);


%%% 之后计算资产有效边界：
%PortRisk     资产组合的标准差
%PortReturn   资产组合收益
%PortWt       资产组合权重
%rf           无风险利率
NumPorts=200;
p = Portfolio;
p = setAssetMoments(p, ExpReturn, ExpCovariance);
p = setDefaultConstraints(p);
figure;
plotFrontier(p, NumPorts);
PortWts = estimateFrontier(p, NumPorts);
[PortRisk, PortReturn] = estimatePortMoments(p, PortWts);

rf=0.0369;
for i=1:200
    sharpe_ratio(i)=(PortReturn(i,1)-rf)/PortRisk(i,1);
end
%切点的sharpe_ratio
max_ratio=max(sharpe_ratio)
[r,c]=find(sharpe_ratio==max_ratio);
%切点的权重组合 
PortWts(c,:);





%% 2015年6-12月部分
%%% 首先进行数据清洗：

% 导入数据
[dayReturn]=xlsread('2015_6_dayReturn.xlsx',1);
% 日对数收益率转为年化收益率
ExpReturn=mean(dayReturn')*246;
% 协方差矩阵
m_cov=cov(dayReturn')*246;
% 对角线元素加一个很小的正数，将协方差矩阵转为半正定
ExpCovariance=m_cov+.0001 * eye(300);


%%% 之后计算资产有效边界：    
%PortRisk     资产组合的标准差
%PortReturn   资产组合收益
%PortWt       资产组合权重
%rf           无风险利率
NumPort=200;
p = Portfolio;
p = setAssetMoments(p, ExpReturn, ExpCovariance);
p = setDefaultConstraints(p);
figure;
plotFrontier(p, NumPorts);
PortWts = estimateFrontier(p, NumPorts);
[PortRisk, PortReturn] = estimatePortMoments(p, PortWts);
rf=0.0369;
for i=1:200
    sharpe_ratio(i)=(PortReturn(i,1)-rf)/PortRisk(i,1);
end
%切点的sharpe_ratio
max_ratio=max(sharpe_ratio)
[r,c]=find(sharpe_ratio==max_ratio);
%切点的权重组合 
PortWts(c,:);


%% 2016年106月部分
%%% 首先进行数据清洗：

% 导入数据
[dayReturn]=xlsread('2016_1_dayReturn.xlsx',1);
% 日对数收益率转为年化收益率
ExpReturn=mean(dayReturn')*245;
% 协方差矩阵
m_cov=cov(dayReturn')*245;
% 对角线元素加一个很小的正数，将协方差矩阵转为半正定
ExpCovariance=m_cov+.0001 * eye(299);


%%% 之后计算资产有效边界： 
%PortRisk     资产组合的标准差
%PortReturn   资产组合收益
%PortWt       资产组合权重
%rf           无风险利率
NumPort=200;
p = Portfolio;
p = setAssetMoments(p, ExpReturn, ExpCovariance);
p = setDefaultConstraints(p);
figure;
plotFrontier(p, NumPorts);
PortWts = estimateFrontier(p, NumPorts);
[PortRisk, PortReturn] = estimatePortMoments(p, PortWts);
rf=0.029;
for i=1:200
    sharpe_ratio(i)=(PortReturn(i,1)-rf)/PortRisk(i,1);
end
%切点的sharpe_ratio
max_ratio=max(sharpe_ratio)
[r,c]=find(sharpe_ratio==max_ratio);
%切点的权重组合 
PortWts(c,:);


%% 2016年1-6月部分

%%% 首先进行数据清洗：
% 导入数据
[dayReturn]=xlsread('2016_6_dayReturn.xlsx',1);
% 日对数收益率转为年化收益率
ExpReturn=mean(dayReturn')*245;
% 协方差矩阵
m_cov=cov(dayReturn')*245;
% 对角线元素加一个很小的正数，将协方差矩阵转为半正定
ExpCovariance=m_cov+.0001 * eye(299);


%%% 之后计算资产有效边界：  
%PortRisk     资产组合的标准差
%PortReturn   资产组合收益
%PortWt       资产组合权重
%rf           无风险利率
NumPort=200;
p = Portfolio;
p = setAssetMoments(p, ExpReturn, ExpCovariance);
p = setDefaultConstraints(p);
figure;
plotFrontier(p, NumPorts);
PortWts = estimateFrontier(p, NumPorts);
[PortRisk, PortReturn] = estimatePortMoments(p, PortWts);
rf=0.029;
for i=1:200
    sharpe_ratio(i)=(PortReturn(i,1)-rf)/PortRisk(i,1);
end
%切点的sharpe_ratio
max_ratio=max(sharpe_ratio)
[r,c]=find(sharpe_ratio==max_ratio);
%切点的权重组合 
PortWts(c,:);

%% 结论
%2015年上半年通过分散化可达9.4745的sharpe_ratio
%2015年下半年通过分散化可达3.4120的sharpe_ratio
%2016年上半年通过分散化可达2.7386的sharpe_ratio
%2016年下半年通过分散化可达6.4834的sharpe_ratio

%分散化的结果基本与沪深300的走势一致
%相对来说，2015年上半年通过分散化取得最好的结果





