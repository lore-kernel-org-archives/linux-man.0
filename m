From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: select.2: s/minimum/maximum/
Date: Thu, 22 Aug 2013 09:22:32 +0200
Message-ID: <5215BC38.4040201@gmail.com>
References: <20130819230019.190010@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130819230019.190010-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G.raud" <graud-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/20/13 01:00, G.raud wrote:
> In this part of the manpage:
> 
> " The timeout argument specifies the minimum interval that select()
>   should block waiting for a file descriptor to become ready.        "

This isn't correct (though maybe there is room for a better wording).

The 'timeout' places a ceiling on how long the call will block,
but that ceiling has the *minimum* value provided by the argument.
See what I mean?

Cheers,

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
