From: "Alexander Schuch" <Alex.Schuch-Mmb7MZpHnFY@public.gmane.org>
Subject: error in NOTES section in time(2)
Date: Tue, 10 May 2011 20:17:13 +0200
Message-ID: <20110510181713.165010@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

The NOTES section of time(2) <http://www.kernel.org/doc/man-pages/online/pages/man2/time.2.html> says the following:

"POSIX.1 defines seconds since the Epoch as a value to be interpreted as the number of seconds between a specified time and the Epoch, according to a formula for conversion from UTC equivalent to conversion on the naive basis that leap seconds are ignored and all years divisible by 4 are leap years."

I have neither read nor checked the POSIX specification, but there is an oddity in the statement, because "Years that are evenly divisible by 100 are not leap years, unless they are also evenly divisible by 400, in which case they are leap years." - http://en.wikipedia.org/wiki/Leap_year and cited sources.

So if POSIX really says that an average year has 365.25 days, a note should be added to the manual saying that POSIX differs from the Gregorian calendar. If, however, an average year has 365.2425 days according to POSIX, the line in time(2) should be updated to reflect that.

Regards,
Alexander Schuch
-- 
Empfehlen Sie GMX DSL Ihren Freunden und Bekannten und wir
belohnen Sie mit bis zu 50,- Euro! https://freundschaftswerbung.gmx.de
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
