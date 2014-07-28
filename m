From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getgrouplist.3: ATTRIBUTES: Note function that is thread
 safe with exceptions
Date: Mon, 28 Jul 2014 13:52:30 +0200
Message-ID: <CAKgNAkgL3XP=jB5J9eg1bck=MgrZA+0CJzVCQqbob+ewo9UwNw@mail.gmail.com>
References: <1406001158-28463-1-git-send-email-penght@cn.fujitsu.com> <CAE2sS1hVFTM+1e7A=18+WSjtkLoOakbJ=PYLh-rnMBwdLQwGPw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAE2sS1hVFTM+1e7A=18+WSjtkLoOakbJ=PYLh-rnMBwdLQwGPw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Jul 22, 2014 at 1:42 PM, Carlos O'Donell
<carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org> wrote:
> On Mon, Jul 21, 2014 at 11:52 PM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
>> The function getgrouplist() is thread safe with exceptions.
>> +T}     Thread safety   MT-Safe locale
>
> Excellent continued use of the new safety attributes.
>
> Peng, I'm very happy to see such good work go into the linux kernel man pages.

Seconded. Thanks, Haitaio, for all your work in reformatting the
existing pages to the new ATTRIBUTES layout. ( continue working from
the front of the alphabet, and we will eventually meet in the middle.
But my time for this work is very limited right now, sorry.)

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
