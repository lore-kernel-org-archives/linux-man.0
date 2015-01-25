From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH[V2] 5/5] tzset.3: TZ filespec omitts the colon
Date: Sun, 25 Jan 2015 15:11:46 +0100
Message-ID: <54C4F9A2.1000402@gmail.com>
References: <54BAFE98.2090402@gmx.com> <54BC132A.8090504@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BC132A.8090504-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: JWP <elseifthen-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/18/2015 09:10 PM, JWP wrote:
> If the TZ filespec omits the leading colon, glibc
> will parse it for any valid format, i.e., it will
> still work.
> 
> STEPS TO REPRODUCE:
> TZ=:Europe/Kiev date
> Sun Jan 18 20:19:13 EET 2015
> TZ=Europe/Kiev date
> Sun Jan 18 20:19:20 EET 2015

Thanks, William. Applied.

Cheers,

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
>  man3/tzset.3 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index b49c8ee..5c721b6 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -173,7 +173,8 @@ If \fIfilespec\fP is given, it specifies another
>  .BR tzfile (5)-format
>  file to read the timezone information from.
>  If \fIfilespec\fP does not begin with a \(aq/\(aq, the file specification is
> -relative to the system timezone directory.
> +relative to the system timezone directory.  If the colon is omitted each
> +of the above three \fBTZ\fP formats will be tried in order.
>  .PP
>  Here's an example, once more for New Zealand:
>  .nf
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
