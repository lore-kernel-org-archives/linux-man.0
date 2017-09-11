From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/15] unshare.2: update pointer to in-kernel unshare
 documentation
Date: Mon, 11 Sep 2017 15:56:56 +0200
Message-ID: <ae0b5672-2951-f289-43fc-ff720f983944@gmail.com>
References: <20170911030358.GA29935@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911030358.GA29935-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/11/2017 05:03 AM, Eugene Syromyatnikov wrote:
> Linux commit v4.12-rc1~137^2~33^2 converted unshare documentation
> (previously resided in Documentation/unshare.txt) to ReStructured
> format, along with relocating it to
> Documentation/userspace-api/unshare.rst.

Applied. Thanks!

Cheers,

Michael


> * man2/unshare.2 (.SH SEE ALSO): Amend pointer to
> Documentation/unshare.txt with change introduced in Linux 4.14 (move to
> Documentation/userspace_api/unshare.rst).
> 
> Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   man2/unshare.2 | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/unshare.2 b/man2/unshare.2
> index 8bf6487..9f0afab 100644
> --- a/man2/unshare.2
> +++ b/man2/unshare.2
> @@ -489,5 +489,9 @@ main(int argc, char *argv[])
>   .BR vfork (2),
>   .BR namespaces (7)
>   .PP
> -.I Documentation/unshare.txt
> +.I Documentation/userspace-api/unshare.rst
>   in the Linux kernel source tree
> +.\" commit f504d47be5e8fa7ecf2bf660b18b42e6960c0eb2
> +(or
> +.I Documentation/unshare.txt
> +before Linux 4.12)
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
