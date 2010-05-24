From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] statfs.2: Add definition EXT4_SUPER_MAGIC = 0xEF53
Date: Mon, 24 May 2010 18:10:47 +0200
Message-ID: <AANLkTilMNmSJseqMF2FzMIvzx34L6VlUJfL4rkHZbQUO@mail.gmail.com>
References: <1273634566-4159-1-git-send-email-antonf@turbolinux.com.cn>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1273634566-4159-1-git-send-email-antonf-Qbad7dcHD6Y0jvc7zYWOs/8+0UxHXcjY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fang Wenqi <anton.fang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nicolas.francois-Fa7rcPG4DJn7nK0/Xc0eeg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, antonf-Qbad7dcHD6Y0jvc7zYWOs/8+0UxHXcjY@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, May 12, 2010 at 5:22 AM, Fang Wenqi <anton.fang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> Signed-off-by: Fang Wenqi <antonf-Qbad7dcHD6Y0jvc7zYWOs/8+0UxHXcjY@public.gmane.org>

Thanks. Applied for man-pages-3.25.

Cheers,

Michael


> ---
> =A0man2/statfs.2 | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/man2/statfs.2 b/man2/statfs.2
> index 73ec57f..36852af 100644
> --- a/man2/statfs.2
> +++ b/man2/statfs.2
> @@ -73,6 +73,7 @@ File system types:
> =A0 =A0EXT2_OLD_SUPER_MAGIC =A00xEF51
> =A0 =A0EXT2_SUPER_MAGIC =A0 =A0 =A00xEF53
> =A0 =A0EXT3_SUPER_MAGIC =A0 =A0 =A00xEF53
> + =A0 EXT4_SUPER_MAGIC =A0 =A0 =A00xEF53
> =A0 =A0HFS_SUPER_MAGIC =A0 =A0 =A0 0x4244
> =A0 =A0HPFS_SUPER_MAGIC =A0 =A0 =A00xF995E849
> =A0 =A0HUGETLBFS_MAGIC =A0 =A0 =A0 0x958458f6
> --
> 1.6.6.1
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
