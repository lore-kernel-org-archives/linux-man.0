From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Revised request_key(2) man page for review
Date: Sat, 17 Dec 2016 11:34:55 +0100
Message-ID: <00a561ef-34c2-40e0-335d-66d34518ba8d@gmail.com>
References: <CAKgNAkiOzLwoLN-Kaa3-jHUJuYxp-YcL-5FbCe-pOkxGq_u5-g@mail.gmail.com>
 <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
 <23323.1481796656@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <23323.1481796656-S6HVgzuS8uM4Awkfq6JHfwNdhmdF6hFW@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello David,

On 12/15/2016 11:10 AM, David Howells wrote:
> Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>>>        │Is 'keyring' allowed to be 0? Reading the source, it │
>>>        │appears so.  In this case, by default,  the  key  is │
>>>        │assigned   to   the   session   keyring.   But,  the │
>>>        │KEYCTL_SET_REQKEY_KEYRING  also  seems  to  have  an │
>>>        │influence here.  What are the details here?          │
> 
> Yes, the destination keyring can be 0.  If you don't specify a destination
> keyring, then:
> 
>  (1) If the key is found to already exist, the serial number is returned, but
>      no extra link is made.
> 
>  (2) If an error occurs other than "this key doesn't exist", then you'll just
>      get the error.
> 
>  (3) If we have to construct a new key, this will be attached to the default
>      keyring (as there's no destination keyring to attach to).

Okay. Please take a look at the revised text that I'll send out
after applying Eugene's patch. (Mail in a few minutes.)

>>>            # echo 'create user mtk:* *   /bin/keyctl instantiate %k %c %S' \
>>>                      > /etc/request-keys.conf
> 
> There's a /etc/request-keys.d/ directory now.

Yes, I'm aware. Did you mean I should fix something on this page?

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
