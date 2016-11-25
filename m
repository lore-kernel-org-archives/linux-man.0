From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH draft_keys 5/7] keyrings.7: tfix
Date: Fri, 25 Nov 2016 09:42:01 +0100
Message-ID: <1ee3fff8-43a0-578b-b7b2-4c44a5c2df72@gmail.com>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
 <20161125010119.GA662@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125010119.GA662@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Eugene,

On 11/25/2016 02:01 AM, Eugene Syromyatnikov wrote:
> ---
>  man7/keyrings.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Not applied! The indentation choice here was deliberate,
to prevent the rendered text going over 80 columns.

Cheers,

Michael


> 
> diff --git a/man7/keyrings.7 b/man7/keyrings.7
> index 2f452c6..2da882c 100644
> --- a/man7/keyrings.7
> +++ b/man7/keyrings.7
> @@ -489,7 +489,7 @@ and may filter out further keys that the process is not authorized to view.
>  An example of the data that one might see in this file is the following:
>  
>  .nf
> -.in 0n
> +.in +4n
>  009a2028 I--Q---   1 perm 3f010000  1000  1000 user     krb_ccache:primary: 12
>  1806c4ba I--Q---   1 perm 3f010000  1000  1000 keyring  _pid: 2
>  25d3a08f I--Q---   1 perm 1f3f0000  1000 65534 keyring  _uid_ses.1000: 1
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
