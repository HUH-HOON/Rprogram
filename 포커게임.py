# 필요한 모듈을 미리 다 불러온다.
import random

def CardRank(cards):
    paircount = 0
    for n1 in range(0, 4):
        for n2 in range(n1+1, 5):
            if cards[n1][1] == cards[n2][1] :
                paircount = paircount+1
    num = [cards[k][1] for k in range(5)]
    num.sort()
    straightox = False
    if paircount == 0:
        if (num[4]-num[0]) == 4:
            straightox = True
        if num[0] == 1 and num[1] == 10:
            straightox = True
    suit = [cards[k][0] for k in range(5)]
    suit.sort()
    flushox = False
    if suit[0] == suit[4]:
        flushox = True
    if straightox and flushox:
        rank = 1
    elif paircount == 6:
        rank = 2
    elif paircount == 4:
        rank = 3
    elif flushox:
        rank = 4
    elif straightox:
        rank = 5
    elif paircount == 3:
        rank = 6
    elif paircount == 2:
        rank = 7
    elif paircount == 1:
        rank = 8
    else:
        rank = 9
    return rank

# 게임머니 $2000을 저장한다.
Money = 2000

# 카드 한 팩을 만든다.
deck = [(suit, k) for  suit in ["s", "h", "d", "c"] for k in range(1,14)]