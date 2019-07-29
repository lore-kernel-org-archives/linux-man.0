From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Error (?) in man page for ppoll(2)
Date: Mon, 29 Jul 2019 14:07:23 +0200
Message-ID: <4ce02b01-f174-99a1-ac34-21a2c6414df2@gmail.com>
References: <Pine.LNX.4.44L0.1907211104350.15063-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1907211104350.15063-100000@netrider.rowland.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>, linux-man@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>
Cc: mtk.manpages@gmail.com
List-Id: linux-man@vger.kernel.org

Hello Alan,

On 7/21/19 5:32 PM, Alan Stern wrote:
> Here are two extracts from the man page for ppoll(2) (from the
> man-pages 4.16 package; the 5.01 version is the same):
> 
>        Specifying a negative value in timeout means an infinite timeout.
> 
> 
>        Other than the difference in the precision of the timeout argument, the
>        following ppoll() call:
> 
>            ready = ppoll(&fds, nfds, tmo_p, &sigmask);
> 
>        is equivalent to atomically executing the following calls:
> 
>            sigset_t origmask;
>            int timeout;
> 
>            timeout = (tmo_p == NULL) ? -1 :
>                      (tmo_p->tv_sec * 1000 + tmo_p->tv_nsec / 1000000);
>            pthread_sigmask(SIG_SETMASK, &sigmask, &origmask);
>            ready = poll(&fds, nfds, timeout);
>            pthread_sigmask(SIG_SETMASK, &origmask, NULL);
> 
> But if tmo_p->tv_sec is negative, the ppoll() call is not equivalent to 
> the corresponding poll() call.  The kernel rejects negative values of 
> tv_sec with an EINVAL error; it does not interpret the value as meaning 
> an infinite timeout.
> 
> (Yes, the kernel interprets tmo_p == NULL as an infinite timeout, but 
> the man page is still wrong for the case tmo_p->tv_sec < 0.)
> 
> Suggested fix: Following the end of the second extract above, add:
> 
> 	except that negative time values in tmo_p are not interpreted
> 	as an infinite timeout.
> 
> Also, in the ERRORS section, change the text for EINVAL to:
> 
> 	EINVAL The nfds value exceeds the RLIMIT_NOFILE value or
> 	*tmo_p contains an invalid (negative) time value.

Thanks for the report, and the text change suggestions.
I've applied the patch below.

Thanks,

Michael

diff --git a/man2/poll.2 b/man2/poll.2
index 0b023e0a5..3eacb88b7 100644
--- a/man2/poll.2
+++ b/man2/poll.2
@@ -271,7 +271,7 @@ ready = ppoll(&fds, nfds, tmo_p, &sigmask);
 .EE
 .in
 .PP
-is equivalent to
+is nearly equivalent to
 .I atomically
 executing the following calls:
 .PP
@@ -288,6 +288,17 @@ pthread_sigmask(SIG_SETMASK, &origmask, NULL);
 .EE
 .in
 .PP
+The above code segment is described as
+.I nearly
+equivalent because whereas a negative
+.I timeout
+value for
+.BR poll ()
+is interpreted as an infinite timeout, a negative value expressed in
+.IR *tmo_p
+results in an error from
+.BR ppoll ().
+.PP
 See the description of
 .BR pselect (2)
 for an explanation of why
@@ -354,6 +365,12 @@ value exceeds the
 .B RLIMIT_NOFILE
 value.
 .TP
+.B EINVAL
+.RB ( ppoll ())
+The timeout value expressed in
+.IR *ip
+is invalid (nragtive).
+.TP
 .B ENOMEM
 There was no space to allocate file descriptor tables.
 .SH VERSIONS

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
