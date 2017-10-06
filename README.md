# AlgorithmW

AlgorithmWのSwift実装です。

+ [A theory of type polymorphism in programming - ScienceDirect](http://www.sciencedirect.com/science/article/pii/0022000078900144)
+ [Algorithm W Step by Step](http://catamorph.de/documents/AlgorithmW.pdf)

## 仕様

### 型

```
T = Int | Bool | T -> T | X (型変数)
```

### 型スキーム

```
∀ X1...Xn.T
```

### 構文

関数抽象

```
func 関数名(仮引数名: 型) -> 型 { 項 }
```

量化された型を含む関数

```
func 関数名<量化された型>(仮引数名: 型) -> 型 { 項 }
```

let束縛

```
let 名前 = 項
```

逐次実行

```
項 \n 項
```

リテラル

```
0, 1, 2, 3, ...
true
false
```

### 値

```
0, 1, 2, 3, ...
true
false
```

