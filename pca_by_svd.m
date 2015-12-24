# Du lieu dau vao
X = [
    [12 23 34 44 59 70 98]
    [12 15 25 27 32 88 99]
    [15 35 78 82 90 95 97]
]'

# Tam hoa du lieu
[m , n] = size(X)
mean_col = (X' * ones(m, 1) / m)'
Xn = (X - ones(m, 1) * mean_col)
std_X = sqrt((Xn .^ 2)' * ones(m, 1) / (m - 1))
Xn0 = Xn ./ (ones(m, 1) * std_X')

# Ve du lieu co so
plot(Xn0(:, 1), Xn0(:, 2), '.')
plot(Xn0(:, 1), Xn0(:, 3), '.')
plot(Xn0(:, 2), Xn0(:, 3), '.')

# tim u, s, v
[u, s, v] = svd(Xn0)

# du lieu giam chieu
vk = v(:, 1:2)
Z = Xn0 * vk

# Ve du lieu da giam chieu
plot(Z(:, 1), Z(:, 2), '.')

# Tinh I
s2 = s .^ 2
sum_lambda = sum(s2(1:n, 1:n) * ones(n, 1))
sum_lambda_k = sum(s2(1:2, 1:2) * ones(2, 1))
i = sum_lambda_k / sum_lambda

# Theo cach khac, nhung s2 khac thu tu sap xep
[v, s2] = eig(Xn0' * Xn0)