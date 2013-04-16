From: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] socket.7: Add info about SO_PEEK_OFF option
Date: Tue, 16 Apr 2013 22:35:39 +0400
Message-ID: <516D99FB.2080806@parallels.com>
References: <5123CE11.5060900@parallels.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5123CE11.5060900-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 02/19/2013 11:10 PM, Pavel Emelyanov wrote:
> Since Linux 3.4 there appeared an ability to specify the
> offset in bytes from which the data will be MSG_PEEK-ed.
> Describe this socket option in the socket(7) page, where
> all the other socket options are described.
> 
> Signed-off-by: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>

Michael, thank you for reminding me about pending-for-too-long
list of patches on my side. While refreshing it, I've noticed that
this patch is not yet applied. If there's anything I should fix in
it, just let me know.

Thanks,
Pavel
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
