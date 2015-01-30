From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/1] tzset.3: Add description for posixrules file
Date: Fri, 30 Jan 2015 07:04:25 +0100
Message-ID: <54CB1EE9.6070504@gmail.com>
References: <54BAFE98.2090402@gmx.com> <54BC126E.1080904@gmx.com> <54C4F9E7.6090104@gmail.com> <54C97B45.2070300@gmx.com> <54C9CA67.4080009@gmail.com> <54CA604A.1050500@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54CA604A.1050500-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/29/2015 05:31 PM, J William Piggott wrote:
> Based upon reviewing the glibc source, the posixrules file is being used
> for very specific TZ strings that can be represented as:
> 
> [:]stdoffsetdst[offset][,]
> 
> If anything follows the above string, even invalid data, posixrules will
> not be used. Below is some shell output demonstrating this.
> 
> $ TZ="NZST-12:00:00NZDT-13:00:00,ANYTHING" \
> strace -eopen date 2>&1 | grep -Ei 'posixrules|jan'
> Thu Jan 29 06:53:35 NZDT 2015
> 
> $ TZ="NZST-12:00:00NZDT-13:00:00," \
> strace -eopen date 2>&1 | grep -Ei 'posixrules|jan'
> open("/usr/share/zoneinfo/posixrules", O_RDONLY|O_CLOEXEC) = 3
> Thu Jan 29 05:54:58 NZST 2015

Thanks, William. Applied.

Cheers,

Michael



> Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
> ---
>  man3/tzset.3 | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index a9b088d..9cb9d32 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -200,6 +200,12 @@ The system timezone file.
>  The system timezone database directory.
>  .TP
>  .B /usr/share/zoneinfo/posixrules
> +When a TZ string includes a dst timezone without anything following it,
> +then this file is used for the start/end rules.
> +It is in the
> +.BR tzfile "(5) format."
> +By default, the zoneinfo Makefile hard links it to the
> +.IR America/New_York " tzfile."
>  .PP
>  Above are the current standard file locations, but they are
>  configurable when glibc is compiled.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
