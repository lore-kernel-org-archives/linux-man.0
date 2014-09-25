From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wait.2: Add paragraph break before errno note in RETURN
 VALUE section.
Date: Thu, 25 Sep 2014 12:20:36 +0200
Message-ID: <5423EC74.7000908@gmail.com>
References: <5422E979.8030606@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5422E979.8030606-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/24/2014 05:55 PM, Carlos O'Donell wrote:
> The text "Each of these calls sets errno to an appropriate
> value in the case of an error." is not only for waitid.
> 
> This patch adds a paragraph break to move the errno note
> to a new paragraph where it makes sense, as it applies to
> all the wait* functions.
> 
> Tested against upstream master.

Thanks, Carlos. Applied.

Cheers,

Michael



> diff --git a/man2/wait.2 b/man2/wait.2
> index 224055f..4d5fc77 100644
> --- a/man2/wait.2
> +++ b/man2/wait.2
> @@ -378,6 +378,7 @@ on error, \-1 is returned.
>  .\" returns the PID of the child.  Either this is a bug, or it is intended
>  .\" behavior that needs to be documented.  See my Jan 2009 LKML mail
>  .\" "waitid() return value strangeness when infop is NULL".
> +.PP
>  Each of these calls sets
>  .I errno
>  to an appropriate value in the case of an error.
> ---
> 
> Cheers,
> Carlos.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
