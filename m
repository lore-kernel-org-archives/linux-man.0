From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] personality.2: Note kernel and glibc versions that
 introduced this syscall
Date: Sat, 26 Dec 2015 08:48:53 +0100
Message-ID: <567E4665.5020105@gmail.com>
References: <20151224224705.GA21155@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151224224705.GA21155-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Dmitry,

On 12/24/2015 11:47 PM, Dmitry V. Levin wrote:
> Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
> ---
>  man2/personality.2 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man2/personality.2 b/man2/personality.2
> index d5e3364..f41a339 100644
> --- a/man2/personality.2
> +++ b/man2/personality.2
> @@ -70,6 +70,11 @@ is set appropriately.
>  .TP
>  .B EINVAL
>  The kernel was unable to change the personality.
> +.SH VERSIONS
> +This system call first appeared in Linux 1.1.20;
> +library support was added in glibc 2.3.
> +.\" personality wrapper first appeared in glibc 1.90,
> +.\" <sys/personality.h> was added later in 2.2.91.
>  .SH CONFORMING TO
>  .BR personality ()
>  is Linux-specific and should not be used in programs intended to

For lack of time, I've tended not to add this kind of
information for longstanding system calls. So, I'm very happy
when someone else adds it :-). Thanks. Patch applied.

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
