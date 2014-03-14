From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] core.5: document new %P and %d options
Date: Fri, 14 Mar 2014 15:12:59 +0100
Message-ID: <CAKgNAkjOZstcV6K=dZCtsyMF=rFpiBZH4PUBCydPsLgjWySbrQ@mail.gmail.com>
References: <1394802759-24006-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394802759-24006-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Mike,

On Fri, Mar 14, 2014 at 2:12 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man5/core.5 | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/man5/core.5 b/man5/core.5
> index 86c8c57..9e328f9 100644
> --- a/man5/core.5
> +++ b/man5/core.5
> @@ -127,7 +127,12 @@ by the following values when a core file is created:
>  a single % character
>  .TP
>  %p
> -PID of dumped process
> +PID of dumped process (as seen in the current namespace)
> +.TP
> +.\" Added in git commit 65aafb1e7484b7434a0c1d4c593191ebe5776a2f
> +%P
> +global PID of dumped process (as seen in init's namespace)
> +(since Linux 3.12)
>  .TP
>  %u
>  (numeric) real UID of dumped process
> @@ -138,6 +143,11 @@ PID of dumped process
>  %s
>  number of signal causing dump
>  .TP
> +.\" Added in git commit 12a2b4b2241e318b4f6df31228e4272d2c2968a1
> +%d
> +dump mode; matches PR_SET_DUMPABLE and /proc/sys/fs/suid_dumpable
> +(since Linux 3.7)
> +.TP
>  %t
>  time of dump, expressed as seconds since the
>  Epoch, 1970-01-01 00:00:00 +0000 (UTC)

Thanks. Applied. I then tweaked the texts a little:

           %d  dump   mode--same   as   value   returned   by  prctl(2)
               PR_GET_DUMPABLE (since Linux 3.7)
           %p  PID  of dumped process, as seen in the PID namespace in
               which the process resides
           %P  PID of dumped process,  as  seen  in  the  initial  PID
               namespace (since Linux 3.12)

Okay?

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
