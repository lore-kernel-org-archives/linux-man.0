From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] CPU_SET.3: clarify language about "available" cpus
Date: Mon, 04 May 2015 15:13:24 +0200
Message-ID: <55477074.6010903@gmail.com>
References: <4CD2F4CB.7020807@tilera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4CD2F4CB.7020807-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Metcalf <cmetcalf-kv+TWInifGbQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Chris,

On 11/04/2010 07:00 PM, Chris Metcalf wrote:
> The CPU_SET.3 man page uses the adjective "available" when explaining what
> the argument to CPU_SET() means.  This is confusing, since "available"
> isn't well-defined.  The kernel has a set of adjectives (possible, present,
> online, and active) that qualify cpus, but normally none of these are what
> the cpu_set_t bit index means: it's just "which cpu", using the kernel's
> internal numbering system, even if that cpu isn't possible or present.
> 
> This change removes the word "available" and adds a sentence warning that
> cpu sets may not be contiguous due to dynamic cpu hotplug, etc.

Long after the fact, I've applied this patch.

Cheers,

Michael

> --- man3/CPU_SET.3.orig 2010-11-04 13:53:13.714684000 -0400
> +++ man3/CPU_SET.3      2010-11-04 13:54:59.972042000 -0400
> @@ -124,11 +124,14 @@
>  argument is specified, it should not produce side effects,
>  since the above macros may evaluate the argument more than once.
>  .PP
> -The first available CPU on the system corresponds to a
> +The first CPU on the system corresponds to a
>  .I cpu
>  value of 0, the next CPU corresponds to a
>  .I cpu
>  value of 1, and so on.
> +No assumptions should be made about particular CPUs being
> +available, or the set of CPUs being contiguous, since CPUs can
> +be taken offline dynamically or be otherwise absent.
>  The constant
>  .B CPU_SETSIZE
>  (currently 1024) specifies a value one greater than the maximum CPU
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
