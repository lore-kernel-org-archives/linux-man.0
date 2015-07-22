From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch v3] perf_event_open.2: Exclude_host/exclude_guest clarification
Date: Wed, 22 Jul 2015 20:54:44 +0200
Message-ID: <55AFE6F4.4080608@gmail.com>
References: <alpine.DEB.2.20.1507211203040.29103@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1507211203040.29103-6xBS8L8d439fDsnSvq7Uqyn2WXadKZNJe7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnaldo Carvalho de Melo <acme-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gleb Natapov <gleb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 07/21/2015 06:05 PM, Vince Weaver wrote:
> 
> This patch relates to the exclude_host and exclude_guest bits added
> by the following commit:
> 
>    exclude_host, exclude_guest; Linux 3.2
>         commit a240f76165e6255384d4bdb8139895fac7988799
>         Author: Joerg Roedel <joerg.roedel-5C7GfCeVMHo@public.gmane.org>
>         Date:   Wed Oct 5 14:01:16 2011 +0200
> 
>             perf, core: Introduce attrs to count in either host or guest mode
> 
>             Signed-off-by: Joerg Roedel <joerg.roedel-5C7GfCeVMHo@public.gmane.org>
>             Signed-off-by: Gleb Natapov <gleb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>             Signed-off-by: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
>             Link: http://lkml.kernel.org/r/1317816084-18026-2-git-send-email-gleb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
>             Signed-off-by: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
> 
> The updated manpage text clarifies that the "exclude_host" and
> "exclude_guest" perf_event_open() attr bits only apply in the
> context of a KVM environment and are currently x86 only.
> 
> The patch is the same as the previous version with the addition
> of Joerf Roedel's ACK.

Thanks, Vince. Applied.

Cheers,

Michael


> Signed-off-by: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
> Acked-by: Joerg Roedel <jroedel-l3A5Bk7waGM@public.gmane.org>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index 39c8d8c..1ea56c9 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1006,11 +1006,25 @@ struct sample_id {
>  .TP
>  .IR "exclude_host" " (since Linux 3.2)"
>  .\" commit a240f76165e6255384d4bdb8139895fac7988799
> -Do not measure time spent in VM host.
> +When conducting measurements that include processes running
> +VM instances (i.e. have executed a
> +.I KVM_RUN
> +.BR ioctl (2)
> +) only measure events happening inside a guest instance.
> +This is only meaningful outside the guests; this setting does
> +not change counts gathered inside of a guest.
> +Currently this functionality is x86 only.
>  .TP
>  .IR "exclude_guest" " (since Linux 3.2)"
>  .\" commit a240f76165e6255384d4bdb8139895fac7988799
> -Do not measure time spent in VM guest.
> +When conducting measurements that include processes running
> +VM instances (i.e. have executed a
> +.I KVM_RUN
> +.BR ioctl (2)
> +) do not measure events happening inside guest instances.
> +This is only meaningful outside the guests; this setting does
> +not change counts gathered inside of a guest.
> +Currently this functionality is x86 only.
>  .TP
>  .IR "exclude_callchain_kernel" " (since Linux 3.7)"
>  .\" commit d077526485d5c9b12fe85d0b2b3b7041e6bc5f91
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
