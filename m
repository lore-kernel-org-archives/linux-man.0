From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Man pages 3.70, system(3)
Date: Sun, 27 Jul 2014 13:57:32 +0200
Message-ID: <53D4E92C.9070706@gmail.com>
References: <CAO2t6LvtdSzwWymYYBBsQEN9C5WhMSQyp6PO0y05koDQBb-t7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAO2t6LvtdSzwWymYYBBsQEN9C5WhMSQyp6PO0y05koDQBb-t7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Damir Nedzibovic <d.nedzibovic-pC13c+iqQS5Wk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/25/2014 02:50 PM, Damir Nedzibovic wrote:
> Hello,
> 
> in the "DESCRIPTION" paragraph, it says:
> 
> execl("/bin/sh", "sh". "-c", command, (char *) 0);
> 
> I find the second parameter a bit funny ("sh". "-c") - shouldn't that read just "-c"?

Hello Damir,

Thanks for the report. That "," should be a ".". I've applied a fix.

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
