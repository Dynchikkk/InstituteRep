#ifndef COMPLEX
#define COMPLEX
#include <complex>
#include <numeric>

int IsInSet(std::complex<double> c, int iterarions)
{
	std::complex<double> z(0, 0);
	for (size_t i = 0; i < iterarions; i++)
	{
		z = std::pow(z, 3) + std::pow(z, 2) + c;
		if (std::norm(z) > 8)
			return i;
	}
	return 0;
}

double lerp(double start, double end, double amnt) {
	return start + amnt * (end - start);
}
#endif // !COMPLEX

