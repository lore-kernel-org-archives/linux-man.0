From: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] prctl: Add PR_SET_MM option description
Date: Sun, 15 Apr 2012 10:54:01 +0400
Message-ID: <20120415065401.GA25380@moon>
References: <1330518197-12825-1-git-send-email-gorcunov@openvz.org>
 <1330518197-12825-2-git-send-email-gorcunov@openvz.org>
 <CAKgNAkgwapZXw5gR_sSGyfufybY52S4qD1MjPDKs+6tBcgFJUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkgwapZXw5gR_sSGyfufybY52S4qD1MjPDKs+6tBcgFJUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Apr 15, 2012 at 03:48:18PM +1200, Michael Kerrisk (man-pages) wrote:
> Cyrill,
> 
> While reviewing your patch to the prctl() manual page, I noticed the
> following code inkernel/sys.c::prctl_set_mm():
> 
>         if (opt != PR_SET_MM_START_BRK && opt != PR_SET_MM_BRK) {
>                 /* It must be existing VMA */
>                 if (!vma || vma->vm_start > addr)
>                         goto out;
>         }
> 
> At this point, the code causes an exit with error set to zero (i.e.,
> success). This looks unintended to me. Is the code correct? I suspect
> a return of -EFAULT or -ENOMEM is warranted.

Hi Michael, yup, -EINVAL escaped (I think EFAULT or ENOMEM is not really
good here). I'll fix and send update. Thanks!

	Cyrill
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
