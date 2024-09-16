"""
↓ = -(a v b)
→ = -a v b
~ = -a*(-b) v a*b
| = -(a ^ b)
+ = -a*b v a*(-b)
- = a*(-b)

((b ^ d) ↓ (b ^ c)) ^ ((d → a) - (c - a)) =
    ((c | d) | (-c ~ -d)) → ((a + b) ^ (b → a))
"""


def left_part(a, b, c, d):
    return not ((b and d) or (b and c)) and ((not d or a) and not (c and not a))
def right_part(a, b, c, d):
    return not(not(not(c and d) and ((c and d) or (not c and not d)))) or \
           (((not a and b) or (a and not b)) and (not b or a))
def main():
    print("a b c d x y")
    for a in range(2):
        for b in range(2):
            for c in range(2):
                for d in range(2):
                    left = left_part(a, b, c, d)
                    right = right_part(a, b, c, d)
                    print(a, b, c, d, int(left), int(right), left == right)


if __name__ == "__main__":
    main()
