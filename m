From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getcontext.3: Exemplar structure should use 'ucontext_t'.
Date: Wed, 5 Jul 2017 10:31:00 +0200
Message-ID: <12b8b7cd-80b6-4db2-a1ab-f6c1b689c597@gmail.com>
References: <41ce95e3-7d93-a5e7-b186-e4335ee09921@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <41ce95e3-7d93-a5e7-b186-e4335ee09921-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/29/2017 06:17 PM, Carlos O'Donell wrote:
> getcontext.3: Exemplar structure should use 'ucontext_t'.
> 
> In glibc we just finished a round of purging 'struct ucontext' which
> is not in the POSIX reserved namespace of *_t tags. This has some
> consequences to applications using the non-standard struct ucontext:
> https://sourceware.org/glibc/wiki/Release/2.26#Removal_of_.27struct_ucontext.27
> but it also fixes a namespace conformance issue which is always a longterm
> pain for large portable programs.
> 
> It was noted by Peter Maydell (https://sourceware.org/bugzilla/show_bug.cgi?id=21457)
> that the linux man pages still had references to 'struct ucontext' but only in
> the form of an exemplar structure.
> 
> The following patch fixes the exemplar to match what is in glibc and therefore
> it won't ever suggest users can use 'struct ucontext'.
> 
> Applies to master.

Thanks, Carlos. Applied.

Cheers,

Michael

> Please apply.
> 
> Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> diff --git a/man3/getcontext.3 b/man3/getcontext.3
> index c31a46b..de54d12 100644
> --- a/man3/getcontext.3
> +++ b/man3/getcontext.3
> @@ -57,11 +57,11 @@ the following fields:
>  .in +4
>  .nf
>  
> -typedef struct ucontext {
> -    struct ucontext *uc_link;
> -    sigset_t         uc_sigmask;
> -    stack_t          uc_stack;
> -    mcontext_t       uc_mcontext;
> +typedef struct ucontext_t {
> +    struct ucontext_t *uc_link;
> +    sigset_t          uc_sigmask;
> +    stack_t           uc_stack;
> +    mcontext_t        uc_mcontext;
>      ...
>  } ucontext_t;
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
