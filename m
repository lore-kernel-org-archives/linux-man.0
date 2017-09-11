From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 15/15] unicode.7: update pointer to in-kernel Unicode
 terminal support documentation
Date: Mon, 11 Sep 2017 16:00:22 +0200
Message-ID: <e3ffc91a-fbc7-c35f-7fe9-354cc58f2134@gmail.com>
References: <20170911030420.GA30328@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911030420.GA30328-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/11/2017 05:04 AM, Eugene Syromyatnikov wrote:
> The location has been changed in Linux commit v4.10-rc1~40^2~86^2~4.


Applied. Thanks!

Cheers,

Michael



> * man7/unicode.7 (.SS Private Use Areas (PUA)): Amend pointer to
> Documentation/unicode.txt with change introduced in Linux 4.10
> (move to Documentation/admin-guide/unicode.rst).
> 
> Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   man7/unicode.7 | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/man7/unicode.7 b/man7/unicode.7
> index 934f8ae..a5741ae 100644
> --- a/man7/unicode.7
> +++ b/man7/unicode.7
> @@ -203,8 +203,12 @@ coordinated among all Linux users.
>   The registry of the characters
>   assigned to the Linux zone is maintained by LANANA and the registry
>   itself is
> +.I Documentation/admin\-guide/unicode.rst
> +in the Linux kernel sources
> +.\" commit 9d85025b0418163fae079c9ba8f8445212de8568
> +(or
>   .I Documentation/unicode.txt
> -in the Linux kernel sources.
> +before Linux 4.10).
>   .PP
>   Two other planes are reserved for private usage, plane 15
>   (Supplementary Private Use Area-A, range 0xf0000 to 0xffffd)
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
