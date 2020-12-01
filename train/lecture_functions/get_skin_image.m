function skin_image = get_skin_image(input)
    negative_histogram = read_double_image('negatives.bin');
    positive_histogram = read_double_image('positives.bin');
    test3 = double(imread(input));
    
    skin_image = detect_skin(test3, positive_histogram, negative_histogram);
    
    % threshold @ number depending on input
    threshold = max(max(skin_image)) * .75;
    
    skin_image = (skin_image > threshold);
end

