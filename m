From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch v2] perf_event_open.2 : document PERF_FLAG_FD_CLOEXEC
 flag
Date: Wed, 02 Apr 2014 09:41:19 +0200
Message-ID: <533BBF1F.4070608@gmail.com>
References: <alpine.DEB.2.10.1404011734320.17339@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1404011734320.17339-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/01/2014 11:36 PM, Vince Weaver wrote:
> 
> The Linux 3.14 release adds support for the PERF_FLAG_FD_CLOEXEC flag to
> perf_event_open.2
> 
> This version tries to clarify that the close-on-exec behavior applies to 
> the current file descriptor being created.
> 
> The wording is based on the description in kernel commit
> a21b0b354d4ac39be691f51c53562e2c24443d9e 
> by Yann Droneaud <ydroneaud-RlY5vtjFyJ3QT0dZR+AlfA@public.gmane.org>

Thanks, Vince. 

I applied, and reworked the text to be:

       PERF_FLAG_FD_CLOEXEC (since Linux 3.14).
              This flag enables the close-on-exec flag for the created
              event  file  descriptor,  so that the file descriptor is
              automatically closed on execve(2).  Setting  the  close-
              on-exec  flags at  creation time, rather than later with
              fcntl(2), avoids potential  race  conditions  where  the
              calling  thread  invokes  perf_event_open()  at the same
              time as another thread calls fork(2) then execve(2).

Okay?

Cheers,

Michael

> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 30a2168..b4a49c4 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -164,6 +164,19 @@ must be passed as the
>  parameter.
>  cgroup monitoring is available only
>  for system-wide events and may therefore require extra permissions.
> +.TP
> +.BR PERF_FLAG_FD_CLOEXEC " (since Linux 3.14)."
> +This flag enables close-on-exec behavior for the created
> +event file descriptor, removing it from the list of
> +file descriptors inherited across exec.
> +Setting this behavior atomically at creation time rather than
> +later with
> +.BR fctl (2)
> +avoids potential race conditions between the current thread and
> +another calling
> +.BR fork (2)
> +then
> +.BR execve(2).
>  .P
>  The
>  .I perf_event_attr
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
