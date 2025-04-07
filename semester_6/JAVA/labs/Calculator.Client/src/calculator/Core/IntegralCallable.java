package calculator.Core;

import java.util.concurrent.Callable;

public class IntegralCallable implements Callable<Double> {
    private final double subStart;
    private final double subEnd;
    private final double stepWidth;
    
    public IntegralCallable(double subStart, double subEnd, double stepWidth) {
        this.subStart = subStart;
        this.subEnd = subEnd;
        this.stepWidth = stepWidth;
    }
    
    @Override
    public Double call() {
        double partial = 0.0;
        System.out.println("Start calculate: [" + subStart + ", " + subEnd + ", " + stepWidth + "]...");
        for (double x = subStart; x < subEnd; x += stepWidth) {
            double nextX = Math.min(x + stepWidth, subEnd);
            double area = (nextX - x) * (Math.exp(-x) + Math.exp(-nextX)) / 2.0;
            partial += area;
        }
        System.out.println("End calculate: [" + subStart + ", " + subEnd + ", " + stepWidth + "]");
        return partial;
    }
}
