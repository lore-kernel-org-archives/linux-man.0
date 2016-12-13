From: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Revised keyrings(7) man page for review
Date: Tue, 13 Dec 2016 13:38:16 +0000
Message-ID: <26913.1481636296@warthog.procyon.org.uk>
References: <CAKgNAkh9JLN4P+Fu+yRCNo96E3VwjYLRquuaf43XRWeuC7gnNw@mail.gmail.com> <51643019-bb42-4066-c824-c55b9e668ac6@man7.org> <25262.1481628931@warthog.procyon.org.uk> <9f32a79b-5795-bff4-b741-bf927a525149@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkh9JLN4P+Fu+yRCNo96E3VwjYLRquuaf43XRWeuC7gnNw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Michael Kerrisk <mtk-ASgREoAs3yw@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> So, I've updated this piece a couple of times since the draft that you
> reviewed, and by now it reads:
> 
>        "big_key" (since Linux 3.13)
>               This key type is similar to the "user" key type, but it may
>               hold  a  payload  of up to 1 MiB in size.  This key type is
>               useful for tasks such as holding Kerberos ticket caches.

I'm not sure that "tasks" is quite the word I'd use here (it's overloaded).
Perhaps "purposes"?

>               The payload data may be stored in  the  swap  space  rather
>               than in kernel memory if the data size exceeds the overhead
>               of storing the data encrypted in swap space.  (A tmpfs file
>               is  used,  which requires filesystem structures to be allo‐
>               cated in the kernel; The size of  these  structures  deter‐
>               mines  the  size  threshold  above  which the tmpfs storage
>               method  is  used.)   Since  Linux  4.8,  payload  data   is
>               encrypted,  to  prevent  it  being written unencrypted into
>               swap space.

I would either drop the first "encrypted" ("storing the data encrypted") since
you mention this later or move it earlier to be after the word "stored" ("may
be stored encrypted").

Note that with the "Since Linux 4.8 ..." sentence, the encryption is only
applied if it is stored into tmpfs.

Also, the payload isn't directly stored into swapspace, but is rather stored
into tmpfs, from where it can be swapped.  This is important since you can use
this type of key without any swapspace available to your system.

David
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
