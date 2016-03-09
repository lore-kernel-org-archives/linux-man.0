From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] execve.2: EPERM from filesystem capabilities.
Date: Wed, 9 Mar 2016 01:49:41 +0100
Message-ID: <56DF7325.9030702@gmail.com>
References: <20151012194506.GA6346@box2.japko.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151012194506.GA6346-xLeyfSbClftGit24Ens98Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Adamski <k@japko.eu>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Krzysztof

Sorry for the delayed follow up.

On 10/12/2015 09:45 PM, Krzysztof Adamski wrote:
> An EPERM error can be returned when using filesystem capabilities and
> capabilities to be added are not in permitted set.
> 
> This error return values was introduced by this patch:
> 5459c16 security: protect legacy applications from executing with
> insufficient privilege

Can you explain in more detail the scenario where EPERM can be produced.
I can't see/produce it. Also, the code in the commit that you mention,
which was part of Linux 2.6.27, was thoroughly changed in Linux 2.6.29.

Cheers,

Michael


> Signed-off-by: Krzysztof Adamski <k@japko.eu>
> ---
>  man2/execve.2 | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/man2/execve.2 b/man2/execve.2
> index 8f4c616..723e622 100644
> --- a/man2/execve.2
> +++ b/man2/execve.2
> @@ -465,6 +465,10 @@ and the file has the set-user-ID or set-group-ID bit set.
>  The process is being traced, the user is not the superuser and the
>  file has the set-user-ID or set-group-ID bit set.
>  .TP
> +.BR EPERM " (since Linux 2.6.27)"
> +The file has filesystem capabilities defined that are not on a permitted set of
> +capabilities of the process.
> +.TP
>  .B ETXTBSY
>  Executable was open for writing by one or more processes.
>  .SH CONFORMING TO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
