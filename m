From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: minor typo in clone(2) CLONE_FILES
Date: Sat, 8 Oct 2016 20:19:42 +0200
Message-ID: <8196e2b2-eed3-4a3b-ad4a-e897dc652bf6@gmail.com>
References: <CAJgzZoo5qaviD6Po6iqn1V4zmhd4uJigApE7GyLoriXs2O3QTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJgzZoo5qaviD6Po6iqn1V4zmhd4uJigApE7GyLoriXs2O3QTg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: enh <enh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/08/2016 06:08 PM, enh wrote:
> sorry for not noticing this before...
> 
>               calling process, and thus share file offsets and files status
>               flags (see open(2)).
> 
> should be
> 
>               calling process, and thus share file offsets and file status
>               flags (see open(2)).
> 
> (s/files status/file status/)

Thanks, Elliot. Fixed now.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
