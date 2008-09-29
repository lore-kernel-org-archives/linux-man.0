From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] semop.2: fix typo in example
Date: Mon, 29 Sep 2008 09:42:09 +0200
Message-ID: <cfd18e0f0809290042l3f8c9ec5v2dff7dcbe156039a@mail.gmail.com>
References: <1222623702-7803-1-git-send-email-kirill@shutemov.name>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1222623702-7803-1-git-send-email-kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Kirill A. Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Kirril,

On Sun, Sep 28, 2008 at 7:41 PM, Kirill A. Shutemov
<kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org> wrote:
> Signed-off-by: Kirill A. Shutemov <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
> ---
>  man2/semop.2 |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man2/semop.2 b/man2/semop.2
> index f5f54a9..b934018 100644
> --- a/man2/semop.2
> +++ b/man2/semop.2
> @@ -505,7 +505,7 @@ and then increment the semaphore value by one.
>     sops[1].sem_op = 1;         /* Increment value by one */
>     sops[1].sem_flg = 0;
>
> -    if (semop(semid, &sop, 2) == \-1) {
> +    if (semop(semid, sops, 2) == \-1) {
>         perror("semop");
>         exit(EXIT_FAILURE);
>     }
> --

Thanks.  Applied for 3.11.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
