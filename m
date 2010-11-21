From: Martin Eberhard Schauer <Martin.E.Schauer-Mmb7MZpHnFY@public.gmane.org>
Subject: inconsistent redundancy in chdir.2
Date: Sun, 21 Nov 2010 23:45:46 +0100
Message-ID: <4CE9A11A.5000309@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

             Dear Mr. Kerrisk,

I'm sorry for possibly two messages on the same subject - i mistyped the
CC address.

Thank you for maintaining the Linux man-pages.

Updating the outdated translation of chdir.2 for manpages-de I found

>
Feature Test Macro Requirements for glibc (see feature_test_macros(7)):

       fchdir():
           _BSD_SOURCE || _XOPEN_SOURCE >= 500 ||
           _XOPEN_SOURCE && _XOPEN_SOURCE_EXTENDED
           || /* Since glibc 2.12: */ _POSIX_C_SOURCE >= 200809L
>

and as last (third) part of NOTES

>
The prototype for fchdir() is only available if _BSD_SOURCE is defined,
       or _XOPEN_SOURCE is defined with the value 500.
>

This is almost the same of the first two possibilities above.

Please check whether >= or = is right and consider dropping/extending
the last
paragraph of the NOTES.

Kind regards
       Martin Schauer


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
