From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ioctl_iflags.2: tfix
Date: Thu, 26 Jan 2017 07:23:23 +1300
Message-ID: <f1240aef-9a09-067a-93d0-89cfbe3e9864@gmail.com>
References: <20170125153733.3588-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170125153733.3588-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/26/2017 04:37 AM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---

Applied! Thanks, Jakub.

Cheers,

Michael


>  man2/ioctl_iflags.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/ioctl_iflags.2 b/man2/ioctl_iflags.2
> index 5fa53d517..d54931be8 100644
> --- a/man2/ioctl_iflags.2
> +++ b/man2/ioctl_iflags.2
> @@ -146,7 +146,7 @@ into the same disk block as the file metadata.
>  .BR FS_PROJINHERIT_FL " \(aqP\(aq (since Linux 4.5)"
>  .\" commit 040cb3786d9b25293b8b0b05b90da0f871e1eb9b
>  .\" Flag name was added in Linux 4.4
> -.\" FIXME Not cuurentl supported because not in FS_FL_USER_MODIFIABLE?
> +.\" FIXME Not currently supported because not in FS_FL_USER_MODIFIABLE?
>  Inherit the quota project ID.
>  Files and subdirectories will inherit the project ID of the directory.
>  This flag can be applied only to directories.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
