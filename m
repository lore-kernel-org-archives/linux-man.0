From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ptrace.2: tfix
Date: Fri, 8 Jan 2016 17:26:03 +0100
Message-ID: <568FE31B.4020609@gmail.com>
References: <1451923175-4316-1-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451923175-4316-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Jakub. Applied. And see below.

On 01/04/2016 04:59 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> 
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 1942456..395fe12 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -2085,7 +2085,7 @@ A process can
>  .B PTRACE_ATTACH
>  to any other process running under the same UID,
>  as long as the tracee is dumpable (i.e., it did
> -did not transition UIDs or start start privileged, and it has not employed
> +not transition UIDs or start start privileged, and it has not employed

There was a second error here :-). s/start start/start/. Fixed.

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
