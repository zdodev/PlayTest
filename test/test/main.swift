enum Cookie: CaseIterable {
    case choco, banana, strawberry
}

for cookie in Cookie.allCases {
    print(cookie)
}
