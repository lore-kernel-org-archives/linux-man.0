From: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Revised add_key(2) man page for review
Date: Tue, 13 Dec 2016 10:58:08 +0000
Message-ID: <24646.1481626688@warthog.procyon.org.uk>
References: <9a5cc2a7-a505-9d0d-5b78-4bc5ab100ff1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9a5cc2a7-a505-9d0d-5b78-4bc5ab100ff1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>        The destination keyring serial number may be that  of  a  valid
>        keyring for which the caller has write permission, or it may be
>        one of the following special keyring IDs:

No comma before "or".

>        "user" This is a general purpose key type whose payload may  be
> ...
>       "keyring"

It probably makes sense to put keyring either first or last.

>        "keyring"
>               Keyrings are special key types that may contain links to
>               sequences  of other keys of any type.  If this interface
>               is used to create a keyring, then a NULL payload  should
>               be specified, and plen should be zero.

I think "then payload should be NULL and plen should be zero." sounds better.

>        "logon" (since Linux 3.3)
>               This  key type is essentially the same as "user", but it
>               does not provide reading.

"permit the key to be read" rather than "provide reading", I think.

>        "big_key" (since Linux 3.13)
>               This  key type is similar to "user", but may hold a pay‐
>               load of up to 1 MiB.  If the key payload is large,  then
>               it  may  be stored in swap space rather than kernel mem‐
>               ory.

"stored encrypted in swap space".

>            printf("Key ID is %lx\n", (long) key);

key_serial_t is an int.  It doesn't really need casting to long.

David
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
