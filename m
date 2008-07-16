From: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Subject: Re: math_error.7 draft 3, for review
Date: Wed, 16 Jul 2008 23:37:32 +0200
Message-ID: <20080716213732.GA10011@ub>
References: <cfd18e0f0807160647o776d8523yb2f1ed4f0d946911@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0807160647o776d8523yb2f1ed4f0d946911-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: aj-l3A5Bk7waGM@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Jul 16, 2008 at 03:47:41PM +0200, Michael Kerrisk wrote:

> There are two signaling mechanism:

mechanisms


> If
> .B_SVID_SOURCE
> is defined, glibc provides the older
> .I matherr ()
> error-reporting framework defined by SVID.

Typo: .B _SVID_SOURCE
But defining this does not suffice, one also needs the magic incantation
    _LIB_VERSION = _SVID_;

Example:

/* matherr demo; link with -lm */
#define _SVID_SOURCE
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int matherr(struct exception *x) {
        fprintf(stderr, "math error\n");
        exit(1);
}

int main(){
        double x;

        _LIB_VERSION = _SVID_;

        x = sqrt(-1.0);
        printf("x=%f\n", x);
        return 0;
}

Andries

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
