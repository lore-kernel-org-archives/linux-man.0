From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Subject: [PATCH] Correct description of /proc/sys/kernel/random/entropy_avail
Date: Tue, 13 Dec 2016 10:29:10 +0100
Message-ID: <CAKgNAkhy2USSCjznDuYw+verUXDG2JGCY0bsu1R80EMttrEzmw@mail.gmail.com>
References: <alpine.DEB.2.00.1007221816280.641@nhtr.ovalna.fjrygre.arg>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.00.1007221816280.641-8IY1rz5nw3/cU0+rfqQDSHigqES71Pyf@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Jensen <jon-O9fzpki4YnJWk0Htik3J/w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Jon,

On 23 July 2010 at 02:18, Jon Jensen <jon-O9fzpki4YnJWk0Htik3J/w@public.gmane.org> wrote:
> Patch against Git HEAD, based on others' comments on the web and empirical
> observation just reading the file repeatedly.
>
> It contains the number of bits of currently available entropy,
> not always the pool size of 4096.
> ---
>  man4/random.4 |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man4/random.4 b/man4/random.4
> index 2307e07..b097b6d 100644
> --- a/man4/random.4
> +++ b/man4/random.4
> @@ -177,9 +177,9 @@ and can be changed to any value for which an algorithm
> is available.
>  The choices are 32, 64, 128, 256, 512, 1024, or 2048.
>  .TP
>  Linux 2.6:
> -This file is read-only, and gives the size of the entropy pool in
> +This file is read-only, and gives the amount of available entropy in
>  .IR bits .
> -It contains the value 4096.
> +The value will range from 0 to 4096 in a standard kernel.
>  .RE
>  .LP
>  The file
> --
> 1.7.1.86.g0e460

Your email fell on the floor a few years ago. Sorry about that...

Long after the fact, I've applied a slightly different patch:

diff --git a/man4/random.4 b/man4/random.4
index d4bd03f..4dbf585 100644
--- a/man4/random.4
+++ b/man4/random.4
@@ -213,9 +213,8 @@ The files in the directory
 device:
 .TP
 .I entropy_avail
-This read-only file gives the available entropy.
-Normally, this will be 4096 (bits),
-a full entropy pool.
+This read-only file gives the available entropy, in bits.
+This will be a number in the range 0 to 4096.
 .TP
 .I poolsize
 This file

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
