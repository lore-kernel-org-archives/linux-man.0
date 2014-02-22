From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] prctl.2: fix wording in PR_SET_MM_EXE_FILE description
Date: Sat, 22 Feb 2014 10:06:39 +0100
Message-ID: <5308689F.4050901@gmail.com>
References: <1392252556-23254-1-git-send-email-kir@openvz.org> <1392252556-23254-3-git-send-email-kir@openvz.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392252556-23254-3-git-send-email-kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, criu-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied!

On 02/13/2014 01:49 AM, Kir Kolyshkin wrote:
> Signed-off-by: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
> ---
>  man2/prctl.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index 55aef52..a2d06d1 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -769,8 +769,8 @@ section).
>  The second limitation is that such transitions can be done only once
>  in a process life time.
>  Any further attempts will be rejected.
> -This should help system administrators to monitor unusual
> -symbolic-link transitions over all process running in a system.
> +This should help system administrators monitor unusual
> +symbolic-link transitions over all processes running on a system.
>  .RE
>  .\"
>  .SH RETURN VALUE
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
