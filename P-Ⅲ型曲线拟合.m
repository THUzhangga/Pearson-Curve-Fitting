R = [1380,726,1050,1120,1010,983,1290,1560,1100,816,707,1310,1540,1460,2360,1790,1260,884,996,928,1400,1280,850,768,1090,867,667,964,779,897,554,892,855,700,1330,943,1520,868,946,695];
n = size(R,2);
R = sort(R,'descend');
W = zeros(1,n);
R_bar = mean(R);
sum_2 = 0;
sum_3 = 0;
for i=1:n
    W(i) = i / (n + 1);
    k = R(i) / R_bar;
    sum_2 = sum_2 + (k - 1)^2;
    sum_3 = sum_3 + (k - 1)^3;
end
Cv = sqrt(sum_2 / (n - 1));
Cs = sum_3 / ((n - 3) * Cv^3);
phip = zeros(1,100);
xp = zeros(1,100);
P = zeros(1,100)
i = 1;
for p =0:0.01:1
    phip(i) = Cs / 2 * gaminv(1-p, 4 / Cs ^ 2,1) - 2 / Cs;
    xp(i) = (phip(i) * Cv + 1) * R_bar;
    P(i) = p;
    i = i + 1;
end
plot(W, R,'.')
hold on
plot(P,xp);
title('P-¢óÐÍÇúÏßÄâºÏÍ¼');
xlabel('p'),ylabel('xp');

