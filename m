From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Request review of CHOWN man page synopsis
Date: Mon, 27 Jan 2014 07:34:22 +0100
Message-ID: <CAKgNAkh4pok5XXVbZ4w59OwSUHS2DspqqZi+L8gfo-a5jek4-w@mail.gmail.com>
References: <CABiEpeqJFEV6JEEMijViiW22NQtT=+V-wQ6hVVyxUG=D=3tpDw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABiEpeqJFEV6JEEMijViiW22NQtT=+V-wQ6hVVyxUG=D=3tpDw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anubhav Chaturvedi <mailforanubhav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Jan 25, 2014 at 2:33 PM, Anubhav Chaturvedi
<mailforanubhav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Hi
>
> I was going through the man page ( on my Ubuntu 12.04 ) and noticed that in the synopsis, owner has been marked as optional ( i.e, it is enclosed in  [ ] ).
>
> chown [OPTION]... [OWNER][:[GROUP]] FILE...
>
> On browsing the man pages on web i noticed this was only the case with UNIX man page. Man pages at freeBSD and oracle showed the command usage as expected.
>
> I believe the correct usage would be
>
> chown [OPTION]... OWNER[:GROUP] FILE...
>
> Please do the corrections necessary and inform me if i am making a mistake in interpreting this.

Anubhav,

This page is not part of the man-pages project. See
http://man7.org/linux/man-pages/man1/chown.1.html#COLOPHON

But, I doubt that your report is correct. Read the text of the man page.

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
