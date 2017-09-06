From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] request_key.2: wfix: /etc/request-keys.conf ->
 /etc/request-key.conf
Date: Wed, 6 Sep 2017 09:37:14 +0200
Message-ID: <f15ed895-d06f-fcb2-17b0-422680018f9c@gmail.com>
References: <1504668568-17246-1-git-send-email-lizhijian@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504668568-17246-1-git-send-email-lizhijian-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Zhijian <lizhijian-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/06/2017 05:29 AM, Li Zhijian wrote:
> Signed-off-by: Li Zhijian <lizhijian-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Thank you, Li Zhijian. Patch applied.

Cheers,

Michael

> ---
>  man2/request_key.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/request_key.2 b/man2/request_key.2
> index ce987e3..1f998ef 100644
> --- a/man2/request_key.2
> +++ b/man2/request_key.2
> @@ -464,7 +464,7 @@ we first create a suitable entry in the file
>  .EX
>  $ sudo sh
>  # \fBecho 'create user mtk:* *   /bin/keyctl instantiate %k %c %S' \\\fP
> -          \fB> /etc/request-keys.conf\fP
> +          \fB> /etc/request-key.conf\fP
>  # \fBexit\fP
>  .EE
>  .in
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
