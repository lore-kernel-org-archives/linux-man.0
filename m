From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH[V2] 2/5] tzset.3: First TZ specification clarification
Date: Sun, 25 Jan 2015 15:10:50 +0100
Message-ID: <54C4F96A.7000209@gmail.com>
References: <54BAFE98.2090402@gmx.com> <54BC1172.5060100@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BC1172.5060100-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: JWP <elseifthen-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello William,

On 01/18/2015 09:02 PM, JWP wrote:
> The second TZ specification states that no spaces
> are allowed, this is true for the first
> specification as well. The text of these two are
> closely coupled so including the first
> specification by using 'either' is sufficient.

I think that's a little tricky for the reader. I've instead
added a sentence in the discussion of the first format to
say that there are no spaces.

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
>  man3/tzset.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index 36d2fd7..3f9b246 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -118,7 +118,7 @@ The second format is used when there is daylight saving time:
>  .I std offset dst [offset],start[/time],end[/time]
>  .RE
>  .sp
> -There are no spaces in the specification.
> +There are no spaces in either specification.
>  The initial \fIstd\fP and
>  \fIoffset\fP specify the standard timezone, as described above.
>  The \fIdst\fP string and \fIoffset\fP specify the name and offset for the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
