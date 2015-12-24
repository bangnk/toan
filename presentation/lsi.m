# du lieu dau vao
X = [
    [1 0 1 0 0] # romeo
    [1 1 0 0 0] # juliet
    [0 1 0 0 0] # happy
    [0 1 1 0 0] # dagger
    [0 0 0 1 0] # live
    [0 0 1 1 0] # die
    [0 0 0 1 0] # free
    [0 0 0 1 1] # new-hampshire
];
# du lieu dau vao cua query
q = [0 0 0 1 0 1 0 0]';

[u, s, v] = svd(X);

# du lieu giam chieu
k = 2
uk = u(:, 1:k);
sk = s(1:k, 1:k);
vk = v(:, 1:k);

w = ['romeo'; 'juliet'; 'happy'; 'dagger'; 'live, free'; 'die'; 'live, free'; 'new-hampshire']
dk = vk * sk;
wk = uk * sk;
hold off;
plot(wk(:, 1), wk(:, 2), 'bo');
hold on;
text(wk(:, 1) + .01, wk(:, 2), w);
plot(dk(:, 1), dk(:, 2), 'r+');
docs = ['d1'; 'd2'; 'd3'; 'd4'; 'd5'];
text(dk(:, 1) + .01, dk(:, 2), docs);

# du lieu query moi trong he toa do giam chieu
qk = (wk(4, :) + wk(6, :)) / 2;
plot(qk(1), qk(2), 'g*');
text(qk(1) + .01, qk(2), 'NEW QUERY');
plot(0, 0, 'r.');
text(-.04, 0, 'O');

# do dai vector hang cua vk va do dai qk
normVk = sqrt(sum(vk .^ 2, 2));
normQk = sqrt(sum(qk .^ 2, 2));

# Tinh khoang cach cosine cua qk voi tung vector hang trong vk
d = vk*qk';
d = d ./ normVk;
d = d ./ normQk

# Tim khoang cach lon nhat va vi tri khoang cach lon nhat
[m, index] = max(d)
