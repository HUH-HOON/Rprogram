mine = "가위"
yours = "바위"

if mine == yours:
    print("비김")
else:
    if mine == "가위":
        if yours == "보":
            print("이겼다")
        else:
            print("졌다")
    else:
        if mine == "바위":
            if yours == "가위":
                print("이겼다")
            else:
                print("졌다")
        else:
            if mine == "보":
                if yours == "바위":
                    print("이겼다")
                else:
                    print("졌다")