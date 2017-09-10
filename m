From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: getrandom(2): return type mismatch for getrandom()
Date: Sun, 10 Sep 2017 07:44:23 +0200
Message-ID: <CAKgNAkhU-eC+ns99H0sqHpgOOSbwSMi+Vb=Sw1ufBTYoOrmy7A@mail.gmail.com>
References: <a1b295b6-1e5d-6e5b-20db-fb5f3b09a72c@esse.ch>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a1b295b6-1e5d-6e5b-20db-fb5f3b09a72c-VLnxIkhT3pI@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Scotoni <fabio-VLnxIkhT3pI@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Fabio,

On 9 September 2017 at 13:42, Fabio Scotoni <fabio-VLnxIkhT3pI@public.gmane.org> wrote:
> The getrandom(2) page claims that getrandom() returns int.  It actually
> returns ssize_t according to sysdeps/unix/sysv/linux/getrandom.c in
> glibc and drivers/char/random.c in Linux.

Thanks. Fixed!

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
