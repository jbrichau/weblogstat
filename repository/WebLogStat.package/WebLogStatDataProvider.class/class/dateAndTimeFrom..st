private
dateAndTimeFrom: aStream

	| offset date time ch |

	date := Date readFrom: aStream.
	[aStream peek isDigit]
		whileFalse: [aStream next].
	time := Time readFrom: aStream.
		
	^ DateAndTime
		year: date year
		month: date monthIndex
		day: date dayOfMonth
		hour: time hour
		minute: time minute
		second: time second
		nanoSecond: time nanoSecond
		offset: DateAndTime localOffset
