From: Fabio Scotoni <fabio-VLnxIkhT3pI@public.gmane.org>
Subject: Re: getrandom(2): return type mismatch for getrandom()
Date: Fri, 15 Sep 2017 16:00:39 +0200
Message-ID: <38409769-c82a-594d-a58e-401e86891c67@esse.ch>
References: <a1b295b6-1e5d-6e5b-20db-fb5f3b09a72c@esse.ch>
 <CAKgNAkhU-eC+ns99H0sqHpgOOSbwSMi+Vb=Sw1ufBTYoOrmy7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhU-eC+ns99H0sqHpgOOSbwSMi+Vb=Sw1ufBTYoOrmy7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: de-CH
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Dear Michael,

I'm sorry for the late response, I didn't notice when the commit made it
in.  It seems like your fix just introduced another, though more minor
issue unless I misunderstand something.

The man page now says the return type is "ssize" instead of "ssize_t".
Is that really what you meant to write?

I apologize for any confusion I may have caused.

Sincerely,

Fabio

On 09/10/2017 07:44 AM, Michael Kerrisk (man-pages) wrote:
> Hello Fabio,
> 
> On 9 September 2017 at 13:42, Fabio Scotoni <fabio-VLnxIkhT3pI@public.gmane.org> wrote:
>> The getrandom(2) page claims that getrandom() returns int.  It actually
>> returns ssize_t according to sysdeps/unix/sysv/linux/getrandom.c in
>> glibc and drivers/char/random.c in Linux.
> 
> Thanks. Fixed!
> 
> Cheers,
> 
> Michael
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
