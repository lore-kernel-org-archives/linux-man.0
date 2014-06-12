From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] times.2: spfix
Date: Thu, 12 Jun 2014 14:19:30 +0200
Message-ID: <53999AD2.7090302@gmail.com>
References: <20140612214322.6b9184d6@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140612214322.6b9184d6-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/12/2014 01:43 PM, NeilBrown wrote:
> 
> "passed" is a verb (in past tense), but the verb in this sentence (or clause,
> as "occur" is also a verb in a different clause of the sentence) is "wraps".
> "past" is, among other things, a preposition and it tells the position, with
> respect to the object ("the maximum value"), where the verb (wrapping)
> happens.
> 
> So "past" is correct, not "passed".

Quite! Thanks for the patch, Neil. Applied.

Cheers,

Michael



> diff --git a/man2/times.2 b/man2/times.2
> index e605feb6aae2..8d68efc4358c 100644
> --- a/man2/times.2
> +++ b/man2/times.2
> @@ -196,7 +196,7 @@ A limitation of the Linux system call conventions on some architectures
>  (41 seconds) soon after boot when
>  .BR times ()
>  can return \-1, falsely indicating that an error occurred.
> -The same problem can occur when the return value wraps passed
> +The same problem can occur when the return value wraps past
>  the maximum value that can be stored in
>  .BR clock_t .
>  .\" The problem is that a syscall return of -4095 to -1
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
