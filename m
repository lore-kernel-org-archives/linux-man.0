From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/15] prctl.2: update pointer to in-kernel no_new_privs
 flag documentation
Date: Mon, 11 Sep 2017 15:56:25 +0200
Message-ID: <8f1e0481-794d-10c0-7fc7-3273e3108baa@gmail.com>
References: <20170911030354.GA29844@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911030354.GA29844-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



On 09/11/2017 05:03 AM, Eugene Syromyatnikov wrote:
> Linux commit v4.13-rc1~34^2~39 converted no_new_privs flag documentation
> (previously resided in Documentation/prctl/no_new_privs.txt)
> to ReStructured, along with relocating it to
> Documentation/userspace-api/no_new_privs.rst.

Applied. Thanks!

Cheers,

Michael


> * man2/prctl.2 (.SH DESCRIPTION) <.TP .BR PR_SET_NO_NEW_PRIVS>: Amend
> pointer to Documentation/prctl/no_new_privs.txt with change introduced
> in Linux 4.13 (move to Documentation/userspace-api/no_new_privs.rst).
> 
> Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   man2/prctl.2 | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index 046dbcb..95c00ab 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -818,7 +818,11 @@ field in the
>   file.
>   .IP
>   For more information, see the kernel source file
> -.IR Documentation/prctl/no_new_privs.txt .
> +.IR Documentation/userspace\-api/no_new_privs.rst
> +.\" commit 40fde647ccb0ae8c11d256d271e24d385eed595b
> +(or
> +.IR Documentation/prctl/no_new_privs.txt
> +before Linux 4.13).
>   See also
>   .BR seccomp (2).
>   .TP
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
