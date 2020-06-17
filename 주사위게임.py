① import random

② again = 'y'
    count = 1

③ while again == ‘y’:
④      print('-' * 30)
         print('주사위 던지기 : %d번째' % count)
⑤      me = random.randint(1, 6)
         computer = random.randint(1, 6)
         print('나 : %d' % me )
         print('컴퓨터 : %d' % computer)
    
⑥      if me > computer :
              print('나의 승리!')
         elif me == computer :
              print('무승부!')
         else :
              print('컴퓨터의 승리!')
    
         count = count + 1
⑦     again = input('계속하려면 y를 입력하세요!')


#주사위 던지기 : 1번째
#나 : 1
#컴퓨터 : 4
#컴퓨터의 승리!
#계속하려면 y를 입력하세요!y
#------------------------------
#주사위 던지기 : 2번째
#나 : 4
#컴퓨터 : 3
#나의 승리!
#계속하려면 y를 입력하세요!y
#------------------------------
#주사위 던지기 : 3번째
#나 : 1
#컴퓨터 : 2
#컴퓨터의 승리!
#계속하려면 y를 입력하세요!n