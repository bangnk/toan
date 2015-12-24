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

n = length(x1);

# tham so b0
b0 = ones(n, 1);

# ma tran x
X = [b0 x1];
a = [.5; .5];

i = 1000000;
t = .001;
epsilon = 1e+10;
while (true)
  e = X * a - Y;
  so_gia = (X' * e) / n;

  a = a - t * so_gia;
  epsilon_new = mean((X * a - Y).^2);
  if (abs(epsilon_new - epsilon)) < 1e-6  || i < 0
    break;
  else
    epsilon = epsilon_new;
  endif
  i--;
endwhile
epsilon_new
a
i