From: Florian Weimer <fw-d32yF4oPJVt0XxTmqZlbVQ@public.gmane.org>
Subject: Re: pow(3): warn against ineffecient uses?
Date: Fri, 31 Mar 2017 13:17:56 +0200
Message-ID: <871stdn197.fsf@mid.deneb.enyo.de>
References: <ee3b127b-5e9e-e82d-1731-172185c8ebd2@fz-juelich.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ee3b127b-5e9e-e82d-1731-172185c8ebd2-97/bSmCnXvjoK6nBLMlh1Q@public.gmane.org> (Joachim
        Wuttke's message of "Wed, 29 Mar 2017 21:35:07 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Wuttke <j.wuttke-97/bSmCnXvjoK6nBLMlh1Q@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

* Joachim Wuttke:

> Maybe it would be appropriate to warn against inefficient
> uses of the function pow. To make a very first proposal
> for a paragraph to be added to pow(3):
>
> In time-critical code, pow with small integer or simple
> fractional exponents should be avoided in favor of
> straightforward multiplication, division or square or
> cubic roots: prefer x*x over pow(x,2), 1/x over pow(x,-1),
> sqrt(x) over pow(x,0.5), or cbrt(x*x) over pow(x,2.0/3).

I don't think transforming pow (x, 2.0 / 3) to cbrt (x * x) is correct
because the result is not correctly rounded.  I'm not sure if it is a
good idea to add those examples to the manual page without discussing
the cases where the transformations might not be valid.

If GCC does not handle some of the common cases from real-world code,
that could be fixed in GCC (and GCC can do more transformations under
-ffast-math, too).
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
