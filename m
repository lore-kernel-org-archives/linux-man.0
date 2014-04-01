From: Kevin Lyda <kevin-lVvlXWpnww44d9/VWYMlNA@public.gmane.org>
Subject: Re: Bugs in the strtod/strtof man pages...
Date: Tue, 1 Apr 2014 21:10:46 +0100
Message-ID: <CADJ56BTnDoRd4W-fZPah1WcYXp8CYNkJ3ZKx__Z3P5g+tH3YTQ@mail.gmail.com>
References: <CADJ56BQnF=pX01y7pSyg6wOSYEc+OY4kphRMDkoUWTO+yTDpCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADJ56BQnF=pX01y7pSyg6wOSYEc+OY4kphRMDkoUWTO+yTDpCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Apr 1, 2014 at 8:55 PM, Kevin Lyda <kevin-lVvlXWpnww44d9/VWYMlNA@public.gmane.org> wrote:
> Both claim to set errno to ERANGE in under/overflow situations.  I'm
> not seeing that - errno remains unset.

Gah! I knew once I sent that mail I'd figure it out. I made my numbers
too small - once I actually got under/overflows errno was set
correctly.

Still, it would be nice if math.h got a mention for the HUGE_VAL* constants.

Kevin

-- 
Kevin Lyda
Galway, Ireland
US Citizen overseas? We can vote.
Register now: http://www.votefromabroad.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
