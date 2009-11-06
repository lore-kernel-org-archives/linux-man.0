From: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Subject: Re: pthread_self.3: arith type or structure
Date: Fri, 6 Nov 2009 23:05:23 +0100 (CET)
Message-ID: <alpine.LSU.2.00.0911062303530.28948@obet.zrqbmnf.qr>
References: <alpine.LSU.2.00.0911060158001.12689@obet.zrqbmnf.qr> <4AF49A0E.6080004@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4AF49A0E.6080004-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bill o gallmeister <bog.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On Friday 2009-11-06 22:50, bill o gallmeister wrote:
>
>> in man-pages 3.23, one can read in pthread_self.3:
>> 
>> 
>> "POSIX.1 allows an implementation wide freedom in choosing the type
>> used to represent a thread ID; for example, representation using
>> either an arithmetic type or a structure is permitted."
>> 
>> http://opengroup.org/onlinepubs/007908799/xsh/systypes.h.html
>> however mentions "all of the types are defined as arithmetic types".
>> Would you know which of the two documentations (linux-man-pages,
>> opengroup's website) is correct?
>
>It depends on which spec the implementation conforms to.  An Opengroup conformant
>system would need to provide an arithmetic type, whereas an IEEE 1003.1c-1995
>conformant system could get away with a more relaxed specification of pthread_t.
>
>I can speak to the POSIX spec for pthread_t.  The idea was to allow it to be
>implemented as any sort of type;  hence the provision of pthread_equal() to
>compare two pthread_t variables.

I picked up the pthread_t discussion from a bit of IRC.
Later message exchanges mentioned that the specification was changed
already again in POSIX.1-2004 to make pthread_t the one exception
to the arithmetic rule; other than that, I also hear that OS_X
makes pthread_t a pointer type.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
