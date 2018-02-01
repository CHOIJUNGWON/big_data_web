list_1 = ["risk", "issue", "test", "maintenance", "maturity"]
list_2 = ["security", "plan", "design", "systematic", "safety"]
list_3 = ["maintenance", "verification", "vlaidation"]

if ('maintenance' in list_1) and len(list_1) >= 5:
    print("list_1 will be tested")
elif ('maintenance' in list_2) and len(list_2) >= 5:
    print("list_2 will be tested")
elif ('maintenance' in list_3) and len(list_3) >= 5:
    print("list_3 will be tested")