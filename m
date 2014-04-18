From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fallocate.2: Document FALLOC_FL_ZERO_RANGE
Date: Fri, 18 Apr 2014 17:49:48 +0200
Message-ID: <5351499C.2080506@gmail.com>
References: <1397741451-19161-1-git-send-email-lczerner@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397741451-19161-1-git-send-email-lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Lukas,

Thanks for the patch.

Two general comments:
* The text does not explain what zeroing file space is about and why one 
  would do it. For example, I'm a little unclear after reading it whether
  FALLOC_FL_ZERO_RANGE will create a hole in a file.
* Some entries should probably be added to ERRORS.

Could you fix both of those and resubmit?

Note that I've just pushed some changes to the page for 
FALLOC_FL_COLLAPSE_RANGE, so you may want to pull the latest version to
ensure there are no conflicts.

Cheers,

Michael


On 04/17/2014 03:30 PM, Lukas Czerner wrote:
> FALLOC_FL_ZERO_RANGE was added in Linux 3.14,
> for zeroing ranges in the allocated space in a file.
> 
> Signed-off-by: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/fallocate.2 | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/man2/fallocate.2 b/man2/fallocate.2
> index b31bbde..df31782 100644
> --- a/man2/fallocate.2
> +++ b/man2/fallocate.2
> @@ -124,6 +124,45 @@ Btrfs (since Linux 3.7)
>  .IP *
>  tmpfs (since Linux 3.5)
>  .\" commit 83e4fa9c16e4af7122e31be3eca5d57881d236fe
> +.SS Zeroing file space
> +Specifying
> +.BR FALLOC_FL_ZERO_RANGE
> +flag (available since Linux 3.14) in
> +.I mode
> +zeroes space in the byte range starting at
> +.I offset
> +and continuing for
> +.I len
> +bytes.
> +Within the specified range, blocks are preallocated for the regions
> +that span the holes in the file. After a successful call,
> +subsequent reads from this range will return zeroes.
> +
> +Zeroing is done within the file system preferably by converting range into
> +unwritten extents which requires very little IO to be issued.
> +
> +If the
> +.B FALLOC_FL_KEEP_SIZE
> +flag is specified in
> +.IR mode ,
> +the behavior of the call is similar,
> +but the file size will not be changed even if
> +.IR offset + len
> +is greater than the file size. This behaviour is the same as when
> +preallocating space with
> +.B FALLOC_FL_KEEP_SIZE
> +specified.
> +
> +Not all filesystems support
> +.BR FALLOC_FL_ZERO_RANGE ;
> +if a filesystem doesn't support the operation, an error is returned.
> +The operation is supported on at least the following filesystems
> +.IP * 3
> +XFS (since Linux 2.14)
> +.\" commit 376ba313147b4172f3e8cf620b9fb591f3e8cdfa
> +.IP *
> +ext4 (since Linux 3.14)
> +.\" commit b8a8684502a0fc852afa0056c6bb2a9273f6fcc0
>  .SH RETURN VALUE
>  On success,
>  .BR fallocate ()
> @@ -193,6 +232,8 @@ Or:
>  .I mode
>  specifies
>  .BR FALLOC_FL_PUNCH_HOLE
> +or
> +.BR FALLOC_FL_ZERO_RANGE
>  and
>  the file referred to by
>  .I fd
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
