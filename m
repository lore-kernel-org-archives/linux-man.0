From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: select.2: s/minimum/maximum/
Date: Wed, 04 Sep 2013 10:40:50 +0200
Message-ID: <5226F212.6000709@gmail.com>
References: <20130823151009.30030@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130823151009.30030-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G.raud" <graud-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

>> One could I suppose reword something like this:
>>
>>        The timeout argument specifies the interval that select()  should
>>        block  waiting for a file descriptor to become ready.  In effect,
>>        timeout specifies a minimum interval: the timeout will be rounded
>>        up  to the system clock granularity, and kernel scheduling delays
>>        mean that the blocking interval may overrun by  a  small  amount.
>>
>> But I'm not sure that that is really much of an improvement.
> 
> I see it as a huge improvement because it does not reverse the meaning
> of timeout.

Okay -- I've the simpler patch below.

Cheers,

Michael

--- a/man2/select.2
+++ b/man2/select.2
@@ -159,12 +159,12 @@ is the highest-numbered file descriptor in any of the three sets, plus 1.
 .PP
 The
 .I timeout
-argument specifies the minimum interval that
+argument specifies the interval that
 .BR select ()
 should block waiting for a file descriptor to become ready.
-(This interval will be rounded up to the system clock granularity,
+This interval will be rounded up to the system clock granularity,
 and kernel scheduling delays mean that the blocking interval
-may overrun by a small amount.)
+may overrun by a small amount.
 If both fields of the
 .I timeval
 structure are zero, then



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
