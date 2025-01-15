ret = 0

year = 1900
day_of_month = 1
day = 0
month = 1
month_days = {1: 31, 2:28, 3: 31, 4: 30, 5:31, 6:30, 7:31, 8:31, 9:30, 10:31, 11:30, 12:31}

while year != 2001 :

    day = (day + 1 ) % 7
    day_of_month += 1

    if day_of_month > month_days[month]:
        day_of_month = 1
        month += 1
        if month == 13:
            month = 1
            year += 1
            if year % 4 == 0: 
                month_days[2] = 29
            else:
                month_days[2] = 28

 
    if day_of_month == 1 and day == 6 and year >= 1901 :
        ret +=  1

print(ret)
