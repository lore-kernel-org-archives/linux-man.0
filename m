From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] bdflush.2, fsync.2, sync.2: rm update(8) reference
Date: Sat, 22 Mar 2014 08:21:57 +0100
Message-ID: <532D3A15.9030804@gmail.com>
References: <1395422752-28712-1-git-send-email-kir@openvz.org> <1395423027-29232-1-git-send-email-kir@openvz.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395423027-29232-1-git-send-email-kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/21/2014 06:30 PM, Kir Kolyshkin wrote:
> Remove reference to update(8) man page, since there is no such
> page. This is an ancient BSD leftover I believe.
> 
> [v2: updated to git tip]

Hello Kir,

Thanks for that. By chance I was puzzling over that very reference 
myself recently, but was unaware of the BSD connection. The 
update(8) reference was present right back in man-pages-1.0 
(1993), and tehre was no update.8 page in the set then. That 
plus a little Googling suggests your hypothesis is correct.

Patch applied.

Cheers,

Michael

> Signed-off-by: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
> ---
>  man2/bdflush.2 | 3 +--
>  man2/fsync.2   | 3 +--
>  man2/sync.2    | 3 +--
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/man2/bdflush.2 b/man2/bdflush.2
> index 796d8f2..b84e5bf 100644
> --- a/man2/bdflush.2
> +++ b/man2/bdflush.2
> @@ -119,5 +119,4 @@ intended to be portable.
>  .SH SEE ALSO
>  .BR fsync (2),
>  .BR sync (2),
> -.BR sync (8),
> -.BR update (8)
> +.BR sync (8)
> diff --git a/man2/fsync.2 b/man2/fsync.2
> index 66278fa..5578e4c 100644
> --- a/man2/fsync.2
> +++ b/man2/fsync.2
> @@ -166,5 +166,4 @@ to guarantee safe operation.
>  .BR sync_file_range (2),
>  .BR hdparm (8),
>  .BR mount (8),
> -.BR sync (8),
> -.BR update (8)
> +.BR sync (8)
> diff --git a/man2/sync.2 b/man2/sync.2
> index 11ba1e4..a597d19 100644
> --- a/man2/sync.2
> +++ b/man2/sync.2
> @@ -120,5 +120,4 @@ large caches.)
>  .BR bdflush (2),
>  .BR fdatasync (2),
>  .BR fsync (2),
> -.BR sync (8),
> -.BR update (8)
> +.BR sync (8)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
