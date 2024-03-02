#ifndef COMPLEX
#define COMPLEX
#include <complex>
#include <cmath>

int mandelbroatComplex(std::complex<double> c, int limits)
{
	std::complex<double> z(0, 0);
	int iters = 0;
	for (iters = 0; iters < limits; iters++)
	{
		// norm(z) = z.real * z.real + z.imag * z.imag
		if (std::norm(z) > 4)
			return iters;
		z = z * z/* * z * z + z * z*/ + c;
	}

	return limits;
}
#endif // !COMPLEX

