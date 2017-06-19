clear all
close all
%-----------------------
%input data shall be current into the LED and current out of the photodiode

Iin = 0.038;%A this value isn't actually used in the script, it is used to reference
%a graph in the data sheet to find mW/sr

Vout830 = 0.5;
Vout660 = 0.6;
R = 2200000;
Iout830 = Vout830/R;%A
Iout660 = Vout660/R;%A
%use the non-linear regression fit to approximate photopic spectral
%luminous efficiency curve for the wavelengths 660nm and 830nm
PSLE660 = 1.019*exp(-285.4*((0.660-0.559)^2));
PSLE830 = 1.019*exp(-285.4*((0.830-0.559)^2));
%according to definition of a candela, 683 lumens per watt for 555nm light in vacuum
photosensitivity660 = 0.38;%A/W
photosensitivity830 = 0.5;%A/W
%conversion from amps to lumens
outputIntensity660 = PSLE660 * (Iout660/photosensitivity660) * 683;%lumens
outputIntensity830 = PSLE830 * (Iout830/photosensitivity830) * 683;%lumens
% the following mW/sr were derived from the LED graphs in the datasheets
%https://www.mathsisfun.com/geometry/steradian.html convert W/sr to W
WattsSteradian660 = 0.030;% this is at the 38mA value W/sr check with Ed
WattsSteradian830 = 0.015;% at 38mA into the LED W/sr check with Ed and datasheet?

Watts660 = ((1.3^2)/(15^2))*WattsSteradian660;%Watts
Watts830 = ((1.3^2)/(15^2))*WattsSteradian830;%Watts

inputIntensity660 = PSLE660 * Watts660 * 683;%lumens
inputIntensity830 = PSLE830 * Watts830 * 683;%lumens

deltaIntensity660 = outputIntensity660/inputIntensity660;
deltaIntensity830 = outputIntensity830/inputIntensity830;
OD660 = -log10(deltaIntensity660);
OD830 = -log10(deltaIntensity830);
OD = [OD660; OD830];

wavelength1 = 660;
wavelength2 = 830;
% CONSTANTS
% units are in mm^-1

% mua_730 = 0.015;% absorption coefficient for 730nm
mua_850 = 0.023;% absorption coefficient for 850nm
% mus_730 = 0.80;% reduced scattering coefficient for 730nm
mus_850 = 0.95;% reduced scattering coefficient for850nm

mua_660 = 0.02;% absorption coefficient for 630nm assuming similar and using
%due to lack of available data (lower limit from paper)
mua_830 = mua_850;% due to lack of data available, assuming similar 
mus_660 = 0.64;% reduced scattering coefficient for 630nm assuming similar
%and using due to lack of available data (lower limit from paper)
mus_830 = mus_850;% due to lack of data available, assuming similar

%specific extinction coefficients of blood chromophores for wavelengths
%units are in mM^-1cm^-1
% % epsHbO21 = 0.4383;%HbO2 for wavelength 1 = 730nm
% % epsHb1 = 1.3029;%Hb for wavelength 1 = 730nm
% % epsHbO22 = 1.1596;%Hbo2 for wavelength 2 = 850nm
% % epsHb2 = 0.7861;%Hb for wavelength 2 = 850nm

epsHbO21 = 0.3346;%HbO2 for wavelength 1 = 660nm
epsHb1 = 3.4408;%Hb for wavelength 1 = 660nm
epsHbO22 = 1.0507;%Hbo2 for wavelength 2 = 830nm
epsHb2 = 0.7804;%Hb for wavelength 2 = 830nm

eps = [epsHbO21 epsHbO22; epsHb1 epsHb2];
%distance between the light source and the detector
d = 20;%mm

%differential path factor, there is one value per wavelength
%DPF1 = 0.5*(((3*mus1)/mua1)^(1/2))*(1-(1/(1+(d*((3*mua1*mus1*(10^-6))^(1/2))))));
DPF1 = 0.5*(((3*mus_660)/mua_660)^(1/2))*(1-(1/(1+(d*((3*mua_660*mus_660)^(1/2))))));
DPF2 = 0.5*(((3*mus_830)/mua_830)^(1/2))*(1-(1/(1+(d*((3*mua_830*mus_830)^(1/2))))));

DPF = [DPF1 0; 0 DPF2];
M = (d*0.1).* (eps*DPF)';%0.1 factor converts d from mm to cm
%calculate concentration from epsilon, DPF and OD
deltaConcentration = inv(M) * OD;
deltaConcentration_HbO2 = deltaConcentration(1);%change in HbO2 concentration
deltaConcentration_Hb = deltaConcentration(2);%change in Hb concentration
%use concentration values to give values for oxygenation and blood volume
OXY = deltaConcentration_HbO2 - deltaConcentration_Hb;%oxygenation in tissue due to hemodynamic activation
BV = deltaConcentration_HbO2 + deltaConcentration_Hb;%blood volume changes in tissue due to hemodynamic activation