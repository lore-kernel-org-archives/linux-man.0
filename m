From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typo in rtld-audit
Date: Sat, 7 Jul 2012 07:49:10 +0200
Message-ID: <CAKgNAkiK+VEYEkKQUhO9=W7y_EM4oJ0qHsCxSy8ofFgVztYnng@mail.gmail.com>
References: <CAOPLpQeK4VQKqDiURG8UkhF=1dEbmOGyXezMB0c=dPSomeDegw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOPLpQeK4VQKqDiURG8UkhF=1dEbmOGyXezMB0c=dPSomeDegw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulrich Drepper <drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ulrich,

On Thu, Jun 21, 2012 at 5:36 PM, Ulrich Drepper <drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The description for la_symbind* says:
>
> If the auditing library is simply monitoring symbol bindings, then  it
>  should return  sym->st_name.
>
> This should be "sym->st_value".  The example in the end gets it right.

Thanks -- fixed for 3.42.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
