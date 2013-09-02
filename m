From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Add EINVAL to errors list of open(2)
Date: Mon, 02 Sep 2013 07:50:20 +0200
Message-ID: <5224271C.5030709@gmail.com>
References: <1376686667-6686-1-git-send-email-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376686667-6686-1-git-send-email-cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/16/13 22:57, Doug Goldstein wrote:
> EINVAL can be returned by open(2) when the underlying filesystem doesn't
> support O_DIRECT. It is documented in the NOTES section but this patch
> adds it to the list of possible errors.

Applied. Thanks.

Cheers,

Michael


> ---
>  man2/open.2 | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/man2/open.2 b/man2/open.2
> index 9ebc0a0..93a9e7d 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -611,6 +611,13 @@ While blocked waiting to complete an open of a slow device
>  the call was interrupted by a signal handler; see
>  .BR signal (7).
>  .TP
> +.B EINVAL
> +The filesystem does not support the
> +.BR O_DIRECT
> +flag. See
> +.BR NOTES
> +for more information.
> +.TP
>  .B EISDIR
>  .I pathname
>  refers to a directory and the access requested involved writing
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
