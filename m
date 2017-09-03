From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Minor formatting fix in keyrings.7
Date: Sun, 3 Sep 2017 02:26:32 +0200
Message-ID: <dd91705c-54b0-19fc-a675-fde0ef4548f7@gmail.com>
References: <20170902013031.GA17201@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170902013031.GA17201-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Eugene,

On 09/02/2017 03:35 AM, Eugene Syromyatnikov wrote:
> Hello.
> 
> I'm not quite sure that providing absolute indentation there was
> intentional, but I assume it didn't, as the output doesn't exceed 80
> character width and the resulting rendering does look a bit ugly.

Actually, the formatting was deliberate, Since, if indented to usual
norms, the text would be considerably wider than 80 characters. I 
haven't applied the patch.

Cheers,

Michael

> Eugene Syromyatnikov (1):
>   ffix: keyrings.7: indentation for key list example
> 
>  man7/keyrings.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
