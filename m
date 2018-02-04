From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: abort(3) and flushing
Date: Sun, 4 Feb 2018 07:28:25 +0100
Message-ID: <49619cde-e40a-bba1-7f2c-b64468d5fa45@gmail.com>
References: <CAGWcZkL5By_n8Z7Oa9jzLf75id1kK+cbOBbe84kkMsmEAqEd+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGWcZkL5By_n8Z7Oa9jzLf75id1kK+cbOBbe84kkMsmEAqEd+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Egmont Koblinger <egmont-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Egmont,

On 01/28/2018 10:35 PM, Egmont Koblinger wrote:
> Hi,
> 
> I accidentally came across this:
> 
> The abort(3) man page says "[...] all open streams are closed and flushed"
> 
> With glibc-2.27, to be released pretty soon now, file descriptors will
> no longer be flushed. See near the bottom of
> https://sourceware.org/glibc/wiki/Release/2.27 .

Thanks for the note.

I actually caught this a while back, and it got documented with 
man-pages commit 46dc471b8d34fbc83cfde440069dbe2ebec8cd3f
(8 Oct 2017), and that fix has now been released in the latest man-pages 
release.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
