From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH[V2] 3/5] tzset.3: correct system timezone file path
Date: Sun, 25 Jan 2015 15:11:22 +0100
Message-ID: <54C4F98A.4070101@gmail.com>
References: <54BAFE98.2090402@gmx.com> <54BC11E2.9020906@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BC11E2.9020906-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: JWP <elseifthen-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/18/2015 09:04 PM, JWP wrote:
> The manual incorrectly states the system timezone
> path as /usr/share/zoneinfo/localtime. Glibc does
> not use that file for anything, it uses
> $(prefix)/etc/localtime.
> 
> There is an ambiguous reference in the man-page to
> /etc/localtime, but it does not indicate that it
> will be used. It states clearly that
> /usr/share/zoneinfo/localtime is used.
> 
> A comment in the glibc Makeconfig even says that
> file should not exist:
> 
>> ... relative to $(zonedir).  It is a good idea
>> to put this somewhere other than there, so the
>> zoneinfo directory contains only universal data,
>> localizing the configuration data elsewhere.
> 
> Furthermore, the man-page does not indicate the
> reason this file is being used; which is because
> it is the configured system timezone.
> 
> A later patch in this series address the
> possibility that /etc/localtime could be changed
> during glibc's compilation. The language changed
> in this patch points to the FILE section which is
> where the explanation will be. There is no reason
> to repeat that information multiple times
> throughout the man-page.

Thanks for the well-documented patch, William. Applied.

Cheers,

Michael


> EVIDENCE:
> 
> glibc/Makeconfig:256: sysconfdir = $(prefix)/etc
> glibc/Makeconfig:272: localtime-file = $(sysconfdir)/localtime
> 
> FROM INFO LIBC:
> C.2 Installing the C Library
> ============================
>    To configure the locally used timezone, set the `TZ' environment
> variable.  The script `tzselect' helps you to select the right value.
> As an example, for Germany, `tzselect' would tell you to use
> `TZ='Europe/Berlin''.  For a system wide installation (the given paths
> are for an installation with `--prefix=/usr'), link the timezone file
> which is in `/usr/share/zoneinfo' to the file `/etc/localtime'.  For
> Germany, you might execute `ln -s /usr/share/zoneinfo/Europe/Berlin
> /etc/localtime'.
> 
> STEPS TO REPRODUCE:
> 
> cd /usr/share/zoneinfo/
> cp Antarctica/South_Pole localtime
> cp /US/Eastern /etc/localtime
> cd
> date
> Sun Jan 18 12:06:36 EST 2015
> TZ=:/usr/share/zoneinfo/localtime date
> Mon Jan 19 06:06:54 NZDT 2015
> rm /etc/localtime
> date
> Sun Jan 18 17:08:37 UTC 2015
> TZ=:/usr/share/zoneinfo/localtime date
> Mon Jan 19 06:08:41 NZDT 2015
> 
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
>  man3/tzset.3 | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index 3f9b246..09fac15 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -75,15 +75,12 @@ the year when daylight saving time applies).
>  .PP
>  If the
>  .B TZ
> -variable does not appear in the environment, the \fItzname\fP
> -variable is initialized with the best approximation of local wall clock
> -time, as specified by the
> -.BR tzfile (5)-format
> -file \fIlocaltime\fP
> -found in the system timezone directory (see below).
> -(One also often sees
> -.I /etc/localtime
> -used here, a symlink to the right file in the system timezone directory.)
> +variable does not appear in the environment, the system timezone is used.
> +The system timezone is configured by copying, or linking, a file in the
> +.BR tzfile "(5) format to"
> +.IR /etc/localtime .
> +A timezone database of these files may be located in the system
> +timezone directory (see the \fBFILES\fP section below).
>  .PP
>  If the
>  .B TZ
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
