From: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Revised request_key(2) man page for review
Date: Thu, 15 Dec 2016 10:10:56 +0000
Message-ID: <23323.1481796656@warthog.procyon.org.uk>
References: <CAKgNAkiOzLwoLN-Kaa3-jHUJuYxp-YcL-5FbCe-pOkxGq_u5-g@mail.gmail.com> <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiOzLwoLN-Kaa3-jHUJuYxp-YcL-5FbCe-pOkxGq_u5-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> >        │Is 'keyring' allowed to be 0? Reading the source, it │
> >        │appears so.  In this case, by default,  the  key  is │
> >        │assigned   to   the   session   keyring.   But,  the │
> >        │KEYCTL_SET_REQKEY_KEYRING  also  seems  to  have  an │
> >        │influence here.  What are the details here?          │

Yes, the destination keyring can be 0.  If you don't specify a destination
keyring, then:

 (1) If the key is found to already exist, the serial number is returned, but
     no extra link is made.

 (2) If an error occurs other than "this key doesn't exist", then you'll just
     get the error.

 (3) If we have to construct a new key, this will be attached to the default
     keyring (as there's no destination keyring to attach to).

> >            # echo 'create user mtk:* *   /bin/keyctl instantiate %k %c %S' \
> >                      > /etc/request-keys.conf

There's a /etc/request-keys.d/ directory now.

David
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
