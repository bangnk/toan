# load du lieu tu file
data = load("data.csv");
# setup seed de sinh ra so ngau nhien giong nhau o moi lan chay
rand("seed", 12345);
# tao ra 588 so ngau nhien
randoms = rand(length(data),1);
# sap xep cac so ngau nhien de lay thu tu ngau nhien trong bien index
[garbage index] = sort(randoms);
# dung thu tu ngau nhien trong bien index de xao tron thu tu trong data
# muc dich: lam du lieu cua moi cau thu xuat hien trong ca tap hop tap luyen va tap hop test
data = data(index, :);
# them cot 1 vao phia sau
data = [data ones(length(data), 1)];

# chia 80% du lieu lam du lieu tap luyen, con lai 20% lam du lieu test
X = data(1:470, 2:end);
y = data(1:470, 1);
X_test = data(471:end, 2:end);
y_test = data(471:end, 1);

a = inv(X'*X)*X'*y;
m = length(X);

epsilon = y - X * a;
meanY = mean(y);
var_y = mean((y - meanY).^2);
sum_epsilon2 = sum(epsilon .^ 2);
sum2 = epsilon' * epsilon;
disp 'R2 traing:'
R2 = 1 - sum_epsilon2 / m / var_y;
disp(R2)
disp 'RMSE train:'
disp(sqrt(mean(epsilon .^ 2)))
disp 'RMSE train %:'
disp(sqrt(mean(epsilon .^ 2)) / mean(y))


m_test = length(X_test);
epsilon = y_test - X_test * a;
meanY = mean(y_test);
var_y = mean((y_test - meanY).^2);
sum_epsilon2 = sum(epsilon .^ 2);
sum2 = epsilon' * epsilon;
disp 'R2 test:'
R2 = 1 - sum_epsilon2 / m_test / var_y;
disp(R2)
disp 'RMSE test:'
disp(sqrt(mean(epsilon .^ 2)))
disp 'RMSE test %:'
disp(sqrt(mean(epsilon .^ 2)) / mean(y_test))

# ve line chart
hold off;
plot(epsilon);

# ve 3d chart
hold off;
d = .15:.01:.4;
[xx, yy] = meshgrid (d, d);
r = xx*a(1) + yy*a(2) + a(3);
mesh(d, d, r);
hold on;
plot3(X_test(:, 1), X_test(:, 2), X_test*a, 'b.');
plot3(X_test(:, 1), X_test(:, 2), y_test, 'r.');
xlabel("BattingAverageLAG1");
ylabel("CumulativeAverageLAG1");
zlabel("BattingAverage");
hold off;