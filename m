From: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Revised request_key(2) man page for review
Date: Mon, 19 Dec 2016 08:13:43 +0000
Message-ID: <15453.1482135223@warthog.procyon.org.uk>
References: <00a561ef-34c2-40e0-335d-66d34518ba8d@gmail.com> <CAKgNAkiOzLwoLN-Kaa3-jHUJuYxp-YcL-5FbCe-pOkxGq_u5-g@mail.gmail.com> <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com> <23323.1481796656@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <00a561ef-34c2-40e0-335d-66d34518ba8d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-ID: <15452.1482135223.1-S6HVgzuS8uM4Awkfq6JHfwNdhmdF6hFW@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> >>>            # echo 'create user mtk:* *   /bin/keyctl instantiate %k %c %S' \
> >>>                      > /etc/request-keys.conf
> > 
> > There's a /etc/request-keys.d/ directory now.
> 
> Yes, I'm aware. Did you mean I should fix something on this page?

I mean you probably shouldn't modify /etc/request-keys.conf, but rather put
something in the .d dir.

David
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
