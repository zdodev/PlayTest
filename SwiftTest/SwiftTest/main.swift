let name = "zdo"

func iDontKnowGuardStatement() {
    // 조건문이 true면 계속 실행.
    guard name == "zdo" else {
        return
    }
    
    print("guard")
}

func iReallyDontKnowGuardStatement() {
    // 조건문이 false이므로 조기 종료.
    guard name != "zdo" else {
        return
    }
    
    print("가드")
}

iDontKnowGuardStatement()
iReallyDontKnowGuardStatement()
