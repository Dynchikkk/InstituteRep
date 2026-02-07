#define _CRT_SECURE_NO_WARNINGS

#include <windows.h>
#include <stdio.h>
#include <math.h>
#include <time.h>
#include <stdlib.h>

// Integration limits
#define A 10.0
#define B 20.0
// Integration step
#define H 0.0000001

// Structure for passing data to a thread
typedef struct {
    double start;      // Start of integration interval
    double end;        // End of integration interval
    double result;     // Partial integration result
    double maxLoad;    // Maximum allowed CPU load (0..1)
} ThreadData;

// Thread function for numerical integration
DWORD WINAPI IntegrateThread(LPVOID param) {
    if (param == NULL) {
        return 1;
    }

    ThreadData* data = (ThreadData*)param;
    double sum = 0.0;

    // Time counters for CPU load estimation
    clock_t workTime = 0;
    clock_t sleepTime = 0;

    // Numerical integration loop
    for (double x = data->start; x < data->end; x += H) {
        clock_t t1 = clock();

        // Trapezoidal integration method
        double f1 = 1.0 / log(x);
        double f2 = 1.0 / log(x + H);
        sum += (f1 + f2) * 0.5 * H;

        clock_t t2 = clock();
        workTime += (t2 - t1);

        double load = (double)workTime / (workTime + sleepTime + 1);

        if (load > data->maxLoad) {
            clock_t s1 = clock();
            Sleep(1);
            clock_t s2 = clock();
            sleepTime += (s2 - s1);
        }
    }


    data->result = sum;
    return 0;
}

// Performs parallel integration
int PerformParallelIntegration(double maxLoad, double* outResult) {
    if (outResult == NULL) {
        return 0;
    }

    SYSTEM_INFO sysInfo;
    GetSystemInfo(&sysInfo);
    int cpuCount = sysInfo.dwNumberOfProcessors;
    if (cpuCount <= 0) {
        return 0;
    }

    HANDLE* threads = (HANDLE*)malloc(cpuCount * sizeof(HANDLE));
    ThreadData* threadData = (ThreadData*)malloc(cpuCount * sizeof(ThreadData));
    // Check memory allocation
    if (threads == NULL || threadData == NULL) {
        free(threads);
        free(threadData);
        return 0;
    }

    double interval = (B - A) / cpuCount;
    int creationError = 0;
    // Initialize thread handles
    for (int i = 0; i < cpuCount; i++) {
        threads[i] = NULL;
    }
    // Create worker threads
    for (int i = 0; i < cpuCount; i++) {
        threadData[i].start = A + i * interval;
        threadData[i].end = A + (i + 1) * interval;
        threadData[i].result = 0.0;
        threadData[i].maxLoad = maxLoad;

        threads[i] = CreateThread(
            NULL,
            0,
            IntegrateThread,
            &threadData[i],
            0,
            NULL
        );

        // Track thread creation error
        if (threads[i] == NULL) {
            creationError = 1;
        }
    }

    // Wait for all successfully created threads
    for (int i = 0; i < cpuCount; i++) {
        if (threads[i] != NULL) {
            WaitForSingleObject(threads[i], INFINITE);
            CloseHandle(threads[i]);
        }
    }

    // If any thread was not created, computation is considered failed
    if (creationError) {
        free(threads);
        free(threadData);
        return 0;
    }

    // Sum partial results
    double result = 0.0;
    for (int i = 0; i < cpuCount; i++) {
        result += threadData[i].result;
    }

    *outResult = result;

    free(threads);
    free(threadData);

    return 1;
}


int main() {
    double loadPercent;

    printf("Enter maximum allowed CPU load (in percent): ");
    if (scanf("%lf", &loadPercent) != 1 || loadPercent <= 0 || loadPercent > 100) {
        printf("Error: invalid CPU load value.\n");
        return 1;
    }

    double result;
    int success = PerformParallelIntegration(loadPercent / 100.0, &result);

    if (!success) {
        printf("Error: parallel computation failed.\n");
        return 1;
    }

    printf("Integration result: %.10lf\n", result);
    return 0;
}

