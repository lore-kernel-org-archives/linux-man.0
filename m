From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: BUG report for Linux man-pages, about PRCTL(2)
Date: Sat, 22 Feb 2014 09:49:00 +0100
Message-ID: <5308647C.4020803@gmail.com>
References: <CADUNBOnX0kDN4+CDBw3o2ebpDNW1saafMN1U-n0CHjcFN=6Pow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADUNBOnX0kDN4+CDBw3o2ebpDNW1saafMN1U-n0CHjcFN=6Pow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xiawei Chen <chenxiawei-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/19/2014 08:29 AM, Xiawei Chen wrote:
> http://man7.org/linux/man-pages/man2/prctl.2.html
> 
> release *3.60* of the Linux man-pages project
> 
> I am confused by the description of section RETURN VALUE
> 
>  "On success, *PR_GET_DUMPABLE, PR_GET_KEEPCAPS, PR_GET_NO_NEW_PRIVS,
>        PR_CAPBSET_READ, PR_GET_TIMING, PR_GET_SECUREBITS, PR_MCE_KILL_GET*,
>        and (if it returns) *PR_GET_SECCOMP *return the nonnegative values
>        described above. All other option values return 0 on success."
> 
> when i use "prctl(PR_GET_TIMERSLACK, 0, 0, 0, 0)" in my code, then it return 50000.
> i guess the value 50000 is the correct result,
> whether or not, the description section RETURN VALUE is lack of this option (*PR_GET_TIMERSLACK*)?
> 
>  I am looking forward to your response. .

Thanks. Yes, you're right of course. I applied the patch below.

Cheers,

Michael

diff --git a/man2/prctl.2 b/man2/prctl.2
index 0ccfe0b..0271a73 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -510,7 +510,8 @@ The timer slack values are preserved across
 .BR execve (2).
 .TP
 .BR PR_GET_TIMERSLACK " (since Linux 2.6.28)"
-Return the current timer slack value of the calling thread.
+Return (as the function result)
+the current timer slack value of the calling thread.
 .TP
 .BR PR_SET_TIMING " (since Linux 2.6.0-test4)"
 Set whether to use (normal, traditional) statistical process timing or
@@ -782,6 +783,7 @@ On success,
 .BR PR_GET_NO_NEW_PRIVS ,
 .BR PR_CAPBSET_READ ,
 .BR PR_GET_TIMING ,
+.BR PR_GET_TIMERSLACK ,
 .BR PR_GET_SECUREBITS ,
 .BR PR_MCE_KILL_GET ,
 and (if it returns)


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
