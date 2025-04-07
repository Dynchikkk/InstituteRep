package calculator.Core.Integral;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

public class RecIntegral implements Externalizable {
    private static final long serialVersionUID = 1L;
    private static final double MINIMAL_DOUBLE_VALUE = 0.000001;
    private static final double MAXIMUM_DOUBLE_VALUE = 1000000;
    
    private double _topBorder = 0.0;
    private double _bottomBorder = 0.0;
    private double _stepWidth = 0.0;
    private double _result = 0.0;
    
    public RecIntegral() {
    }
    
    public RecIntegral(double topBorder, double bottomBorder, double stepWidth) throws IntegralValueException {
        this(topBorder, bottomBorder, stepWidth, Double.NaN);
    }
    
    public RecIntegral(double topBorder, double bottomBorder, double stepWidth, double previewResult) 
            throws IntegralValueException {
        _topBorder = topBorder;
        _bottomBorder = bottomBorder;
        // Проверка значений на допустимый диапазон
        if (bottomBorder < MINIMAL_DOUBLE_VALUE || bottomBorder > MAXIMUM_DOUBLE_VALUE ||
            topBorder < MINIMAL_DOUBLE_VALUE || topBorder > MAXIMUM_DOUBLE_VALUE ||
            stepWidth < MINIMAL_DOUBLE_VALUE || stepWidth > MAXIMUM_DOUBLE_VALUE) {
            throw new IntegralValueException(MINIMAL_DOUBLE_VALUE, MAXIMUM_DOUBLE_VALUE);
        }
        _stepWidth = stepWidth;
        _result = previewResult;
    }
    
    public double getTopBorder() { return _topBorder; }
    public double getBottomBorder() { return _bottomBorder; }
    public double getStepWidth() { return _stepWidth; }
    public double getResult() { return _result; }
    
    public void setResult(double result) { _result = result; }
    
    @Override
    public void writeExternal(ObjectOutput out) throws IOException {
        out.writeDouble(_topBorder);
        out.writeDouble(_bottomBorder);
        out.writeDouble(_stepWidth);
        out.writeDouble(_result);
    }
    
    @Override
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        _topBorder = in.readDouble();
        _bottomBorder = in.readDouble();
        _stepWidth = in.readDouble();
        _result = in.readDouble();
        
        // Проверка допустимости десериализованных значений
        if (_bottomBorder < MINIMAL_DOUBLE_VALUE || _bottomBorder > MAXIMUM_DOUBLE_VALUE ||
            _topBorder < MINIMAL_DOUBLE_VALUE || _topBorder > MAXIMUM_DOUBLE_VALUE ||
            _stepWidth < MINIMAL_DOUBLE_VALUE || _stepWidth > MAXIMUM_DOUBLE_VALUE) {
            throw new IOException("Deserialized values are out of allowed range: " +
                "Allowed range is [" + MINIMAL_DOUBLE_VALUE + ", " + MAXIMUM_DOUBLE_VALUE + "]");
        }
    }
}
