From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] prctl.2: Note PR_SET_MM opts appeared in Linux 3.5
Date: Sat, 22 Feb 2014 10:06:29 +0100
Message-ID: <53086895.30503@gmail.com>
References: <1392252556-23254-1-git-send-email-kir@openvz.org> <1392252556-23254-2-git-send-email-kir@openvz.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392252556-23254-2-git-send-email-kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, criu-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied!

On 02/13/2014 01:49 AM, Kir Kolyshkin wrote:
> Signed-off-by: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
> ---
>  man2/prctl.2 | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index db8174a..55aef52 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -711,6 +711,8 @@ value.
>  The requirements for the address are the same as for the
>  .BR PR_SET_MM_START_BRK
>  option.
> +.P
> +The following options are available since Linux 3.5.
>  .TP
>  .BR PR_SET_MM_ARG_START
>  Set the address above which the program command line is placed.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
