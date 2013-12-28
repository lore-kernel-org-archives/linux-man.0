From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] timerfd_create: add timerfd(2) alias
Date: Sun, 29 Dec 2013 00:35:12 +1300
Message-ID: <52BEB770.80802@gmail.com>
References: <1387586263-9002-1-git-send-email-shawn@churchofgit.com> <1387586263-9002-3-git-send-email-shawn@churchofgit.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387586263-9002-3-git-send-email-shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Shawn,

What is the rationale for this patch?

Cheers,

Michael


On 12/21/13 13:37, Shawn Landden wrote:
> Signed-off-by: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
> ---
>  man2/timerfd.2 | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 man2/timerfd.2
> 
> diff --git a/man2/timerfd.2 b/man2/timerfd.2
> new file mode 100644
> index 0000000..de0bf03
> --- /dev/null
> +++ b/man2/timerfd.2
> @@ -0,0 +1,2 @@
> +.so man2/timerfd_create.2
> +
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
