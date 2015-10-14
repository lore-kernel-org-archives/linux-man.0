From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 04/11] perf_event_open.2: 4.1 data_offset and data_size
 fields
Date: Wed, 14 Oct 2015 08:29:24 +0200
Message-ID: <561DF644.4030703@gmail.com>
References: <alpine.DEB.2.20.1507231310270.3742@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1507231310270.3742-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Frederic Weisbecker <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Kaixu Xia <kaixu.xia-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, markus.t.metzger-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/23/2015 07:11 PM, Vince Weaver wrote:
> 
> This manpage patch relates to the addition of the data_offset
> and data_size fields to the perf_event mmap buffer, as added
> in the following commit:

Thanks, Vince. Applied.

Cheers,

Michael



> 	commit e8c6deac69629c0cb97c3d3272f8631ef17f8f0f
> 	Author: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> 
> 	perf: Add data_{offset,size} to user_page
> 
> 	Signed-off-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> 	Signed-off-by: Peter Zijlstra (Intel) <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> 	Cc: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
> 	Cc: Frederic Weisbecker <fweisbec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 	Cc: H. Peter Anvin <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
> 	Cc: Kaixu Xia <kaixu.xia-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 	Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> 	Cc: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
> 	Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> 	Cc: Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 	Cc: Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> 	Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> 	Cc: acme-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
> 	Cc: adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
> 	Cc: kan.liang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
> 	Cc: markus.t.metzger-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
> 	Cc: mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
> 	Link: http://lkml.kernel.org/r/1421237903-181015-2-git-send-email-alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
> 	Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> 
> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 09eda9a..a3bebaa 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1414,6 +1414,9 @@ struct perf_event_mmap_page {
>      __u64 __reserved[120];   /* Pad to 1k */
>      __u64 data_head;         /* head in the data section */
>      __u64 data_tail;         /* user-space written tail */
> +    __u64 data_offset;       /* where the buffer starts */
> +    __u64 data_size;         /* data buffer size */
> +
>  }
>  .fi
>  .in
> @@ -1630,6 +1633,16 @@ the
>  .I data_tail
>  value should be written by user space to reflect the last read data.
>  In this case, the kernel will not overwrite unread data.
> +.TP
> +.IR data_offset " (since Linux 4.1)"
> +.\" commit e8c6deac69629c0cb97c3d3272f8631ef17f8f0f
> +Contains the offset of the location in the mmap buffer
> +where perf sample data begins.
> +.TP
> +.IR data_size " (since Linux 4.1)"
> +.\" commit e8c6deac69629c0cb97c3d3272f8631ef17f8f0f
> +Contains the size of the perf sample region within
> +the mmap buffer.
>  .PP
>  The following 2^n ring-buffer pages have the layout described below.
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
