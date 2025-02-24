package calculator;

/**
 *
 * @author admin
 */
public class RecIntegral {
    public int Id;
    
    private boolean _isCalculated = false;
    private double _topBorder = 0.0;
    private double _bottomBorder = 0.0;
    private double _stepWidth = 0.0;
    private double _result = 0.0;
    
    public RecIntegral(double topBorder, double bottomBorder, double stepWidth, int id) {
        _topBorder = topBorder;
        _bottomBorder = bottomBorder;
        _stepWidth = stepWidth;
        Id = id;
    }
    
    public boolean isCalculated() { return _isCalculated; }
    public double getTopBorder() { return _topBorder; }
    public double getBottomBorder() { return _bottomBorder; }
    public double getStepWidth() { return _stepWidth; }
    public double getResult() {
        if (!_isCalculated){
            _result = calculateIntegral(_topBorder, _bottomBorder, _stepWidth);
            _isCalculated = true;
        }
        return _result;
    }
    
    private double calculateIntegral(double topBorder, double bottomBorder, double stepWidth) {
        // Ensure that the step width is positive
        if (stepWidth <= 0) {
            throw new IllegalArgumentException("Step width must be positive");
        }

        double sign = 1.0;
        // If the top border is less than the bottom border, swap them and invert the sign of the result
        if (topBorder < bottomBorder) {
            double temp = topBorder;
            topBorder = bottomBorder;
            bottomBorder = temp;
            sign = -1.0;
        }

        double sum = 0.0;
        // Integrate using the trapezoidal rule
        for (double x = bottomBorder; x < topBorder; x += stepWidth) {
            double nextX = Math.min(x + stepWidth, topBorder);
            // Calculate the area of the trapezoid between x and nextX
            double area = (nextX - x) * (Math.exp(-x) + Math.exp(-nextX)) / 2.0;
            sum += area;
        }
        return sign * sum;
    }
}
