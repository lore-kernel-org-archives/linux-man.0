From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] tzset.3: Add description for posixrules file
Date: Thu, 29 Jan 2015 06:51:35 +0100
Message-ID: <54C9CA67.4080009@gmail.com>
References: <54BAFE98.2090402@gmx.com> <54BC126E.1080904@gmx.com> <54C4F9E7.6090104@gmail.com> <54C97B45.2070300@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54C97B45.2070300-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi William,

This patch also does not apply. Some comments also below.

On 01/29/2015 01:13 AM, J William Piggott wrote:
> 
> Based upon reviewing the glibc source, the posixrules file is being used
> for very specific TZ strings that can be represented as:
> 
> [:]stdoffsetdst[offset][,]
> 
> If anything follows the above string, even invalid data, posixrules will
> not be used. Below is some shell output demonstrating this.
> 
> $ TZ="NZST-12:00:00NZDT-13:00:00,ANYTHING" \
>> strace -eopen date 2>&1 | grep -Ei 'posixrules|jan'
> Thu Jan 29 06:53:35 NZDT 2015
> 
> $ TZ="NZST-12:00:00NZDT-13:00:00," \
>> strace -eopen date 2>&1 | grep -Ei 'posixrules|jan'
> open("/usr/share/zoneinfo/posixrules", O_RDONLY|O_CLOEXEC) = 3
> Thu Jan 29 05:54:58 NZST 2015
> 
> Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
> ---
>  man3/tzset.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index 9011e5f..2e91fd8 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -201,6 +201,11 @@ The system timezone file.
>  The system timezone database directory.
>  .TP
>  .B /usr/share/zoneinfo/posixrules
> +When a TZ string includes a dst timezone without anything following it,
> +then this file is used for the start/end rules. It is in the

Please start new sentences on new source lines. (See man-pages(7).)

> +.B tzfile(5)
> +format. By default, the zoneinfo Makefile hard links it to the

As above.

> +.IR America/New_York " tzfile."
>  .PP
>  Above are the current standard file locations, but they are
>  configurable when glibc is compiled.
> 

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
