From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/15] prctl.2, ptrace.2: update pointer to in-kernel Yama
 documentation
Date: Mon, 11 Sep 2017 15:56:14 +0200
Message-ID: <e1564bcc-1aa5-0274-b66f-d97e01b5a545@gmail.com>
References: <20170911030352.GA29790@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911030352.GA29790-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/11/2017 05:03 AM, Eugene Syromyatnikov wrote:
> Linux commit v4.13-rc1~34^2~30 converted yama documentation (previously
> resided in Documentation/security/Yama.txt) to ReStructured, along with
> relocating it to Documentation/amdin-guide/LSM/Yama.rst.


Applied. Thanks!

Cheers,

Michael



> * man2/prctl.2 (.SH DESCRIPTION) <.TP .BR PR_SET_PTRACER>: Amend pointer
> to Documentation/security/Yama.txt with change introduced in Linux
> 4.13 (Documentation/admin-guide/LSM/Yama.rst).
> * man2/ptrace.2 (.SS /proc/sys/kernel/yama/ptrace_scope): Likewise.
> 
> Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   man2/prctl.2  | 6 +++++-
>   man2/ptrace.2 | 4 ++++
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index 88c67a3..046dbcb 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -889,7 +889,11 @@ the ptrace restrictions introduced by Yama are effectively disabled for the
>   calling process.
>   .IP
>   For further information, see the kernel source file
> -.IR Documentation/security/Yama.txt .
> +.IR Documentation/admin\-guide/LSM/Yama.rst
> +.\" commit 90bb766440f2147486a2acc3e793d7b8348b0c22
> +(or
> +.IR Documentation/security/Yama.txt
> +before Linux 4.13).
>   .TP
>   .BR PR_SET_SECCOMP " (since Linux 2.6.23)"
>   .\" See http://thread.gmane.org/gmane.linux.kernel/542632
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index dc84d41..cdf503a 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -2595,7 +2595,11 @@ operation to declare an additional PID that is allowed to perform
>   .BR PTRACE_MODE_ATTACH
>   operations on the target.
>   See the kernel source file
> +.IR Documentation/admin\-guide/LSM/Yama.rst
> +.\" commit 90bb766440f2147486a2acc3e793d7b8348b0c22
> +(or
>   .IR Documentation/security/Yama.txt
> +before Linux 4.13)
>   for further details.
>   .IP
>   The use of
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
