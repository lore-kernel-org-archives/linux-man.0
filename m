From: "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Tue, 15 Dec 2015 06:17:35 -0800
Message-ID: <CAMe9rOr_Ydg5Nr7aV8vS0vYEFehSwFBuxrMAnCFXyyVoTF4vJQ@mail.gmail.com>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
	<mvmegen94qs.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <mvmegen94qs.fsf-8jEJWzg51KSXcDkGTvBoYw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Dec 15, 2015 at 6:16 AM, Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org> wrote:
> In which way does it conflict?

On error, ((time_t) -1) is returned, and errno is set appropriately.


-- 
H.J.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
