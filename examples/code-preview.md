---
marp: true
theme: nju
paginate: true
---

# 代码块：正常用法

## 短行代码

```python
def two_sum(nums, target):
    seen = {}
    for i, n in enumerate(nums):
        if target - n in seen:
            return [seen[target - n], i]
        seen[n] = i
```

---

# 代码块：长行会自动换行

## 一行写太长也不会缩成蚂蚁字

```python
result = [transform(node, depth + 1, cache, visited) for node in graph[start] if node not in visited and weight[node] + cost <= limit and predicate(node, depth) and not is_blocked(node)]
```

> 本主题关掉了 Marp 默认的 auto-scaling（它会把长行一路缩到看不清），
> 改成让长行自动换行，字号始终保持在可读大小。

---

# 代码块：中文注释

## 中文注释同样会换行

```python
# 二分查找：注意 mid 的写法，避免 (left + right) / 2 在 left 和 right 都很大时发生整型溢出
def lower_bound(a, target):
    left, right = 0, len(a)
    while left < right:
        mid = left + (right - left) // 2
        if a[mid] < target:
            left = mid + 1
        else:
            right = mid
    return left
```

---

# 代码块：一页放得下多少行

## 一页大约 16 行（含标题）

```python
import sys

def main():
    data = sys.stdin.read().split()
    n, graph, idx = int(data[0]), {}, 1
    for _ in range(n - 1):
        u, v = int(data[idx]), int(data[idx + 1])
        idx += 2
        graph.setdefault(u, []).append(v)
        graph.setdefault(v, []).append(u)
    print(len(graph))

if __name__ == "__main__":
    main()
```

> 再多就会超出画布 —— Marp 是静默裁掉的，不报错，只能在预览里翻出来看。
