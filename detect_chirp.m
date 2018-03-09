for j = 1 : num_frames
    frame2 = xcorr(ip2( (j-1)*frame_len + 1 : frame_len*j), ip1);
    t = t + 1;
    if(max(frame2) >= (max_val-50/A))
        count = count + 1
        actual_time = t/100
    end
end