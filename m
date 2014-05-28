From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] locale.5: document glibc conventions regarding days and week
Date: Wed, 28 May 2014 13:54:08 +0200
Message-ID: <CAKgNAkivXL4KwJoL9ZzEoc91zMx2sonKh=8ZV22Waa8BrWf6bQ@mail.gmail.com>
References: <5382D64A.9020404@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5382D64A.9020404-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-locales-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Marko,

Looking at this patch more closely, there's a piece that seems to be broken.


> +Thus, a locale which week starts on Monday
> +.I first_weekday
> +and
> +.I first_workday
> +should be set to
> +.B 2
> +and
> +.I abday
> +and
> +.I day
> +should have the locale representation of Sunday as the first list item.

That sentence is garbled. Some words are missing, I think. Can you clarify?

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
