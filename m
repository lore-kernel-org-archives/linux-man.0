From: Ori Avtalion <ori-prZfzsrDuP2LwutG50LtGA@public.gmane.org>
Subject: Re: Small clarifications of strncasecmp docs
Date: Sun, 29 May 2016 16:23:27 +0300
Message-ID: <CALgdb5KfsYY1+pZAa4whnPa1EPTng8GGDYwU5WPSiFywsAWA4w@mail.gmail.com>
References: <CALgdb5KpgO0vYG+X31Uo3Jv8rfNKDZvASuMBYH5zmpiJLMWHKw@mail.gmail.com>
	<5ca41075-fb09-f3c5-4021-408dfbfc4003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5ca41075-fb09-f3c5-4021-408dfbfc4003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks!

Another important fix I missed in the DESCRIPTION:

"no more than n bytes of s1."

Add "and s2" at the end, as the limit also applies to s2.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
