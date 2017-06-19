clear all
close all
%-----------------------
%input intensity can be seen in Watts for the 830nm LED, but for 660nm it
%isn't
%suggested we just test the circuit at multiple values and build up a table
%of different values for intensity

% % intensity660 = %set this value, 10 is just a place filler at the moment;
% % OD660 = -log10(intensity660);
% % OD830 = -log10(intensity830);
% % Sl = %will be derived, maybe use the paper
% % Al = OD - Sl;

% these are values given by paper using their wavelengths, later will need
% to switch to 660 and 830

intensity730 = 10^-8;
intensity850 = 10^-8;
OD730 = -log10(intensity730);
OD850 = -log10(intensity850);
OD = [OD730; OD850];

wavelength1 = 730;
wavelength2 = 850;
% CONSTANTS
% units are in mm^-1
mua1 = 0.015;% absorption coefficient for wavelength 1
mua2 = 0.023;% absorption coefficient for wavelength 2
mus1 = 0.80;% reduced scattering coefficient for wavelength 1
mus2 = 0.95;% reduced scattering coefficient for wavelength 2

%specific extinction coefficients of blood chromophores for wavelengths
%units are in mM^-1cm^-1
epsHbO21 = 0.4383;%HbO2 for wavelength 1 = 730nm
epsHb1 = 1.3029;%Hb for wavelength 1 = 730nm
epsHbO22 = 1.1596;%Hbo2 for wavelength 2 = 850nm
epsHb2 = 0.7861;%Hb for wavelength 2 = 850nm

% % epsHbO21 = 0.3346;%HbO2 for wavelength 1 = 660nm
% % epsHb1 = 3.4408;%Hb for wavelength 1 = 660nm
% % epsHbO22 = 1.0507;%Hbo2 for wavelength 2 = 830nm
% % epsHb2 = 0.7804;%Hb for wavelength 2 = 830nm

eps = [epsHbO21 epsHbO22; epsHb1 epsHb2];
%distance between the light source and the detector
d = 20;%mm

%differential path factor, there is one value per wavelength
%DPF1 = 0.5*(((3*mus1)/mua1)^(1/2))*(1-(1/(1+(d*((3*mua1*mus1*(10^-6))^(1/2))))));
DPF1 = 0.5*(((3*mus1)/mua1)^(1/2))*(1-(1/(1+(d*((3*mua1*mus1)^(1/2))))));
DPF2 = 0.5*(((3*mus2)/mua2)^(1/2))*(1-(1/(1+(d*((3*mua2*mus2)^(1/2))))));

DPF = [DPF1 0; 0 DPF2];
M = (d*0.1).* (eps*DPF)';%0.1 factor converts d from mm to cm
%calculate concentration from epsilon, DPF and OD
deltaConcentration = inv(M) * OD;
deltaConcentration_HbO2 = deltaConcentration(1);%change in HbO2 concentration
deltaConcentration_Hb = deltaConcentration(2);%change in Hb concentration
%use concentration values to give values for oxygenation and blood volume
OXY = deltaConcentration_HbO2 - deltaConcentration_Hb;%oxygenation in tissue due to hemodynamic activation
BV = deltaConcentration_HbO2 + deltaConcentration_Hb;%blood volume changes in tissue due to hemodynamic activation