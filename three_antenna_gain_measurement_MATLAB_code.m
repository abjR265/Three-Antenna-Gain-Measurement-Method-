clc;
clear all;
close all;

R=2.4;pt=10;
%G1 as TX=10dbm ad  G3 as RX
pr31=[-46.1 -36.5 -25.3 -16.8 -14.3 -11.8 -13.3 -12.6 -13.6 -13.7 -14.7 -13.3 -13.9 -13.6 -12.2 -11.9];
%G1 as TX=10dbm and  G2 as RX
pr21=[-22.1	-21.4	-16	-15.7	-18.8	-16.2	-18.7	-17.5	-19.4	-18.8	-21.2	-20.2	-20.4	-22.1	-22.8	-22.5];
%G3 as TX=10dbm and  G2 as RX
pr23=[-46.7	-41.1	-29.3	-23.1	-21.4	-17.3	-18.9	-17.9	-19.4	-19	-20.3	-20.5	-20.6	-23.8	-28.5	-25.9];
c=3*(10^8);
for i=1:17
    f=650:40:1250;
    G13= (20*log10((4*pi*R*f*10^6)/c))+(pr31-10); 
    G12= (20*log10((4*pi*R*f*10^6)/c))+ (pr21-10);
    G32= (20*log10((4*pi*R*f*10^6)/c))+ (pr23-10) ;
    
end
% disp(G13);
 G3=0.5*((G13-G12)+G32);
 G1=0.5*((G12-G32)+G13);
 G2=0.5*((G12-G13)+G32);



f=650:40:1250;
    subplot(3,1,1);
    plot(f,abs(G1));
    title('G1');
    xlabel('Frequency in MHz');
    ylabel('Gain');
    subplot(3,1,2);
    plot(f,abs(G2));
    title('G2');
    xlabel('Frequency in MHz');
    ylabel('Gain');
    subplot(3,1,3);
    plot(f,abs(G3));
    title('G3');
    xlabel('Frequency in MHz');
    ylabel('Gain');
    maxG1=max(max(G1));
    maxG2=max(max(G2));
     maxG3=max(max(G3));
    