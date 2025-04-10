function [zero_position] = CentroidAlg(z, intensities)
    % 如果输入是行向量，先转为列向量
    if isrow(intensities)
        intensities = intensities';
    end

    % 减去平均值
    intensities_ = intensities - mean(intensities);

    % 计算重心位置
    zero_position = sum(z' .* abs(intensities_)) / sum(abs(intensities_));

end

