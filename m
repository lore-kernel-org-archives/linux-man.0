From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] unix.7: add example
Date: Wed, 6 Jan 2016 22:06:21 +0100
Message-ID: <568D81CD.5010508@gmx.de>
References: <1452007033-26166-1-git-send-email-xypron.glpk@gmx.de>
 <568D277D.5000205@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <568D277D.5000205-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/06/2016 03:41 PM, Michael Kerrisk (man-pages) wrote:
> Hello Heinrich,
>
> On 01/05/2016 04:17 PM, Heinrich Schuchardt wrote:
>> A complete example demonstrating the usage of sockets for local
interprocess
>> communication is added.
>
> Thanks for doing this. I'm happy to take such a piece for the page, but
> I think things could be improved a little.
>

Hello Michael,

thank you for reviewing. I will update the patch.

http://pubs.opengroup.org/onlinepubs/009695399/functions/recv.html
has the following sentence:

The recv() function is equivalent to recvfrom() with a zero address_len
argument, and to read() if no flags are used.

Shouldn't we add this information to recv.2?

Send.2 documents the equivalences.

Best regards

Heinrich


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
