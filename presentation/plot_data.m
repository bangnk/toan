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

# chia 80% du lieu lam du lieu tap luyen, con lai 20% lam du lieu test
X = data(1:470, 2:3);
y = data(1:470, 1);
X_test = data(471:end, 2:3);
y_test = data(471:end, 1);

# ve y theo cot 1
plot(X(:, 1), y, ".r");
xlabel("BattingAverageLAG1");
ylabel("BattingAverage");
axis ([.18 .38 .18 .38]);

# ve y theo cot 1
plot(X(:, 2), y, ".b");
xlabel("CumulativeAverageLAG1");
ylabel("BattingAverage");
axis ([.18 .38 .18 .38]);

# ve y da sap xep
plot(sort(y), "-");
ylabel("BattingAverage");

# ve phan phoi cua y
hist(y);
