# du lieu dau vao
X = [
    [1 1 1]
    [0 1 1]
    [1 0 0]
    [0 1 0]
    [1 0 0]
    [1 0 1]
    [1 1 1]
    [1 1 1]
    [1 0 1]
    [0 2 0]
    [0 1 1]
]
# du lieu dau vao cua query
q = [0 0 0 0 0 1 0 0 0 1 1]'

[u, s, v] = svd(X)

# du lieu giam chieu
uk = u(:, 1:2)
sk = s(1:2, 1:2)
vk = v(:, 1:2)

# du lieu query moi trong he toa do giam chieu
qk = q'*uk*inv(sk)

# do dai vector hang cua vk va do dai qk
normVk = sqrt(sum(vk .^ 2, 2));
normQk = sqrt(sum(qk .^ 2, 2));

# Tinh khoang cach cosine cua qk voi tung vector hang trong vk
d = vk*qk'
d = d ./ normVk
d = d ./ normQk

# Tim khoang cach lon nhat va vi tri khoang cach lon nhat
[m, index] = max(d)

