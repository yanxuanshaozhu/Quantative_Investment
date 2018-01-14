%% һ��2015-2016�껦��300ָ��������Ͷ����ϵ�Ӱ��


clear all;
clc;
%%   ������Ϣ
%  ��ϣ�� ����ϵ 15320161152336
%  ˵��������Э�������ǰ�����������ͨ��������ع��еķ����������Խ��߼�һ��С��������ɶԽ�ռ���󣬴Ӷ�ʹ�����ܹ����� 
%% 2015��1-6�²���
%%% ���Ƚ���������ϴ��

% ��������
[dayReturn]=xlsread('2015_1_dayReturn.xlsx',1);
% �ն���������תΪ�껯������
ExpReturn=mean(dayReturn')*246;
% Э�������
m_cov=cov(dayReturn')*246;
% �Խ���Ԫ�ؼ�һ����С����������Э�������תΪ������
ExpCovariance=m_cov+.0001 * eye(299);


%%% ֮������ʲ���Ч�߽磺
%PortRisk     �ʲ���ϵı�׼��
%PortReturn   �ʲ��������
%PortWt       �ʲ����Ȩ��
%rf           �޷�������
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
%�е��sharpe_ratio
max_ratio=max(sharpe_ratio)
[r,c]=find(sharpe_ratio==max_ratio);
%�е��Ȩ����� 
PortWts(c,:);





%% 2015��6-12�²���
%%% ���Ƚ���������ϴ��

% ��������
[dayReturn]=xlsread('2015_6_dayReturn.xlsx',1);
% �ն���������תΪ�껯������
ExpReturn=mean(dayReturn')*246;
% Э�������
m_cov=cov(dayReturn')*246;
% �Խ���Ԫ�ؼ�һ����С����������Э�������תΪ������
ExpCovariance=m_cov+.0001 * eye(300);


%%% ֮������ʲ���Ч�߽磺    
%PortRisk     �ʲ���ϵı�׼��
%PortReturn   �ʲ��������
%PortWt       �ʲ����Ȩ��
%rf           �޷�������
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
%�е��sharpe_ratio
max_ratio=max(sharpe_ratio)
[r,c]=find(sharpe_ratio==max_ratio);
%�е��Ȩ����� 
PortWts(c,:);


%% 2016��106�²���
%%% ���Ƚ���������ϴ��

% ��������
[dayReturn]=xlsread('2016_1_dayReturn.xlsx',1);
% �ն���������תΪ�껯������
ExpReturn=mean(dayReturn')*245;
% Э�������
m_cov=cov(dayReturn')*245;
% �Խ���Ԫ�ؼ�һ����С����������Э�������תΪ������
ExpCovariance=m_cov+.0001 * eye(299);


%%% ֮������ʲ���Ч�߽磺 
%PortRisk     �ʲ���ϵı�׼��
%PortReturn   �ʲ��������
%PortWt       �ʲ����Ȩ��
%rf           �޷�������
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
%�е��sharpe_ratio
max_ratio=max(sharpe_ratio)
[r,c]=find(sharpe_ratio==max_ratio);
%�е��Ȩ����� 
PortWts(c,:);


%% 2016��1-6�²���

%%% ���Ƚ���������ϴ��
% ��������
[dayReturn]=xlsread('2016_6_dayReturn.xlsx',1);
% �ն���������תΪ�껯������
ExpReturn=mean(dayReturn')*245;
% Э�������
m_cov=cov(dayReturn')*245;
% �Խ���Ԫ�ؼ�һ����С����������Э�������תΪ������
ExpCovariance=m_cov+.0001 * eye(299);


%%% ֮������ʲ���Ч�߽磺  
%PortRisk     �ʲ���ϵı�׼��
%PortReturn   �ʲ��������
%PortWt       �ʲ����Ȩ��
%rf           �޷�������
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
%�е��sharpe_ratio
max_ratio=max(sharpe_ratio)
[r,c]=find(sharpe_ratio==max_ratio);
%�е��Ȩ����� 
PortWts(c,:);

%% ����
%2015���ϰ���ͨ����ɢ���ɴ�9.4745��sharpe_ratio
%2015���°���ͨ����ɢ���ɴ�3.4120��sharpe_ratio
%2016���ϰ���ͨ����ɢ���ɴ�2.7386��sharpe_ratio
%2016���°���ͨ����ɢ���ɴ�6.4834��sharpe_ratio

%��ɢ���Ľ�������뻦��300������һ��
%�����˵��2015���ϰ���ͨ����ɢ��ȡ����õĽ��





