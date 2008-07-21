From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: math_error.7 draft 3, for review
Date: Mon, 21 Jul 2008 13:36:52 +0200
Message-ID: <cfd18e0f0807210436h558aae2cu46f0100c439a8e4a@mail.gmail.com>
References: <cfd18e0f0807160647o776d8523yb2f1ed4f0d946911@mail.gmail.com>
	 <20080716213732.GA10011@ub>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080716213732.GA10011@ub>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Cc: aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Andries,

Reading the POSIX.1 specs of various functions, I see that sometimes
they talk of the return value of a function as being +0, sometimes
+-0, and sometimes -0.  Does one need to care about this?  (e.g., in
updating them man-pages, I'm inclined to group the 0 cases togetehr,
where possible).  If one does need to care, then could you explain to
me why?  Are there cases where one gets bitten by not caring?  (I've
had a browse through the C standard, but I'm not sure that I am yet
any the wiser.)

Hmmm -- just now, I find the Wikipedia article:
http://en.wikipedia.org/wiki/%E2%88%920_(number).  So, are these the
only cases that matter (quoting test from wp):

* using the copysign() function, which is defined by IEEE 754 to copy
the sign of the zero, to some non-zero number
* dividing the number into a positive number=97the resulting Infinity
will reflect the sign of the zero.

?

It starts to sound like I should care about postive and negative zero
when rewriting the man pages, or?

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
