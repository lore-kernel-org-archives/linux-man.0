From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: error in NOTES section in time(2)
Date: Thu, 15 Sep 2011 20:39:37 +0200
Message-ID: <CAKgNAkj8EFER_07OJUa2-DjN-5j0wgSN7s8xsEQogBfZePHhMQ@mail.gmail.com>
References: <20110510181713.165010@gmx.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110510181713.165010-hi6Y0CQ0nG0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Schuch <Alex.Schuch-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Alexander,

On Tue, May 10, 2011 at 8:17 PM, Alexander Schuch <Alex.Schuch-Mmb7MZpHnFY@public.gmane.org> wrote:
> Hello,
>
> The NOTES section of time(2) <http://www.kernel.org/doc/man->
> pages/online/pages/man2/time.2.html> says the following:
>
> "POSIX.1 defines seconds since the Epoch as a value to be
> interpreted as the number of seconds between a specified time
> and the Epoch, according to a formula for conversion from UTC
> equivalent to conversion on the naive basis that leap seconds
> are ignored and all years divisible by 4 are leap years."
>
> I have neither read nor checked the POSIX specification,
> but there is an oddity in the statement, because "Years that
> are evenly divisible by 100 are not leap years, unless they are
> also evenly divisible by 400, in which case they are leap years." -
> http://en.wikipedia.org/wiki/Leap_year and cited sources.
>
> So if POSIX really says that an average year has 365.25
> days, a note should be added to the manual saying that
> POSIX differs from the Gregorian calendar. If, however,
> an average year has 365.2425 days according to POSIX,
> the line in time(2) should be updated to reflect that.

Thanks for your report. Your estimation that the man page is odd is of
course correct. For man-pages-3.33, I applied the patch below.

Cheers,

Michael


--- a/man2/time.2
+++ b/man2/time.2
@@ -26,7 +26,7 @@
 .\" Modified Sat Jul 24 14:13:40 1993 by Rik Faith <faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org>
 .\" Additions by Joseph S. Myers <jsm28-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, 970909
 .\"
-.TH TIME 2 2010-02-25 "Linux" "Linux Programmer's Manual"
+.TH TIME 2 2011-09-09 "Linux" "Linux Programmer's Manual"
 .SH NAME
 time \- get time in seconds
 .SH SYNOPSIS
@@ -61,16 +61,18 @@ POSIX does not specify any error conditions.
 .SH NOTES
 POSIX.1 defines
 .I seconds since the Epoch
-as a value to be interpreted as the number of seconds between a
-specified time and the Epoch, according to a formula for conversion
-from UTC equivalent to conversion on the naive basis that leap
-seconds are ignored and all years divisible by 4 are leap years.
+using a formula that approximates the number of seconds between a
+specified time and the Epoch.
+This formula takes account of the facts that
+all years that are evenly divisible by 4 are leap years,
+but years that are evenly divisible by 100 are not leap years
+unless they are also evenly divisible by 400,
+in which case they are leap years.
 This value is not the same as the actual number of seconds between the time
-and the Epoch, because of leap seconds and because clocks are not
+and the Epoch, because of leap seconds and because system clocks are not
 required to be synchronized to a standard reference.
-The intention is
-that the interpretation of seconds since the Epoch values be
-consistent; see POSIX.1 Annex B 2.2.2 for further rationale.
+The intention is that the interpretation of seconds since the Epoch values be
+consistent; see POSIX.1-2008 Rationale A.4.15 for further rationale.
 .SH "SEE ALSO"
 .BR date (1),
 .BR gettimeofday (2),


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
