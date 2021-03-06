parseInt(x) = parse(BigInt, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
const MOD = 10^9 + 7


function f(N, A, B)
    base = ((N - A + 1)^2  * (N - B + 1)^2) % MOD

    if A + B > N
        return 0
    else
        c = ((((N - A + 1) * (N - B + 1)) - ((N - A - B + 2) * (N - A - B + 1)))^2) % MOD
        return (base - c) % MOD
    end
end

function main()
    T = parseInt(readline())
    for i in 1:T
        N, A, B = parseMap(split(readline()))
        println(f(N, A, B))
    end
end


main()




#=

AとBが重ならないような置き方は、
(Aの置き方 * Bの置き方) - (AとBが重なる置き方)で求められる。


AとBを重なりを気にせずに置く時, Aの置き方は
(N - A + 1)^2で求まる。
(例えば左下の座標を(x, y)とすると, 0 <= x <= N - A, 0 <= x <= N - Bを満たすため。)
同様に、Bの置き方は、
(N - B + 1)^2。

次に、AとBが重なる置き方の数を考える。(これをCとする。)

Aの左下座標を(x1, y1), Bの左下座標を(x2, y2)とすると、

AとBが重なるとは、
x1 < i < x1 + A 
x2 < i < x2 + B  ---- ②

y1 < j < y1 + A 
y2 < j < y2 + B, ---- ③


を全て満たす(i, j)が存在することであり、AとBが重なる置き方とはこれを満たす(i, j)の組である。

ここで、②を満たすiの数、③を満たすjの数を考えると、白い正方形も赤い正方形も青い正方形も正方形である(???)ことから、(x1, y1の取りうる範囲は同じとなり、すなわち
iとjの数は等しくなることがわかる。
したがって、iの数(dとおく)が分かれば、C = d^2となる。

さて、iの数だけを考えれば良いので、ここからは1次元上で考える。

状況を整理すると、

d = {長さNの区間に長さAの区間と長さBの区間を詰めた時の重なる数}を考えればよい。

これは、

AとBの置き方 - 重ならない置き方　で求められ、

AとBの置き方は、①と同様の考え方で、
(N - A + 1)(N - B + 1)となる。

また、重ならない置き方は、

(1) A + B > Nの時

どのようにおいても重なってしまうので、0通り。

(2) A + B <= Nの時


区間の左端にAとBを寄せておいて、そこからの動かし方を考える。

(左に寄せた図)
AAAAAA BBBB ##########

最初、BはN-A+B+1分右側に動かすことができ、
次に, Aを1マス右に動かすと、BはN-A+B分右側に動かすことができる。
したがって、区間上でBが動く幅は、
初項 N - A - B + 1, 末項0, 項数N - A - B + 2の等差数列になることがわかり、

初項a, 末項l, 項数nの等差数列の和は、

(1 / 2) * n * (a + l)であるから、

(1 / 2) * (N - A - B + 2) * (N - A - B + 1)

これはAとBを入れ替えても成り立つから、

d = (N - A + 1) * (N - B + 1) - 2 * (1 / 2) * (N - A - B + 2) * (N - A - B + 1)
  = (N - A + 1) * (N - B + 1) - (N - A - B + 2) * (N - A - B + 1)

よって、答えは、


A + B > Nの時

((N - A + 1)^2 * (N - B + 1)^2 - (N - A + 1) * (N - B + 1)) % MOD 

A + B <= Nの時

((N - A + 1)^2 * (N - B + 1)^2 - (((N - A + 1) * (N - B + 1) - (N - A - B + 2) * (N - A - B + 1))^2) % MOD


となる。

=#

