From: Arnaud Gaillard <arnaud.mgaillard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [BUG][REPORT] Possible error in on man 7 glob
Date: Tue, 9 Aug 2016 01:29:52 +0200
Message-ID: <CACH3jogB0J+3bvBSsSS=fBkqO=AydnVNdcAA-pijhK1bBOvKWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, l-hour_q-ZrNlpQwM5lQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

the `man 7 glob` states that:

>A range cannot contain an explicit '/' character;
> this would lead to a syntax error.

What I understand from this is that :

> sh$ echo [/-a]
> sh$ echo [a-/]

should be producing syntax errors. However, this is not the case,
as these just print out literally.

> sh$ uname -a
Linux caml 3.19.0-25-generic #26~14.04.1-Ubuntu SMP \
Fri Jul 24 21:16:20 UTC \
2015 x86_64 x86_64 x86_64 GNU/Linux \

This was tested on:

* bash: GNU bash, version 4.3.11(1)-release (x86_64-pc-linux-gnu)
* tcsh: tcsh 6.19.00 (Astron)
* ksh: sh (AT&T Research) 93u

Sincerely yours,

-- 
Arnaud GAILLARD
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
