From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Man Page Simple Error: GETPRIORITY(2)
Date: Sat, 2 Jul 2016 10:22:22 +0200
Message-ID: <e9bc7cfb-45e0-d840-ffe6-e87aeffa499c@gmail.com>
References: <CAAztzVFFvLPCKe+rXdxBXEBrmtTwL58-JQ0OV2ZcuLueUSYAcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAztzVFFvLPCKe+rXdxBXEBrmtTwL58-JQ0OV2ZcuLueUSYAcQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Kuzmin <kuzmin.robin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Robin,

On 06/30/2016 12:35 AM, Robin Kuzmin wrote:
> http://man7.org/linux/man-pages/man2/getpriority.2.html     2015-07-23
>
> 1.
> What I see: "lower priorities cause more favorable scheduling".
> What I expect: "lower values (higher priority) cause more favorable
> scheduling".
>
> 2.
> What I see: "Only the superuser may lower priorities".
> What I expect: "Only the superuser may lower values (boost/increase the
> priorities)".
>
> 3.
> What I see: "The caller attempted to lower a process priority".
> What I expect: "The caller attempted to lower a priority value (to increase
> a priority)".
>
> 4.
> Add to section "SEE ALSO" the reference to "nice(2)" -
> http://man7.org/linux/man-pages/man2/nice.2.html
>
> Why I think so: The man page GETPRIORITY(2) should be in synch with nice(2)
> http://man7.org/linux/man-pages/man2/nice.2.html
> Both getpriority(2) and nice(2) are referred by sched(7) section
> "SCHED_OTHER: Default Linux time-sharing scheduling" -
> http://man7.org/linux/man-pages/man7/sched.7.html.

Thanks for the note. The text could indeed be better. I've made
various changes, including your suggestions. See the diff below.
Thanks for the report.

Cheers,

Michael

--- a/man2/getpriority.2
+++ b/man2/getpriority.2
@@ -64,6 +64,9 @@ is obtained with the
  call and set with the
  .BR setpriority ()
  call.
+The process attribute dealt with by these system calls is
+the same attribute (also known as the "nice" value) that is dealt with by
+.BR nice (2).
  
  The value
  .I which
@@ -87,11 +90,13 @@ A zero value for
  .I who
  denotes (respectively) the calling process, the process group of the
  calling process, or the real user ID of the calling process.
+
  The
  .I prio
  argument is a value in the range \-20 to 19 (but see NOTES below).
+with \-20 being the highest priority and 19 being the lowest priority.
  The default priority is 0;
-lower priorities cause more favorable scheduling.
+lower values give a process a higher scheduling priority.
  
  The
  .BR getpriority ()
@@ -101,7 +106,15 @@ The
  .BR setpriority ()
  call sets the priorities of all of the specified processes
  to the specified value.
-Only the superuser may lower priorities.
+
+Traditionally, only a privileged process could lower the nice value
+(i.e., set a higher priority).
+However, since Linux 2.6.12, an unprivileged process can decrease
+the nice value of a target process that has a suitable
+.BR RLIMIT_NICE
+soft limit; see
+.BR getrlimit (2)
+for details.
  .SH RETURN VALUE
  Since
  .BR getpriority ()
@@ -137,16 +150,11 @@ In addition to the errors indicated above,
  may fail if:
  .TP
  .B EACCES
-The caller attempted to lower a process priority, but did not
+The caller attempted to set a lower nice value
+(i.e., a higher process priority), but did not
  have the required privilege (on Linux: did not have the
  .B CAP_SYS_NICE
  capability).
-Since Linux 2.6.12, this error occurs only if the caller attempts
-to set a process priority outside the range of the
-.B RLIMIT_NICE
-soft resource limit of the target process; see
-.BR getrlimit (2)
-for details.
  .TP
  .B EPERM
  A process was located, but its effective user ID did not match



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
