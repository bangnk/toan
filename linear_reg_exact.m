# Du lieu dau vao
Y = [45
58
50
54
62
53
];

x1 = [18
25
15
22
24
20
];

# so phan tu cua x1
n = length(x1)

# tham so b0
b0 = ones(n, 1)

# ma tran x
X = [b0 x1]

# Tinh tham so a = [(x'x)-1]x'Y, Y = aX
a = inv(X'*X)*X'*Y

# Tinh epsilon
ep = Y - X * a

# Tinh R2

# Tinh var Y
meanY = mean(Y)
var_y = mean((Y - meanY).^2)


sum_epsilon2 = sum(ep .^ 2)
sum2 = ep' * ep
R2 = 1 - sum_epsilon2 / n / var_y

# Du doan Y moi theo X moi
X2 = [1 30]
Y2 = X2 * a
x2 = 10:30
y2 = x2 * a
plot(x1, Y)
