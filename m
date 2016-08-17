From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cpuset.7: tfix
Date: Wed, 17 Aug 2016 17:07:50 +1200
Message-ID: <425be326-b4a6-d8c9-330f-4a2a5d7edcbf@gmail.com>
References: <1471402525-21666-1-git-send-email-novalis@novalis.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471402525-21666-1-git-send-email-novalis-qEvXGNtQsBNAfugRpC6u6w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Turner <novalis-qEvXGNtQsBNAfugRpC6u6w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/17/2016 02:55 PM, David Turner wrote:
> ---
>  man7/cpuset.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, David. Applied.

Cheers,

Michael


> diff --git a/man7/cpuset.7 b/man7/cpuset.7
> index c5cbf1d..6669816 100644
> --- a/man7/cpuset.7
> +++ b/man7/cpuset.7
> @@ -48,7 +48,7 @@ on that system.
>  By default, if the cpuset configuration
>  on a system is not modified or if the cpuset filesystem
>  is not even mounted, then the cpuset mechanism,
> -though present, has no affect on the system's behavior.
> +though present, has no effect on the system's behavior.
>  .PP
>  A cpuset defines a list of CPUs and memory nodes.
>  .PP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
