# du lieu dau vao
X = [[100 10]
    [150 10]
    [10 100]
    [30 150]
    [600 200]
    [455 10]
    [345 255]
    [10 501]
    [401 255]
    [600 10]
    ];
y = [-1; -1; -1; -1; 1; 1; 1; 1; 1; 1];

# du lieu test
testX = [15; 400];

# bieu dien du lieu
plot(X(y == -1, 1), X(y == -1, 2), 'r*', X(y == 1, 1), X(y == 1, 2), 'b*', testX(1), testX(2), 'g*')
X = [X ones(length(X), 1)];
n = size(X)(2);
I=eye(n);
c=10;
U=(1/c*I +A'*A)'\(A'*Y);

W=U(1:n-1);
b=U(n);
P=W'*testX+b