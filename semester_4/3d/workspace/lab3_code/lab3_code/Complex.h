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
		z = z * z + c;
	}

	return limits;
}

COLORREF HSV(float H, float S, float V) {
	float r, g, b;

	float h = H / 360;
	float s = S / 100;
	float v = V / 100;

	int i = floor(h * 6);
	float f = h * 6 - i;
	float p = v * (1 - s);
	float q = v * (1 - f * s);
	float t = v * (1 - (1 - f) * s);

	switch (i % 6) {
	case 0:
		r = v, g = t, b = p;
		break;
	case 1:
		r = q, g = v, b = p;
		break;
	case 2:
		r = p, g = v, b = t;
		break;
	case 3:
		r = p, g = q, b = v;
		break;
	case 4:
		r = t, g = p, b = v;
		break;
	case 5:
		r = v, g = p, b = q;
		break;
	}

	return RGB(r * 255, g * 255, b * 255);
}

#endif // !COMPLEX

