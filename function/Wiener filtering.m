function [lvboout_img] = wnlvbo(lvbo_img)
H = [5 5];
lvboout_img=wiener2(lvbo_img,H);
end
