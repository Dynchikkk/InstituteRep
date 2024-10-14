#ifndef CLIENTLIB_H
#define CLIENTLIB_H

#ifdef CLIENTLIB_EXPORTS
#define CLIENTLIB_API __declspec(dllexport)
#else
#define CLIENTLIB_API __declspec(dllimport)
#endif

#define CHECK_INTERVAL 10000

CLIENTLIB_API void StartClient();
#endif
