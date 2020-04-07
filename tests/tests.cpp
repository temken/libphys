#include <iostream>
#include <chrono>
#include <cmath>

#include "Linear_Algebra.hpp"
#include "Natural_Units.hpp"
#include "Numerics.hpp"
#include "Statistics.hpp"
#include "Utilities.hpp"

double func(double x){return sin(x);}

int main()
{
	//Starting time
	std::chrono::high_resolution_clock::time_point time_start = std::chrono::high_resolution_clock::now();
	
	//1. Tests of functions in Linear_Algebra.hpp"
	Vector v({1,3,5});
	std::cout<<v<<std::endl;
	std::cout<<v*v<<std::endl;
	
	double x = Find_Root(func, 1, 10, 1e-5);
	std::cout<<x<<std::endl;

	Print_Progress_Bar(0.5);
	//Ending time and computing time
	std::chrono::high_resolution_clock::time_point time_end = std::chrono::high_resolution_clock::now();
	double durationTotal =1e-6*std::chrono::duration_cast<std::chrono::microseconds>( time_end - time_start ).count();
	std::cout <<"\nProcessing Time:\t"<< durationTotal<<"s ("<< floor(durationTotal/3600.0)<<":"<<floor(fmod(durationTotal/60.0,60.0))<<":"<<floor(fmod(durationTotal,60.0))<<":"<<floor(fmod(1000*durationTotal,1000.0))<<")."<<std::endl
	<<"##############################"<<std::endl;
	
	return 0;
}