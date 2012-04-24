From: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bad error return after find_vma() in PR_SET_MM code
Date: Tue, 24 Apr 2012 11:12:15 -0400
Message-ID: <4F96C2CF.5070900@gmail.com>
References: <CAKgNAkjWdy_SYaJsNXUOv7cNL2xwZNW7FCdRsT6wiRFb0dmetw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjWdy_SYaJsNXUOv7cNL2xwZNW7FCdRsT6wiRFb0dmetw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-3NddpPZAyC0@public.gmane.org>, kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

(4/15/12 12:00 AM), Michael Kerrisk (man-pages) wrote:
> [Bother! Resending with corrected subject line (was "[PATCH 1/2]
> prctl: Add PR_SET_MM option description")]
>
> Cyrill,
>
> While reviewing your patch to the prctl() manual page, I noticed the
> following code in kernel/sys.c::prctl_set_mm():
>
>         if (opt != PR_SET_MM_START_BRK&&  opt != PR_SET_MM_BRK) {
>                 /* It must be existing VMA */
>                 if (!vma || vma->vm_start>  addr)
>                         goto out;
>         }
>
> At this point, the code causes an exit with error set to zero (i.e.,
> success). This looks unintended to me. Is the code correct? I suspect
> a return of -EFAULT or -ENOMEM is warranted.

EFAULT please when detecting invalid vma.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
