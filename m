From: Darren Hart <dvhltc-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Subject: Futex manpages out of date
Date: Fri, 15 Jan 2010 08:58:09 -0800
Message-ID: <4B509EA1.8060509@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Eric Dumazet <eric.dumazet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinakar Guniguntala <dino-xthvdsQ13ZrQT0dZR+AlfA@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, John Kacur <jkacur-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The futex man-pages (2,7) from version 3.15-1 and at least a few earlier
versions are considerably out of date with respect to the current
implementation. They don't document newer op codes, such as:

FUTEX_WAIT_BITSET
FUTEX_WAKE_BITSET
FUTEX_WAKE_OP
FUTEX_LOCK_PI
FUTEX_UNLOCK_PI
FUTEX_WAIT_REQUEUE_PI
FUTEX_CMP_REQUEUE_PI

These new wait op codes now use absolute timeouts, while the original
FUTEX_WAIT uses a relative timeout. Lastly, and most importantly, glibc
has removed the futex() wrapper to syscall(SYS_futex, ...). With that in
mind, would people prefer that we simply remove the futex man-pages
(2,7)?

Thanks,

-- 
Darren Hart
IBM Linux Technology Center
Real-Time Linux Team
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
