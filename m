From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH[V2] 4/5] tzset.3: Add Environment section
Date: Sun, 25 Jan 2015 15:12:55 +0100
Message-ID: <54C4F9E7.6090104@gmail.com>
References: <54BAFE98.2090402@gmx.com> <54BC126E.1080904@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BC126E.1080904-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: JWP <elseifthen-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi William,

On 01/18/2015 09:07 PM, JWP wrote:
> FILES section was overly verbose and included
> environment variables.  Added ENVIRONMENT section,
> removing ENV VARS from the FILES section.
> Corrected Files section items.
> 
> As stated in the previous commit
> /usr/share/zoneinfo/localtime
> is not used, nor recommended by glibc.

I suspect this patch might have been better split into the piece
above and below, because the piece below seems somewhat distinct,
and also I wonder about its correctness.

> Also not used is:
> /usr/share/zoneinfo/posixrules
> 
> STEPS TO REPRODUCE NO posixrules:
> 
> TZ=EST+5EDT,M1.3.0/2,M10.5.0/2 date
> Sun Jan 18 14:01:24 EDT 2015
> TZ=EST+5EDT,M1.4.0/2,M10.5.0/2 date
> Sun Jan 18 13:01:27 EST 2015

Two questions:
* I need some help with the shell output above. How does
  it demonstrate that posixrules is not used?
* Are you sure about this? A cursory grep through the 
  glibc source shows instances of the string "posixrules".
  See also the zic(8) man page.

While waiting to clear this up, I've not applied this patch.

Thanks,

Michael


> Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
> ---
> 
> The following changes since commit b58839b96d626e67da233d4bf7ba04d5dfcd0e66:
> 
>   syscalls.2: Remove some details for sync_file_range2() (2015-01-18 19:56:05 +0100)
> 
> are available in the git repository at:
> 
>   git-9UaJU3cA/F/QT0dZR+AlfA@public.gmane.org:jwpi/man-pages.git tzset
> 
> for you to fetch changes up to 2b0725c0b6f6788628567ea4d5cfc396898584a0:
> 
>   tzset.3: TZ filespec omitts the colon (2015-01-18 14:40:21 -0500)
> 
> 
>  man3/tzset.3 | 40 +++++++++++++++++++---------------------
>  1 file changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index 09fac15..b49c8ee 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -180,28 +180,26 @@ Here's an example, once more for New Zealand:
>  
>      TZ=":Pacific/Auckland"
>  .fi
> +.SH ENVIRONMENT
> +.TP
> +.B TZ
> +.RB If \ TZ
> +is set, its value takes precedence over the system configured timezone.
> +.TP
> +.B TZDIR
> +.RB If \ TZDIR
> +is set, its value takes precedence over the system configured timezone
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
> +.PP
> +Above are the current standard file locations, but they are
> +configurable when glibc is compiled.
>  .SH CONFORMING TO
>  SVr4, POSIX.1-2001, 4.3BSD.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
