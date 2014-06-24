From: Wang Sheng-Hui <shhuiw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] madvise.2: update the description for MADV_REMOVE
Date: Wed, 25 Jun 2014 07:40:46 +0800
Message-ID: <53AA0C7E.6060803@gmail.com>
References: <53AA0A35.9060100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53AA0A35.9060100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Sorry, miss updating the return error.
Please ignore this patch.

Will send out a new patch later.

Regards,
Sheng-Hui

On 2014=E5=B9=B406=E6=9C=8825=E6=97=A5 07:31, Wang Sheng-Hui wrote:
>=20
> Currently we have more filesystems supporting fallcate, e.g ext4/btrf=
s,
> which can response to MADV_REMOVE gracefully.
>=20
> Update the MADV_REMOVE description.
>=20
> Signed-off-by: Wang Sheng-Hui <shhuiw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man2/madvise.2 | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/man2/madvise.2 b/man2/madvise.2
> index 032ead7..510530c 100644
> --- a/man2/madvise.2
> +++ b/man2/madvise.2
> @@ -99,12 +99,8 @@ or zero-fill-on-demand pages for mappings
>  without an underlying file.
>  .TP
>  .BR MADV_REMOVE " (since Linux 2.6.16)"
> -Free up a given range of pages
> -and its associated backing store.
> -Currently,
> -.\" 2.6.18-rc5
> -only shmfs/tmpfs supports this; other filesystems return with the
> -error
> +Free up a given range of pages and its associated backing store.
> +Filesystems that don't support fallocate will return error
>  .BR ENOSYS .
>  .\" Databases want to use this feature to drop a section of their
>  .\" bufferpool (shared memory segments) - without writing back to
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
