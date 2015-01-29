From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 1/1] tzset.3: Add Environment section
Date: Thu, 29 Jan 2015 06:50:09 +0100
Message-ID: <54C9CA11.207@gmail.com>
References: <54BAFE98.2090402@gmx.com> <54BC126E.1080904@gmx.com> <54C4F9E7.6090104@gmail.com> <54C97A2D.2050908@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54C97A2D.2050908-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi William,

Both of your patches don't apply. I've not looked closely at
why. Could you check them please. See also comments below

On 01/29/2015 01:09 AM, J William Piggott wrote:
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -182,28 +182,28 @@ Here's an example, once more for New Zealand:
>       TZ=":Pacific/Auckland"
>  .fi
> +.SH ENVIRONMENT
> +.TP
> +.B TZ
> +.RB If \ TZ
> +is set, 

Just make this: "If this variable is set..."

> its value takes precedence over the system configured timezone.
> +.TP
> +.B TZDIR
> +.RB If \ TZDIR
> +is set, 

Just make this: "If this variable is set..."

> its value takes precedence over the system configured timezone
> +database directory path.
>  .SH FILES
> -Under glibc,
> -the system timezone directory is determined using the
> -.BR TZDIR
> -the environment variable.
> -If
> -.BR TZDIR
> -is not set, the default depends on the system setup, but is normally
> -.IR /usr/share/zoneinfo .
> -.LP
> -This timezone directory contains the files
> -
> -.nf
> -    localtime      local timezone file
> -    posixrules     rules for POSIX-style TZ's
> -.fi
> -.LP
> -Often,
> -.I /etc/localtime
> -is a symbolic link to the file
> -.I localtime
> -or to the correct timezone file in the system timezone directory.
> +.TP
> +.B /etc/localtime
> +The system timezone file.
> +.TP
> +.B /usr/share/zoneinfo/
> +The system timezone database directory.
> +.TP
> +.B /usr/share/zoneinfo/posixrules
> +.PP
> +Above are the current standard file locations, but they are
> +configurable when glibc is compiled.
>  .SH CONFORMING TO
>  SVr4, POSIX.1-2001, 4.3BSD.
>  .SH NOTES

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
