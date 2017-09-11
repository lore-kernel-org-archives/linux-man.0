From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/15] prctl.2, seccomp.2: update pointer to in-kernel
 seccomp documentation
Date: Mon, 11 Sep 2017 15:56:39 +0200
Message-ID: <7f698edf-2fa9-19f3-8879-60c8b5586c8d@gmail.com>
References: <20170911030356.GA29899@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911030356.GA29899-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/11/2017 05:03 AM, Eugene Syromyatnikov wrote:
> Linux commit v4.13-rc1~34^2~40 converted seccomp documentation
> (previously resided in Documentation/prctl/seccomp_filter.txt)
> to ReStructured, along with relocating it to
> Documentation/userspace-api/seccomp_filter.rst.

Applied. Thanks!

Cheers,

Michael


> * man2/prctl.2 (.SH DESCRIPTION) <.TP .BR PR_SET_SECCOMP>: Amend pointer
> to Documentation/prctl/seccomp_filter.txt with change introduced in
> Linux 4.13 (move to Documentation/userspace_api/seccomp_filter.rst).
> * man2/seccomp.2 (.SH SEE ALSO): Likewise.
> 
> Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   man2/prctl.2   | 6 +++++-
>   man2/seccomp.2 | 6 +++++-
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index 95c00ab..a357800 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -969,7 +969,11 @@ calls, then additional filters can be added;
>   they are run in order until the first non-allow result is seen.
>   .IP
>   For further information, see the kernel source file
> -.IR Documentation/prctl/seccomp_filter.txt .
> +.IR Documentation/userspace\-api/seccomp_filter.rst
> +.\" commit c061f33f35be0ccc80f4b8e0aea5dfd2ed7e01a3
> +(or
> +.IR Documentation/prctl/seccomp_filter.txt
> +before Linux 4.13).
>   .TP
>   .BR PR_GET_SECCOMP " (since Linux 2.6.23)"
>   Return (as the function result)
> diff --git a/man2/seccomp.2 b/man2/seccomp.2
> index cf44cd4..7883c54 100644
> --- a/man2/seccomp.2
> +++ b/man2/seccomp.2
> @@ -854,7 +854,11 @@ and
>   The kernel source files
>   .IR Documentation/networking/filter.txt
>   and
> -.IR Documentation/prctl/seccomp_filter.txt .
> +.IR Documentation/userspace\-api/seccomp_filter.rst
> +.\" commit c061f33f35be0ccc80f4b8e0aea5dfd2ed7e01a3
> +(or
> +.IR Documentation/prctl/seccomp_filter.txt
> +before Linux 4.13).
>   .PP
>   McCanne, S. and Jacobson, V. (1992)
>   .IR "The BSD Packet Filter: A New Architecture for User-level Packet Capture" ,
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
