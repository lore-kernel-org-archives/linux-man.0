From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 67291] Confusing/wrong description of CLOCK_*_CPUTIME_ID
Date: Fri, 27 Dec 2013 20:49:53 +0000
Message-ID: <bug-67291-11311-pbnKH9S0FV@https.bugzilla.kernel.org/>
References: <bug-67291-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-67291-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=67291

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Regarding point 1, I applied the following patch:

@@ -172,7 +172,8 @@ which may have discontinuities if the time is changed using
 .BR settimeofday (2).
 .TP
 .BR CLOCK_PROCESS_CPUTIME_ID " (since Linux 2.6.12)"
-High-resolution per-process timer from the CPU.
+Per-process CPU-time clock
+(measures CPU time consumed by all threads in the process).
 .TP
 .BR CLOCK_THREAD_CPUTIME_ID " (since Linux 2.6.12)"
 Thread-specific CPU-time clock.

Regarding point 2, I think the problem you are concerned about was addressed in
an earlier commit; see 
http://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/?id=78638aae3035d85ca027c003f480ff5d7921fac0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
