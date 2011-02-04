From: reste donewell <aqbanking-9jue/HkscOUb1SvskN2V4Q@public.gmane.org>
Subject: pthread_sigqueue.3
Date: Fri, 04 Feb 2011 08:15:50 +0100
Message-ID: <1296803750.3716.16.camel@localhost>
Reply-To: aqbanking-9jue/HkscOUb1SvskN2V4Q@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Section Retun Value:

current (3.32 (online version) )

On success, pthread_create() returns 0; on error, it returns an error
number.

should be:

On success, pthread_sigqueue() returns 0; on error, it returns an error
number.

Best regards,

Eric Thiele 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
